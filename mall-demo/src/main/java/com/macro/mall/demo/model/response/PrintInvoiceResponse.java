package com.macro.mall.demo.model.response;

import lombok.Data;

@Data
public class PrintInvoiceResponse {
    private String statusCode;
    private String url;
    private String notExistsCorpbillid;
    private String message;
}
