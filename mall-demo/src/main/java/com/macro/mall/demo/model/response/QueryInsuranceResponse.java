package com.macro.mall.demo.model.response;

import lombok.Data;

import java.util.List;

@Data
public class QueryInsuranceResponse {
    private String statusCode;
    private String message;
    private List<ReturnData> returnDatas;

    @Data
    public static class ReturnData {
        private String code;
        private String name;
        private String note;
    }
}
