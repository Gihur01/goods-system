package com.macro.mall.demo.service.impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.macro.mall.demo.mapper.UmsEuexMapper;
import com.macro.mall.demo.model.UmsEuex;
import com.macro.mall.demo.model.request.*;
import com.macro.mall.demo.service.PrintService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Service
public class PrintServiceImpl implements PrintService {
    private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Value("${k5.Verify.Clientid}")
    private String k5Clientid;
    @Value("${k5.Verify.Token}")
    private String k5Token;
    @Value("${k5.url}")
    private String k5url;

    @Autowired
    private UmsEuexMapper umsEuexMapper;
    @Autowired
    private TransLogServiceImpl transLogService;
    @Autowired
    private RestTemplate restTemplate;

    @Override
    public String printAddressLabel(PrintAddressRequest request) throws Exception {
        log.info("Clientid:{}", request.getVerify().getClientId());
        log.info("Token:{}", request.getVerify().getToken());

        // 验证 client_id 和 token
        UmsEuex umsEuex = umsEuexMapper.findByClientIdAndToken(request.getVerify());
        if (umsEuex == null) {
            throw new Exception("Invalid ClientId or Token");
        }

        // 创建 ObjectMapper
        ObjectMapper objectMapper = new ObjectMapper();

        // **记录修改前的 JSON 数据**
        PrintAddressRequest originalRequest = objectMapper.readValue(objectMapper.writeValueAsString(request), PrintAddressRequest.class);

        log.info("替换为我们的 client_id 和 token");
        String clientId = request.getVerify().getClientId();

        // 替换为我们的 client_id 和 token
        request.getVerify().setClientId(k5Clientid);
        request.getVerify().setToken(k5Token);

        // 调用第三方 API
        String responseJson = restTemplate.postForObject(k5url + "printOrderLabel", request, String.class);
        log.info("第三方 API 响应: {}", responseJson);

        // 解析返回的 JSON
        JsonNode responseNode = objectMapper.readTree(responseJson);
        String pdfUrl = responseNode.get("url").asText();

        if (pdfUrl == null || pdfUrl.isEmpty()) {
            throw new Exception("PDF URL is empty in response");
        }

        // 下载 PDF
        byte[] pdfBytes = downloadFile(pdfUrl);

        // 重新发布 PDF（上传到你的服务器）
        String newPdfUrl = uploadFile(pdfBytes, "printLabel.pdf");

        // 修改 JSON 返回值，把 url 改成新发布的地址
        ((ObjectNode) responseNode).put("url", newPdfUrl);
        String modifiedResponse = objectMapper.writeValueAsString(responseNode);

        // 记录日志
        transLogService.saveToFile("printOrderLabel", originalRequest, request, modifiedResponse);
        String statusCode = transLogService.extractStatusCode(modifiedResponse);
        transLogService.logRequest(clientId, "/printOrderLabel", modifiedResponse, statusCode);

        return modifiedResponse;
    }

    @Override
    public String getSupportedPapers(PrintSupportedRequest request) throws Exception {
        log.info("Clientid:{}", request.getVerify().getClientId());
        log.info("Token:{}", request.getVerify().getToken());

        // 验证 client_id 和 token
        UmsEuex umsEuex = umsEuexMapper.findByClientIdAndToken(request.getVerify());
        if (umsEuex == null) {
            throw new Exception("Invalid ClientId or Token");
        }

        // 创建 ObjectMapper
        ObjectMapper objectMapper = new ObjectMapper();

        // **记录修改前的 JSON 数据**
        PrintSupportedRequest originalRequest = objectMapper.readValue(objectMapper.writeValueAsString(request), PrintSupportedRequest.class);

        log.info("替换为我们的 client_id 和 token");
        String clientId = request.getVerify().getClientId();

        // 替换为我们的 client_id 和 token
        request.getVerify().setClientId(k5Clientid);
        request.getVerify().setToken(k5Token);

        log.info("Clientid:{}", request.getVerify().getClientId());
        log.info("Token:{}", request.getVerify().getToken());

        String response = restTemplate.postForObject(k5url+"searchPrintPaper", request, String.class);

        // 提取 statusCode
        String statusCode = transLogService.extractStatusCode(response);

        // **保存修改前后的请求数据**
        transLogService.saveToFile("searchPrintPaper", originalRequest, request, response);

        // 记录日志
        transLogService.logRequest(clientId, "/searchPrintPaper", response, statusCode);

        return response;
    }

    @Override
    public String printInvoice(PrintInvoiceRequest request) throws Exception {
        log.info("Clientid:{}", request.getVerify().getClientId());
        log.info("Token:{}", request.getVerify().getToken());

        // 验证 client_id 和 token
        UmsEuex umsEuex = umsEuexMapper.findByClientIdAndToken(request.getVerify());
        if (umsEuex == null) {
            throw new Exception("Invalid ClientId or Token");
        }

        // 创建 ObjectMapper
        ObjectMapper objectMapper = new ObjectMapper();

        // **记录修改前的 JSON 数据**
        OrderDeleteRequest originalRequest = objectMapper.readValue(objectMapper.writeValueAsString(request), OrderDeleteRequest.class);

        log.info("替换为我们的 client_id 和 token");
        String clientId = request.getVerify().getClientId();

        // 替换为我们的 client_id 和 token
        request.getVerify().setClientId(k5Clientid);
        request.getVerify().setToken(k5Token);

        log.info("Clientid:{}", request.getVerify().getClientId());
        log.info("Token:{}", request.getVerify().getToken());

        String response = restTemplate.postForObject(k5url+"printOrderInvoice", request, String.class);

        // 提取 statusCode
        String statusCode = transLogService.extractStatusCode(response);

        // **保存修改前后的请求数据**
        transLogService.saveToFile("printOrderInvoice", originalRequest, request, response);

        // 记录日志
        transLogService.logRequest(clientId, "/printOrderInvoice", response, statusCode);

        return response;
    }

    private byte[] downloadFile(String fileUrl) throws IOException {
        log.info("下载文件: {}", fileUrl);
        ResponseEntity<byte[]> response = restTemplate.exchange(fileUrl, HttpMethod.GET, null, byte[].class);
        if (response.getStatusCode() != HttpStatus.OK) {
            throw new IOException("Failed to download file: " + fileUrl);
        }
        return response.getBody();
    }

    private String uploadFile(byte[] fileBytes, String fileName) throws IOException {
        // 确定存储路径（Windows & Linux 通用）
        String uploadDir = "OrderLabel/"; // 当前项目根目录下的 OrderLabel 文件夹
        File dir = new File(uploadDir);

        // 确保目录存在
        if (!dir.exists()) {
            boolean created = dir.mkdirs();
            if (!created) {
                throw new IOException("无法创建目录: " + uploadDir);
            }
        }

        // 构造文件路径
        File file = new File(uploadDir + fileName);

        // 写入文件
        try (FileOutputStream fos = new FileOutputStream(file)) {
            fos.write(fileBytes);
        }

        log.info("文件已保存: {}", file.getAbsolutePath());

        // 生成访问 URL（假设你用 Nginx 映射了 /uploads/）
        return "https://mall-demo.com/OrderLabel/" + fileName;
    }
}
