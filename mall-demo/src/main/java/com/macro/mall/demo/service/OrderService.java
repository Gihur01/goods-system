package com.macro.mall.demo.service;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.demo.model.request.OrderCreateRequest;
import com.macro.mall.demo.model.request.OrderDeleteRequest;
import com.macro.mall.demo.model.request.OrderUpdateRequest;
import com.macro.mall.demo.model.response.OrderCreateResponse;

public interface OrderService {
    String createOrder(OrderCreateRequest request) throws Exception;

    String updateOrder(OrderUpdateRequest request) throws Exception;

    String deleteOrder(OrderDeleteRequest request) throws Exception;
}
