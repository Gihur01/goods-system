package com.macro.mall.model;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class CusBaseLogistics {
    private Integer id;
    private String receiveDate;
    private String receiveTime;
    private String waybillNumber;
    private String customerOrderNumber;
    private String fwTrackingNumber;
    private String containerNumber;
    private String status;
    private String logisticsChannel;
    private String loadingPort;
    private String loadingTime;
    private String arrivalPort;
    private String arrivalDate;
    private String latestTrackNotes;
    private Timestamp trackUpdateTime;
    private String customsClearanceMaterials;
    private String customsClearanceResult;
    private Timestamp createTime;
}
