package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class FeeInfo {
    @JsonProperty("OrderAmt")
    private String orderAmt;

    @JsonProperty("Mfees")
    private String mfees;

    @JsonProperty("OtherAmt")
    private String otherAmt;

    @JsonProperty("OtherNote")
    private String otherNote;

    @JsonProperty("IsPaperLess")
    private String isPaperLess;

    @JsonProperty("ExportType")
    private String exportType;

    @JsonProperty("TermsOfShipment")
    private String termsOfShipment;
}
