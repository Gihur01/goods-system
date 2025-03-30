package com.macro.mall.model;
import java.time.LocalDateTime;
import java.util.Date;
import io.swagger.annotations.ApiModelProperty;
import java.math.BigDecimal;
import java.util.List;

public class OmsOrderCreateParam {
    @ApiModelProperty(value = "订单编号")
    private String orderSn;

    @ApiModelProperty(value = "订单来源")
    private String orderChannelCode;

    @ApiModelProperty(value = "应付金额（实际支付金额）")
    private BigDecimal payAmount;

    @ApiModelProperty(value = "支付时间")
    private LocalDateTime paymentTime;

    @ApiModelProperty(value = "运费金额")
    private BigDecimal freightAmount;

    @ApiModelProperty(value = "订单备注")
    private String note;

    @ApiModelProperty(value = "用户帐号")
    private String memberUsername;

    @ApiModelProperty("订单收获地址")
    private OmsOrderReceiverAddress receiverAddress;

    @ApiModelProperty("订单商品列表")
    private List<OmsOrderItemCreate> orderItems;

    // Getter 和 Setter 方法

    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn;
    }

    public String getOrderChannelCode() {
        return orderChannelCode;
    }

    public void setOrderChannelCode(String orderChannelCode) {
        this.orderChannelCode = orderChannelCode;
    }

    public BigDecimal getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(BigDecimal payAmount) {
        this.payAmount = payAmount;
    }

    public LocalDateTime getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(LocalDateTime paymentTime) {
        this.paymentTime = paymentTime;
    }

    public BigDecimal getFreightAmount() {
        return freightAmount;
    }

    public void setFreightAmount(BigDecimal freightAmount) {
        this.freightAmount = freightAmount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getMemberUsername() {
        return memberUsername;
    }

    public void setMemberUsername(String memberUsername) {
        this.memberUsername = memberUsername;
    }

    public OmsOrderReceiverAddress getReceiverAddress() {
        return receiverAddress;
    }

    public void setReceiverAddress(OmsOrderReceiverAddress receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    public List<OmsOrderItemCreate> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OmsOrderItemCreate> orderItems) {
        this.orderItems = orderItems;
    }

}