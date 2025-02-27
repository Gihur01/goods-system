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
    private String warehouseId;
    @ApiModelProperty(value = "所在国家")
    private String location;
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
}
