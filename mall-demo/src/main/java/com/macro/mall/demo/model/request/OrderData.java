package com.macro.mall.demo.model.request;


import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class OrderData {
    @JsonProperty("CorpBillid")
    private String corpBillid;

    @JsonProperty("CustomerNumber")
    private String customerNumber;

    @JsonProperty("TradeNo")
    private String tradeNo;

    @JsonProperty("TrackNumber")
    private String trackNumber;

    @JsonProperty("Labelbillid")
    private String labelbillid;

    @JsonProperty("ChannelCode")
    private String channelCode;

    @JsonProperty("CountryCode")
    private String countryCode;

    @JsonProperty("HouseCode")
    private String houseCode;

    @JsonProperty("TotalWeight")
    private Double totalWeight;

    @JsonProperty("TotalValue")
    private Double totalValue;

    @JsonProperty("Number")
    private Integer number;

    @JsonProperty("Collamt")
    private Double collamt;

    @JsonProperty("Collccycode")
    private String collccycode;

    @JsonProperty("PackageType")
    private String packageType;

    @JsonProperty("ProductTypeid")
    private String productTypeid;

    @JsonProperty("Battery")
    private String battery;

    @JsonProperty("GoodsType")
    private String goodsType;

    @JsonProperty("Note")
    private String note;

    @JsonProperty("VatNumber")
    private String vatNumber;

    @JsonProperty("VatCorpName")
    private String vatCorpName;

    @JsonProperty("VatCorpAddress")
    private String vatCorpAddress;

    @JsonProperty("EoriNumber")
    private String eoriNumber;

    @JsonProperty("FBAWarehouseCode")
    private String fbaWarehouseCode;

    @JsonProperty("Salesplatform")
    private String salesPlatform;

    @JsonProperty("TariffType")
    private String tariffType;

    @JsonProperty("Insurance")
    private Insurance insurance;

    @JsonProperty("FeePayData")
    private FeePayData feePayData;

    @JsonProperty("TaxPayData")
    private TaxPayData taxPayData;

    @JsonProperty("FeeInfo")
    private FeeInfo feeInfo;

    @JsonProperty("Recipient")
    private Recipient recipient;

    @JsonProperty("Sender")
    private Sender sender;

    @JsonProperty("OrderItems")
    private List<OrderItem> orderItems;

    @JsonProperty("Volumes")
    private List<Volume> volumes;
}
