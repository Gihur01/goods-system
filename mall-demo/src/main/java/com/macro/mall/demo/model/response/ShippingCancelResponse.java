package com.macro.mall.demo.model.response;

import lombok.Data;

import java.util.List;

@Data
public class ShippingCancelResponse {
    private String statusCode;
    private String corpBillid;
    private String message;
}
