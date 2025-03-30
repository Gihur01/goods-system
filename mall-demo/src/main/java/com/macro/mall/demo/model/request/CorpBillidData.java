package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class CorpBillidData {
    @JsonProperty("CorpBillid")
    private String corpBillid;
}
