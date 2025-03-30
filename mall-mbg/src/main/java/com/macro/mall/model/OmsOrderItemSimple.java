package com.macro.mall.model;

import io.swagger.annotations.ApiModelProperty;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class OmsOrderItemSimple {

    // 商品名称
    private String productName;

    // 商品编号
    private String productSn;

    // 商品编码
    private String productCode;

    // 商品数量
    private Integer productQuantity;

    // 商品销售属性
    private String productAttr;

    // 商品备注
    private String productNote;


    // Getter 和 Setter 方法
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

    public Integer getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getProductAttr() {
        return productAttr;
    }

    public void setProductAttr(String productAttr) {
        this.productAttr = productAttr;
    }

    public String getProductNote() {
        return productNote;
    }

    public void setProductNote(String productNote) {
        this.productNote = productNote;
    }

    @Override
    public String toString() {
        return "OmsOrderItemSimple{" +
                "productName='" + productName + '\'' +
                ", productSn='" + productSn + '\'' +
                ", productCode='" + productCode + '\'' +
                ", productQuantity=" + productQuantity +
                ", productAttr='" + productAttr + '\'' +
                ", productNote='" + productNote + '\'' +
                '}';
    }
}
