package com.macro.mall.demo.service.impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.macro.mall.common.api.CommonResult;
import com.macro.mall.demo.mapper.TransLogMapper;
import com.macro.mall.demo.mapper.UmsEuexMapper;
import com.macro.mall.demo.model.TransLog;
import com.macro.mall.demo.model.UmsEuex;
import com.macro.mall.demo.model.request.OrderCreateRequest;
import com.macro.mall.demo.model.request.OrderDeleteRequest;
import com.macro.mall.demo.model.request.OrderUpdateRequest;
import com.macro.mall.demo.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class OrderServiceImpl implements OrderService {
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
    public String createOrder(OrderCreateRequest request) throws Exception {
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
        OrderCreateRequest originalRequest = objectMapper.readValue(objectMapper.writeValueAsString(request), OrderCreateRequest.class);

        log.info("替换为我们的 client_id 和 token");
        String clientId = request.getVerify().getClientId();

        // 替换为我们的 client_id 和 token
        request.getVerify().setClientId(k5Clientid);
        request.getVerify().setToken(k5Token);

        log.info("Clientid:{}", request.getVerify().getClientId());
        log.info("Token:{}", request.getVerify().getToken());

        String response = restTemplate.postForObject(k5url+"createOrder", request, String.class);

        // 提取 statusCode
        String statusCode = transLogService.extractStatusCode(response);

        // **保存修改前后的请求数据**
        transLogService.saveToFile("createOrder", originalRequest, request, response);

        // 记录日志
        transLogService.logRequest(clientId, "/createOrder", response, statusCode);

        return response;
    }

    @Override
    public String updateOrder(OrderUpdateRequest request) throws Exception {
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
        OrderUpdateRequest originalRequest = objectMapper.readValue(objectMapper.writeValueAsString(request), OrderUpdateRequest.class);

        log.info("替换为我们的 client_id 和 token");
        String clientId = request.getVerify().getClientId();

        // 替换为我们的 client_id 和 token
        request.getVerify().setClientId(k5Clientid);
        request.getVerify().setToken(k5Token);

        log.info("Clientid:{}", request.getVerify().getClientId());
        log.info("Token:{}", request.getVerify().getToken());

        String response = restTemplate.postForObject(k5url+"updateOrder", request, String.class);

        // 提取 statusCode
        String statusCode = transLogService.extractStatusCode(response);

        // **保存修改前后的请求数据**
        transLogService.saveToFile("updateOrder", originalRequest, request, response);

        // 记录日志
        transLogService.logRequest(clientId, "/updateOrder", response, statusCode);

        return response;
    }

    @Override
    public String deleteOrder(OrderDeleteRequest request) throws Exception {
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

        String response = restTemplate.postForObject(k5url+"deleteOrder", request, String.class);

        // 提取 statusCode
        String statusCode = transLogService.extractStatusCode(response);

        // **保存修改前后的请求数据**
        transLogService.saveToFile("deleteOrder", originalRequest, request, response);

        // 记录日志
        transLogService.logRequest(clientId, "/deleteOrder", response, statusCode);

        return response;
    }
}
