package com.macro.mall.dto;

import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

@Data
public class CusLogisticsBaseDTO {

    @ExcelProperty("ID")
    private Integer id;

    @ExcelProperty("Receive Date")
    private String receiveDate;

    @ExcelProperty("Receive Time")
    private String receiveTime;

    @ExcelProperty("Waybill Number")
    private String waybillNumber;

    @ExcelProperty("Customer Order Number")
    private String customerOrderNumber;

    @ExcelProperty("FW Tracking Number")
    private String fwTrackingNumber;

    @ExcelProperty("Container Number")
    private String containerNumber;

    @ExcelProperty("Status")
    private String status;

    @ExcelProperty("Logistics Channel")
    private String logisticsChannel;

    @ExcelProperty("Loading Port")
    private String loadingPort;

    @ExcelProperty("Loading Time")
    private String loadingTime;

    @ExcelProperty("Arrival Port")
    private String arrivalPort;

    @ExcelProperty("Arrival Date")
    private String arrivalDate;
}
