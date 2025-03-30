package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class Insurance {
    @JsonProperty("Code")
    private String code;

    @JsonProperty("Value")
    private Double value;
}
