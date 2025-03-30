package com.macro.mall.demo.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class OrderUpdateRequest {
    @JsonProperty("Verify")
    private Verify verify;
    @JsonProperty("OrderType")
    private String orderType;
    @JsonProperty("OrderDatas")
    private List<OrderData> orderDatas;
}
