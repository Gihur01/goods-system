package com.macro.mall.demo.model.response;

import lombok.Data;

import java.util.List;

@Data
public class QueryTrackingResponse {
    private String statusCode;
    private List<ReturnData> returnDatas;

    @Data
    public static class ReturnData {
        private String statusCode;
        private String trackNumber;
        private String message;
        private Track track;
        private List<Item> items;
    }
    @Data
    public static class Track {
        private String billid;
        private String transBillid;
        private String country;
        private String destination;
        private String dateTime;
        private String status;
    }
    @Data
    public static class Item {
        private String location;
        private String info;
        private String dateTime;
    }
}
