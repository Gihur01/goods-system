package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class QueryPriceRequest {
    @JsonProperty("Verify")
    private Verify verify;

    @JsonProperty("Data")
    private com.macro.mall.demo.model.request.Data data;
}
