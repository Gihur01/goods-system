package com.macro.mall.demo.model.response;

import lombok.Data;

import java.util.List;

@Data
public class ShippingTransferResponse {
    private String statusCode;
    private List<ReturnData> returnDatas;

    @Data
    public static class ReturnData {
        private String statusCode;
        private String corpBillid;
        private String customerNumber;
        private String trackNumber;
        private String message;
    }
}
