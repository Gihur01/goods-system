package com.macro.mall.portal.domain;

import java.util.List;

public class OmsOrderDeliveryDetail {
    private String orderSn; // 订单编号
    private List<Parcel> parcels; // 包裹信息列表

    // Getter 和 Setter
    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn;
    }

    public List<Parcel> getParcels() {
        return parcels;
    }

    public void setParcels(List<Parcel> parcels) {
        this.parcels = parcels;
    }

    // 内部类：包裹信息
    public static class Parcel {
        private Long parcelId; // 包裹唯一标识
        private Delivery delivery; // 物流信息
        private List<Item> items; // 包裹内商品列表

        public Long getParcelId() {
            return parcelId;
        }

        public void setParcelId(Long parcelId) {
            this.parcelId = parcelId;
        }

        public Delivery getDelivery() {
            return delivery;
        }

        public void setDelivery(Delivery delivery) {
            this.delivery = delivery;
        }

        public List<Item> getItems() {
            return items;
        }

        public void setItems(List<Item> items) {
            this.items = items;
        }
    }

    // 内部类：物流信息
    public static class Delivery {
        private String parcelCompany; // 物流公司名称
        private String parcelSn; // 物流单号
        private int parcelStatus; // 物流状态
        private String statusDescription; // 状态描述
        private String lastOperator; // 操作人员
        private long latestUpdate; // 状态更改时间（时间戳）
        private String location; // 仓库所属国家

        public String getParcelCompany() {
            return parcelCompany;
        }

        public void setParcelCompany(String parcelCompany) {
            this.parcelCompany = parcelCompany;
        }

        public String getParcelSn() {
            return parcelSn;
        }

        public void setParcelSn(String parcelSn) {
            this.parcelSn = parcelSn;
        }

        public int getParcelStatus() {
            return parcelStatus;
        }

        public void setParcelStatus(int parcelStatus) {
            this.parcelStatus = parcelStatus;
        }

        public String getStatusDescription() {
            return statusDescription;
        }

        public void setStatusDescription(String statusDescription) {
            this.statusDescription = statusDescription;
        }

        public String getLastOperator() {
            return lastOperator;
        }

        public void setLastOperator(String lastOperator) {
            this.lastOperator = lastOperator;
        }

        public long getLatestUpdate() {
            return latestUpdate;
        }

        public void setLatestUpdate(long latestUpdate) {
            this.latestUpdate = latestUpdate;
        }

        public String getLocation() {
            return location;
        }

        public void setLocation(String location) {
            this.location = location;
        }
    }

    // 内部类：商品信息
    public static class Item {
        private String productSn; // 商品 SKU
        private String productName; // 商品名称
        private int productQuantity; // 商品数量
        private int productStatus; // 商品备货状态

        public String getProductSn() {
            return productSn;
        }

        public void setProductSn(String productSn) {
            this.productSn = productSn;
        }

        public String getProductName() {
            return productName;
        }

        public void setProductName(String productName) {
            this.productName = productName;
        }

        public int getProductQuantity() {
            return productQuantity;
        }

        public void setProductQuantity(int productQuantity) {
            this.productQuantity = productQuantity;
        }

        public int getProductStatus() {
            return productStatus;
        }

        public void setProductStatus(int productStatus) {
            this.productStatus = productStatus;
        }
    }
}
