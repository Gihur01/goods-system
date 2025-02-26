package com.macro.mall.model;

import io.swagger.annotations.ApiModelProperty;

public class PmsProductWarehouseInfo {
    private Long id;  // ✅ 改为 Long 类型

    @ApiModelProperty(value = "仓库")
    private String warehouseId;

    @ApiModelProperty(value = "国家")
    private String location;

    // Getter 和 Setter 方法
    public Long getProductId() {
        return id;
    }

    public void setProductId(Long id) {
        this.id = id;
    }

    public String getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(String warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {  // ✅ 修正参数名
        this.location = location;
    }
}
