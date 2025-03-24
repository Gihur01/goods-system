package com.macro.mall.demo.controller;

import com.macro.mall.demo.model.request.OrderCreateRequest;
import com.macro.mall.demo.model.request.OrderDeleteRequest;
import com.macro.mall.demo.model.request.OrderUpdateRequest;
import com.macro.mall.demo.service.OrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Api(tags = "订单管理接口")
@Tag(name = "订单管理接口", description = "包含订单创建、修改、删除等操作")
@RequestMapping("/orders")
public class OrderController {
    private static final Logger log = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private OrderService orderService;

    @ApiOperation("创建订单（支持快件/仓储/快递制单）")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ResponseEntity<?> createOrder(@RequestBody OrderCreateRequest request) {
        try {
            // 调用服务层处理请求
            String response = orderService.createOrder(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
                    body("Error in creating order: " + e.getMessage());
        }
    }

    @ApiOperation("修改订单（支持快件/仓储/快递制单）")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ResponseEntity<?> updateOrder(@RequestBody OrderUpdateRequest request) {
        try {
            String response = orderService.updateOrder(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error in updating order: " + e.getMessage());
        }
    }

    @ApiOperation("删除订单（支持快件/仓储/快递制单）")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public ResponseEntity<?> deleteOrder(@RequestBody OrderDeleteRequest request) {
        try {
            String response = orderService.deleteOrder(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error in deleting order: " + e.getMessage());
        }
    }
}