package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;

@lombok.Data
public class Data {
    @JsonProperty("CountryCode")
    private String countryCode;

    @JsonProperty("Weight")
    private Double weight;

    @JsonProperty("GoodsType")
    private String goodsType;

    @JsonProperty("PostCode")
    private String postCode;

    @JsonProperty("TrackNumber")
    private String trackNumber;
}
