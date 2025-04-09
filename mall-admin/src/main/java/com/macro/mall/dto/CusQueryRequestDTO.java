package com.macro.mall.dto;

import lombok.Data;

@Data
public class CusQueryRequestDTO {
    private String waybillNumber;
    private String customerOrderNumber;
    private String fwTrackingNumber;

    // Getter & Setter
    public String getWaybillNumber() {
        return waybillNumber;
    }

    public void setWaybillNumber(String waybillNumber) {
        this.waybillNumber = waybillNumber;
    }

    public String getCustomerOrderNumber() {
        return customerOrderNumber;
    }

    public void setCustomerOrderNumber(String customerOrderNumber) {
        this.customerOrderNumber = customerOrderNumber;
    }

    public String getFwTrackingNumber() {
        return fwTrackingNumber;
    }

    public void setFwTrackingNumber(String fwTrackingNumber) {
        this.fwTrackingNumber = fwTrackingNumber;
    }
}
