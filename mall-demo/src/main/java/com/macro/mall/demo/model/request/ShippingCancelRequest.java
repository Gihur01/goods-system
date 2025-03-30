package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class ShippingCancelRequest {
    @JsonProperty("Verify")
    private Verify verify;
    @JsonProperty("CorpBillid")
    private String corpBillid;
}
