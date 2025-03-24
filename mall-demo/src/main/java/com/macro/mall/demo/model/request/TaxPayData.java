package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class TaxPayData {
    @JsonProperty("TaxPayType")
    private String taxPayType;

    @JsonProperty("TaxPayAccountNumber")
    private String taxPayAccountNumber;

    @JsonProperty("TaxPayCountryCode")
    private String taxPayCountryCode;

    @JsonProperty("TaxPayPostCode")
    private String taxPayPostCode;
}
