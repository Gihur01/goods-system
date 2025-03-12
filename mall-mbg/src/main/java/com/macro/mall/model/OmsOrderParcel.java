package com.macro.mall.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class OmsOrderParcel {
    @ApiModelProperty(value = "包裹单id")
    private Long id;
    @ApiModelProperty(value = "订单id")
    private Long orderId;
    @ApiModelProperty(value = "仓库编号")
    private Long warehouseId;
    @ApiModelProperty(value = "所在国家")
    private String location;
    @ApiModelProperty(value = "物流公司")
    private String parcelCompany;
    @ApiModelProperty(value = "包裹编号")
    private String parcelSn;
    @ApiModelProperty(value = "包裹状态")
    private Integer parcelStatus;
    @ApiModelProperty(value = "发货时间")
    private Timestamp shippingTime;
    @ApiModelProperty(value = "签收时间")
    private Timestamp receivedTime;
    @ApiModelProperty(value = "创建时间")
    private Timestamp createTime;
    @ApiModelProperty(value = "删除状态")
    private Integer deleteStatus;

    public Long getOrderId() {
        return orderId;
    }
    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }
    public Long getWarehouseId() {
        return warehouseId;
    }
    public void setWarehouseId(Long warehouseId) {
        this.warehouseId = warehouseId;
    }
    public String getParcelSn() {
        return parcelSn;
    }
    public void setParcelSn(String parcelSn) {
        this.parcelSn = parcelSn;
    }
    public Integer getParcelStatus() {
        return parcelStatus;
    }
    public void setParcelStatus(Integer parcelStatus) {
        this.parcelStatus = parcelStatus;
    }

}
