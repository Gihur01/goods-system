package com.macro.mall.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class OmsOrderItemQueryParam {

    @ApiModelProperty(value = "订单商品项ID")
    private Long id;

    @ApiModelProperty(value = "订单ID")
    private Long orderId;

    @ApiModelProperty(value = "订单编号")
    private String orderSn;

    @ApiModelProperty(value = "仓库编号")
    private List<Long> warehouseId;

    @ApiModelProperty(value = "所在国家")
    private String location;

    @ApiModelProperty(value = "商品ID")
    private Long productId;

    @ApiModelProperty(value = "商品名称")
    private String productName;


    // Getter 和 Setter 方法
    public List<Long> getWarehouseId() {
        return warehouseId;
    }
    public void setWarehouseId(List<Long> warehouseId) {
        this.warehouseId = warehouseId;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
}
