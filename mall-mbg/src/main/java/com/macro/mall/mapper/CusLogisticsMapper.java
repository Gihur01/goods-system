package com.macro.mall.mapper;

import com.macro.mall.model.CusLogistics;

import java.util.List;

public interface CusLogisticsMapper {
    List<CusLogistics> selectAll();

    int deleteByWaybillAndCustomerOrder(String waybillNumber, String customerOrderNumber, String fwTrackingNumber);

    CusLogistics selectByWaybillAndCustomerOrder(String waybillNumber, String customerOrderNumber, String fwTrackingNumber);

    void updateByWaybillAndCustomerOrder(CusLogistics logistics);

    void insertLogistics(CusLogistics logistics);
}
