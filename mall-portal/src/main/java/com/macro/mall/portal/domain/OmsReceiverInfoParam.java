package com.macro.mall.portal.domain;

import com.macro.mall.model.OmsOrderReceiverAddress;
import io.swagger.annotations.ApiModelProperty;

public class OmsReceiverInfoParam {

    @ApiModelProperty(value = "订单编号")
    private String orderSn;
    @ApiModelProperty("订单收获地址")
    private OmsOrderReceiverAddress receiverAddress;

    // Getter 和 Setter 方法
    public String getOrderSn() {
        return orderSn;
    }
    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn;
    }
    public OmsOrderReceiverAddress getReceiverAddress() {
        return receiverAddress;
    }
    public void setReceiverAddress(OmsOrderReceiverAddress receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

}
