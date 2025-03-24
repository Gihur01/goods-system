package com.macro.mall.demo.model.request;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class Volume {
    @JsonProperty("Weight")
    private String weight;

    @JsonProperty("Number")
    private String number;

    @JsonProperty("Length")
    private String length;

    @JsonProperty("Width")
    private String width;

    @JsonProperty("Height")
    private String height;

    @JsonProperty("Value")
    private String value;
}