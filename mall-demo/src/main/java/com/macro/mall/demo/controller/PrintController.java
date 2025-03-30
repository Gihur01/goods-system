package com.macro.mall.demo.controller;

import com.macro.mall.demo.model.request.PrintAddressRequest;
import com.macro.mall.demo.model.request.PrintInvoiceRequest;
import com.macro.mall.demo.model.request.PrintSupportedRequest;
import com.macro.mall.demo.service.PrintService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@Api(tags = "打印服务接口")
@Tag(name = "打印服务接口", description = "标签和发票打印相关")
@RequestMapping("/print")
public class PrintController {

    @Autowired
    private PrintService printService;

    @ApiOperation("打印地址标签")
    @RequestMapping(value = "/address-label", method = RequestMethod.POST)
    public ResponseEntity<?> printAddressLabel(@RequestBody PrintAddressRequest request) {
        try {
            // 调用服务层处理请求，返回 PDF 字节流
            byte[] pdfBytes = printService.printAddressLabel(request);

            // 返回 PDF 文件流
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_PDF);
            headers.setContentDisposition(ContentDisposition.attachment()
                    .filename("address_label.pdf")
                    .build());

            return ResponseEntity.ok()
                    .headers(headers)
                    .body(pdfBytes);

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error in printAddressLabel: " + e.getMessage());
        }
    }

    @ApiOperation("根据渠道查询支持的打印纸张")
    @RequestMapping(value = "/supported-papers", method = RequestMethod.POST)
    public ResponseEntity<?> getSupportedPapers(@RequestBody PrintSupportedRequest request) {
        try {
            // 调用服务层处理请求
            String response = printService.getSupportedPapers(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
                    body("Error in getSupportedPapers: " + e.getMessage());
        }
    }

    @ApiOperation("打印订单发票")
    @RequestMapping(value = "/invoice", method = RequestMethod.POST)
    public ResponseEntity<?> printInvoice(@RequestBody PrintInvoiceRequest request) {
        try {
            // 调用服务层处理请求
            String response = printService.printInvoice(request);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).
                    body("Error in printInvoice: " + e.getMessage());
        }
    }
}