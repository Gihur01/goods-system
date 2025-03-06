package com.macro.mall.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class OmsOrderParcelQueryParam {

    @ApiModelProperty(value = "仓库编号")
    private List<Long> warehouseId;

    @ApiModelProperty(value = "所在国家")
    private String location;

    @ApiModelProperty(value = "包裹状态")
    private List<Integer> parcelStatus;


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
