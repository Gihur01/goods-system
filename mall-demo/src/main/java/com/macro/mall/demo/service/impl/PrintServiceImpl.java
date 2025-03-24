package com.macro.mall.demo.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.macro.mall.demo.mapper.UmsEuexMapper;
import com.macro.mall.demo.model.UmsEuex;
import com.macro.mall.demo.model.request.*;
import com.macro.mall.demo.service.PrintService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

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

        log.info("Clientid:{}", request.getVerify().getClientId());
        log.info("Token:{}", request.getVerify().getToken());

        String response = restTemplate.postForObject(k5url+"printOrderLabel", request, String.class);

        // 提取 statusCode
        String statusCode = transLogService.extractStatusCode(response);

        // **保存修改前后的请求数据**
        transLogService.saveToFile("printOrderLabel", originalRequest, request, response);

        // 记录日志
        transLogService.logRequest(clientId, "/printOrderLabel", response, statusCode);

        return response;
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
}
