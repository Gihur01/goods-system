package com.macro.mall.demo.controller;

import com.macro.mall.demo.model.request.ShippingCancelRequest;
import com.macro.mall.demo.model.request.ShippingTransferRequest;
import com.macro.mall.demo.service.QueryService;
import com.macro.mall.demo.service.ShippingService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Api(tags = "快递管理接口")
@Tag(name = "快递管理接口", description = "快递相关操作")
@RequestMapping("/shipping")
public class ShippingController {
    @Autowired
    private ShippingService shippingService;

    @ApiOperation("取消发货")
    @RequestMapping(value = "/cancel", method = RequestMethod.POST)
    public ResponseEntity<?> cancelShipping(@RequestBody ShippingCancelRequest request) {
        try {
            // 调用服务层处理请求
            String response = shippingService.cancelShipping(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
                    body("Error in cancelShipping: " + e.getMessage());
        }
    }

    @ApiOperation("根据公司单号提取转单号")
    @RequestMapping(value = "/transfer-number", method = RequestMethod.POST)
    public ResponseEntity<?> getTransferNumber(@RequestBody ShippingTransferRequest request) {
        try {
            // 调用服务层处理请求
            String response = shippingService.getTransferNumber(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
                    body("Error in getTransferNumber: " + e.getMessage());
        }
    }
}