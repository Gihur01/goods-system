package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class OrderItem {
    @JsonProperty("Sku")
    private String sku;

    @JsonProperty("Cnname")
    private String cnname;

    @JsonProperty("Enname")
    private String enname;

    @JsonProperty("Price")
    private double price;

    @JsonProperty("SingleWeight")
    private double singleWeight;

    @JsonProperty("Num")
    private int num;

    @JsonProperty("Money")
    private String money;

    @JsonProperty("Unit")
    private String unit;

    @JsonProperty("ProductLink")
    private String productLink;

    @JsonProperty("PackageNo")
    private String packageNo;

    @JsonProperty("Texture")
    private String texture;

    @JsonProperty("Application")
    private String application;

    @JsonProperty("CustomsCode")
    private String customsCode;

    @JsonProperty("TransactionUrl")
    private String transactionUrl;

    @JsonProperty("PeihuoInfo")
    private String peihuoInfo;

    @JsonProperty("Origin")
    private String origin;
}