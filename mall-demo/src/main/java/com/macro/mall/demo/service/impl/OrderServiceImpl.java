package com.macro.mall.demo.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.macro.mall.demo.mapper.UmsEuexMapper;
import com.macro.mall.demo.model.UmsEuex;
import com.macro.mall.demo.model.request.OrderCreateRequest;
import com.macro.mall.demo.model.request.OrderData;
import com.macro.mall.demo.model.request.OrderDeleteRequest;
import com.macro.mall.demo.model.request.OrderUpdateRequest;
import com.macro.mall.demo.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {
    private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Value("${k5.Verify.Clientid}")
    private String k5Clientid;
    @Value("${k5.Verify.Token}")
    private String k5Token;
    @Value("${k5.Verify.ClientidUPS}")
    private String k5ClientidUPS;
    @Value("${k5.Verify.TokenUPS}")
    private String k5TokenUPS;
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
//        log.info("Clientid:{}", request.getVerify().getClientId());
//        log.info("Token:{}", request.getVerify().getToken());

        // 验证 client_id 和 token
        UmsEuex umsEuex = umsEuexMapper.findByClientIdAndToken(request.getVerify());
        if (umsEuex == null) {
            throw new Exception("Invalid ClientId or Token");
        }

        // 记录原始请求
        ObjectMapper objectMapper = new ObjectMapper();
        OrderCreateRequest originalRequest = objectMapper.readValue(objectMapper.writeValueAsString(request), OrderCreateRequest.class);

//        log.info("拆分 OrderDatas，根据 ChannelCode 进行分类");

        // 获取 OrderDatas
        List<OrderData> orderDatas = request.getOrderDatas();
        List<OrderData> upsWlyBeOrders = new ArrayList<>();
        List<OrderData> otherOrders = new ArrayList<>();

        if (orderDatas != null && !orderDatas.isEmpty()) {
            for (OrderData orderData : orderDatas) {
                orderData.setSender(null);
                if ("UPS_WLY_Be".equals(orderData.getChannelCode()) || "UPS_DE_Bet".equals(orderData.getChannelCode())) {
                    upsWlyBeOrders.add(orderData);
                } else {
                    otherOrders.add(orderData);
                }
            }
        }

        // 结果合并
        Map<String, Object> finalResponse = new HashMap<>();
        String response1 = null, response2 = null;

        // 处理 "UPS_WLY_Be" 订单
        if (!upsWlyBeOrders.isEmpty()) {
//            log.info("处理 UPS 订单，数量: {}", upsWlyBeOrders.size());

            OrderCreateRequest upsWlyBeRequest = objectMapper.readValue(objectMapper.writeValueAsString(request), OrderCreateRequest.class);
            upsWlyBeRequest.getVerify().setClientId(k5ClientidUPS);
            upsWlyBeRequest.getVerify().setToken(k5TokenUPS);
            upsWlyBeRequest.setOrderDatas(upsWlyBeOrders);

            try {
                response1 = restTemplate.postForObject(k5url + "createOrder", upsWlyBeRequest, String.class);
                finalResponse.put("UPS_Response", response1);
            } catch (Exception e) {
                log.error("UPS 请求失败: {}", e.getMessage());
                finalResponse.put("UPS_Error", e.getMessage());
            }

            // 记录日志
            transLogService.saveToFile("createOrder_UPS", originalRequest, upsWlyBeRequest, response1);
            transLogService.logRequest(k5Clientid, "/createOrder", response1, transLogService.extractStatusCode(response1));
        }

        // 处理其他订单
        if (!otherOrders.isEmpty()) {
//            log.info("处理其他订单，数量: {}", otherOrders.size());

            OrderCreateRequest otherRequest = objectMapper.readValue(objectMapper.writeValueAsString(request), OrderCreateRequest.class);
            otherRequest.getVerify().setClientId(k5Clientid);
            otherRequest.getVerify().setToken(k5Token);
            otherRequest.setOrderDatas(otherOrders);

            try {
                response2 = restTemplate.postForObject(k5url + "createOrder", otherRequest, String.class);
                finalResponse.put("Response", response2);
            } catch (Exception e) {
                log.error("订单请求失败: {}", e.getMessage());
                finalResponse.put("Error", e.getMessage());
            }

            // 记录日志
            transLogService.saveToFile("createOrder_Others", originalRequest, otherRequest, response2);
            transLogService.logRequest(k5ClientidUPS, "/createOrder", response2, transLogService.extractStatusCode(response2));
        }

        // 返回合并的 JSON 响应
        return objectMapper.writeValueAsString(finalResponse);
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
