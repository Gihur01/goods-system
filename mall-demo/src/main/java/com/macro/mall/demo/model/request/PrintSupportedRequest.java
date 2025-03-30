package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class PrintSupportedRequest {
    @JsonProperty("Verify")
    private Verify verify;

    @JsonProperty("ChannelCode")
    private String channelCode;
}
