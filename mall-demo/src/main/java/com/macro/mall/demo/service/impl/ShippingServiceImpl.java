package com.macro.mall.demo.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.macro.mall.demo.mapper.UmsEuexMapper;
import com.macro.mall.demo.model.UmsEuex;
import com.macro.mall.demo.model.request.*;
import com.macro.mall.demo.service.ShippingService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class ShippingServiceImpl implements ShippingService {
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
    public String cancelShipping(ShippingCancelRequest request) throws Exception {
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
        ShippingCancelRequest originalRequest = objectMapper.readValue(objectMapper.writeValueAsString(request), ShippingCancelRequest.class);

        log.info("替换为我们的 client_id 和 token");
        String clientId = request.getVerify().getClientId();

        // 替换为我们的 client_id 和 token
        request.getVerify().setClientId(k5Clientid);
        request.getVerify().setToken(k5Token);

        log.info("Clientid:{}", request.getVerify().getClientId());
        log.info("Token:{}", request.getVerify().getToken());

        String response = restTemplate.postForObject(k5url+"cancelDelivery", request, String.class);

        // 提取 statusCode
        String statusCode = transLogService.extractStatusCode(response);

        // **保存修改前后的请求数据**
        transLogService.saveToFile("cancelDelivery", originalRequest, request, response);

        // 记录日志
        transLogService.logRequest(clientId, "/cancelDelivery", response, statusCode);

        return response;
    }

    @Override
    public String getTransferNumber(ShippingTransferRequest request) throws Exception {
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
        ShippingTransferRequest originalRequest = objectMapper.readValue(objectMapper.writeValueAsString(request), ShippingTransferRequest.class);

        log.info("替换为我们的 client_id 和 token");
        String clientId = request.getVerify().getClientId();

        // 替换为我们的 client_id 和 token
        request.getVerify().setClientId(k5Clientid);
        request.getVerify().setToken(k5Token);

        log.info("Clientid:{}", request.getVerify().getClientId());
        log.info("Token:{}", request.getVerify().getToken());

        String response = restTemplate.postForObject(k5url+"searchOrderTracknumber", request, String.class);

        // 提取 statusCode
        String statusCode = transLogService.extractStatusCode(response);

        // **保存修改前后的请求数据**
        transLogService.saveToFile("searchOrderTracknumber", originalRequest, request, response);

        // 记录日志
        transLogService.logRequest(clientId, "/searchOrderTracknumber", response, statusCode);

        return response;
    }

}
