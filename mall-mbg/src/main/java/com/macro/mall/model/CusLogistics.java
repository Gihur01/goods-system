package com.macro.mall.model;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CusLogistics {
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
    private String targetPostcode;
    private String targetCountry;
    private String ecommercePlatform;
    private String fulfillmentWarehouse;
    private String isRemote;
    private String ctns;
    private String tilPcs;
    private String netWeight;
    private String grossWeight;
    private String measurement;
    private String billWeight;
    private String confirmedBillWeight;
    private String cdType;
    private String ccType;
    private String clType;
    private String material;
    private String additionalNotes;
    private String description;
    private String ccAmount;
    private String problemItemType;
    private String ladingNumber;
    private String latestTrackNotes;
    private Timestamp trackUpdateTime;
    private String customsClearanceMaterials;
    private String acceptanceChannelNo;
    private String ccCompanyNo;
    private String fwLogisticsNo;
    private Timestamp createTime;
}
