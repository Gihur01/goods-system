package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class ShippingTransferRequest {
    @JsonProperty("OrderType")
    private String orderType;

    @JsonProperty("Verify")
    private Verify verify;

    @JsonProperty("ChannelCode")
    private String channelCode;

    @JsonProperty("CorpBillidDatas")
    private List<CorpBillidData> corpBillidDatas;
}
