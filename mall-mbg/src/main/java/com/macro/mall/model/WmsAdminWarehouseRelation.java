package com.macro.mall.model;

import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

public class WmsAdminWarehouseRelation implements Serializable {

    private Long adminId;

    private Long warehouseId;

    @ApiModelProperty(value = "管理员 ID")
    public Long getAdminId() {
        return adminId;
    }

    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }

    @ApiModelProperty(value = "仓库 ID")
    public Long getWarehouseId() {
        return warehouseId;
    }

    public void setWarehouseId(Long warehouseId) {
        this.warehouseId = warehouseId;
    }
}
