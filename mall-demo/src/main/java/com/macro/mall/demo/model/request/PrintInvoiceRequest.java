package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class PrintInvoiceRequest {
    @JsonProperty("Verify")
    private Verify verify;

    @JsonProperty("CorpBillidDatas")
    private List<CorpBillidData> corpBillidDatas;
}
