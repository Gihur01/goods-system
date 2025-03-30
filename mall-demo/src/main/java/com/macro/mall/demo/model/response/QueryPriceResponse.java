package com.macro.mall.demo.model.response;

import lombok.Data;

import java.util.List;

@Data
public class QueryPriceResponse {
    private String statusCode;
    private List<ReturnData> returnDatas;

    @Data
    public static class ReturnData {
        private String countryCode;
        private String countryName;
        private String channelCode;
        private String channelName;
        private String ccyCode;
        private String ccyName;
        private String priceName;
        private String weight;
        private String mweight;
        private String formula;
        private String rebate;
        private String fuel;
        private String feeAmt;
        private String sendtime;
        private String priceNote;
        private String productName;
        private String mcalid;
    }
}
