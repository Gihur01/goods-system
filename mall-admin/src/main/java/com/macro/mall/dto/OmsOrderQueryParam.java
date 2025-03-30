package com.macro.mall.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * 订单查询参数
 * Created by macro on 2018/10/11.
 */
@Getter
@Setter
public class OmsOrderQueryParam {
    @ApiModelProperty(value = "订单编号")
    private String orderSn;
    @ApiModelProperty(value = "零售商编号")
    private String sales_channel_id;
    @ApiModelProperty(value = "物流国家")
    private String order_country_num;
    @ApiModelProperty(value = "收货人姓名/号码")
    private String receiverKeyword;
    @ApiModelProperty(value = "订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单")
    private Integer status;
    @ApiModelProperty(value = "订单提交时间")
    private String createTime;

    // Getter 和 Setter 方法
    public String getSalesChannelId() {
        return sales_channel_id;
    }
    public void setSalesChannelId(String sales_channel_id) {
        this.sales_channel_id = sales_channel_id;
    }
    public String getOrderCountryNum() {
        return order_country_num;
    }
    public void setOrderCountryNum(String order_country_num) {
        this.order_country_num = order_country_num;
    }
}
