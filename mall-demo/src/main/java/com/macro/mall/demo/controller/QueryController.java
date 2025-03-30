package com.macro.mall.demo.controller;

import com.macro.mall.demo.model.request.QueryInsuranceRequest;
import com.macro.mall.demo.model.request.QueryPriceRequest;
import com.macro.mall.demo.model.request.QueryTrackingRequest;
import com.macro.mall.demo.model.request.QueryWarehouseRequest;
import com.macro.mall.demo.service.QueryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Api(tags = "查询服务接口")
@Tag(name = "查询服务接口", description = "各类查询服务")
@RequestMapping("/query")
public class QueryController {

    @Autowired
    private QueryService queryService;

    @ApiOperation("查询启用的入仓渠道")
    @RequestMapping(value = "/warehouse-channels", method = RequestMethod.POST)
    public ResponseEntity<?> getActiveChannels(@RequestBody QueryWarehouseRequest request) {
        try {
            // 调用服务层处理请求
            String response = queryService.getActiveChannels(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
                    body("Error in getActiveChannels: " + e.getMessage());
        }
    }

    @ApiOperation("查询保险类型")
    @RequestMapping(value = "/insurance-types", method = RequestMethod.POST)
    public ResponseEntity<?> getInsuranceTypes(@RequestBody QueryInsuranceRequest request) {
        try {
            // 调用服务层处理请求
            String response = queryService.getInsuranceTypes(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
                    body("Error in getInsuranceTypes: " + e.getMessage());
        }
    }

    @ApiOperation("查价格")
    @RequestMapping(value = "/price", method = RequestMethod.POST)
    public ResponseEntity<?> calculatePrice(@RequestBody QueryPriceRequest request) {
        try {
            // 调用服务层处理请求
            String response = queryService.calculatePrice(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
                    body("Error in calculatePrice: " + e.getMessage());
        }
    }

    @ApiOperation("查轨迹")
    @RequestMapping(value = "/tracking", method = RequestMethod.POST)
    public ResponseEntity<?> getTrackingInfo(@RequestBody QueryTrackingRequest request) {
        try {
            // 调用服务层处理请求
            String response = queryService.getTrackingInfo(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
                    body("Error in getTrackingInfo: " + e.getMessage());
        }
    }
}