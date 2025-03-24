package com.macro.mall.demo.model.response;

import lombok.Data;

import java.util.List;

@Data
public class QueryWarehouseResponse {
    private String statusCode;
    private List<ReturnData> returnDatas;

    @Data
    public static class ReturnData {
        private String code;
        private String cnname;
        private String enname;
        private String status;
        private String ifColl;
    }
}
