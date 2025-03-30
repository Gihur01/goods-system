package com.macro.mall.model;

import java.math.BigDecimal;


public class OmsOrderItemCreate {

    private Long productId;        // 商品ID
    private String productName;    // 商品名称
    private String productSn;      // 商品编号
    private String productCode;    // 商品编码
    private BigDecimal productPrice;   // 商品价格
    private Integer productQuantity;   // 商品数量
    private String productNote;        // 商品备注
    private BigDecimal realAmount;     // 实际金额

    // 无参构造函数
    public OmsOrderItemCreate() {}

    // 全参构造函数
    public OmsOrderItemCreate(Long productId, String productName, String productSn,
                              String productCode, BigDecimal productPrice,
                              Integer productQuantity, String productNote,
                              BigDecimal realAmount) {
        this.productId = productId;
        this.productName = productName;
        this.productSn = productSn;
        this.productCode = productCode;
        this.productPrice = productPrice;
        this.productQuantity = productQuantity;
        this.productNote = productNote;
        this.realAmount = realAmount;
    }

    // Getter 和 Setter 方法
    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductSn() {
        return productSn;
    }

    public void setProductSn(String productSn) {
        this.productSn = productSn;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public BigDecimal getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    public Integer getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getProductNote() {
        return productNote;
    }

    public void setProductNote(String productNote) {
        this.productNote = productNote;
    }

    public BigDecimal getRealAmount() {
        return realAmount;
    }

    public void setRealAmount(BigDecimal realAmount) {
        this.realAmount = realAmount;
    }

    @Override
    public String toString() {
        return "OmsOrderItemCreate{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", productSn='" + productSn + '\'' +
                ", productCode='" + productCode + '\'' +
                ", productPrice=" + productPrice +
                ", productQuantity=" + productQuantity +
                ", productNote='" + productNote + '\'' +
                ", realAmount=" + realAmount +
                '}';
    }
}
