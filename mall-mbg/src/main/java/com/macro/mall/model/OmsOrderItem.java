package com.macro.mall.model;

import io.swagger.annotations.ApiModelProperty;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import lombok.Data;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
public class OmsOrderItem implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private Long orderId;
    private String orderSn;
    private Long parcelId;
    private Integer itemStatus;
    private Long warehouseId;
    private String location;
    private Long productId;
    private String productPic;
    private Long productSkuId;
    private String productName;
    private String productSn;
    private String productCode;
    private String productSkuCode;
    private BigDecimal productPrice;
    private Integer productQuantity;
    private String productAttr;
    private String productNote;
    private String promotionName;
    private BigDecimal promotionAmount;
    private BigDecimal couponAmount;
    private BigDecimal integrationAmount;
    private BigDecimal realAmount;
    private Integer giftIntegration;
    private Integer giftGrowth;
    private Integer deleteStatus;
}
