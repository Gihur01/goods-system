package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class FeePayData {
    @JsonProperty("FeePayType")
    private String feePayType;

    @JsonProperty("FeePayAccountNumber")
    private String feePayAccountNumber;

    @JsonProperty("FeePayCountryCode")
    private String feePayCountryCode;

    @JsonProperty("FeePayPostCode")
    private String feePayPostCode;
}
