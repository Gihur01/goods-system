package com.macro.mall.model;

import io.swagger.annotations.ApiModelProperty;

public class PmsProductWarehouseInfo {
    private Long id;  // ✅ 改为 Long 类型

    @ApiModelProperty(value = "仓库")
    private Long warehouseId;

    @ApiModelProperty(value = "国家")
    private String location;

    // Getter 和 Setter 方法
    public Long getProductId() {
        return id;
    }

    public void setProductId(Long id) {
        this.id = id;
    }

    public Long getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Long warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {  // ✅ 修正参数名
        this.location = location;
    }
}
