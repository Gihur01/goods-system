package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class PrintAddressRequest {
    @JsonProperty("Verify")
    private Verify verify;

    @JsonProperty("CorpBillidDatas")
    private List<CorpBillidData> corpBillidDatas;

    @JsonProperty("ChannelCode")
    private String channelCode;

    @JsonProperty("OrderType")
    private String orderType;

    @JsonProperty("PrintPaper")
    private String printPaper;

    @JsonProperty("PrintContent")
    private String printContent;

    @JsonProperty("IsPrintByGoodsnum")
    private String isPrintByGoodsnum;
}
