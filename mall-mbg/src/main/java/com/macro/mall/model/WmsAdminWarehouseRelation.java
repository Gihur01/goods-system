package com.macro.mall.model;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

public class WmsAdminWarehouseRelation implements Serializable {

    private Long warehouseId;  // 对应 warehouse_id
    private String name;       // 仓库名称
    private String location;   // 仓库位置

    // Getter 和 Setter 方法
    public Long getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Long warehouseId) {
        this.warehouseId = warehouseId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "WmsWarehouse{" +
                "warehouseId=" + warehouseId +
                ", name='" + name + '\'' +
                ", location='" + location + '\'' +
                '}';
    }
}
