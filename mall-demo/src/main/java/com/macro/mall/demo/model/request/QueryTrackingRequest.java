package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

@lombok.Data
public class QueryTrackingRequest {
    @JsonProperty("Verify")
    private Verify verify;

    @JsonProperty("Datas")
    private List<Data> datas;
}
