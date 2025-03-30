package com.macro.mall.demo.service;

import com.macro.mall.demo.model.request.*;

public interface QueryService {
    String getActiveChannels(QueryWarehouseRequest request) throws Exception;
    String getInsuranceTypes(QueryInsuranceRequest request) throws Exception;
    String calculatePrice(QueryPriceRequest request) throws Exception;
    String getTrackingInfo(QueryTrackingRequest request) throws Exception;
}
