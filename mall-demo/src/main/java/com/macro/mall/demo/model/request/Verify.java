package com.macro.mall.demo.model.request;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

@Data
public class Verify {
    @JsonProperty("Clientid")
    private String clientId;
    @JsonProperty("Token")
    private String token;
}
