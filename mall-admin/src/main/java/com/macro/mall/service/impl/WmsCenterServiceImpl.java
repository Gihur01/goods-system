package com.macro.mall.service.impl;

import com.macro.mall.mapper.WmsCenterMapper;
import com.macro.mall.mapper.WmsWarehouseMapper;
import com.macro.mall.model.OmsGLSAddress;
import com.macro.mall.model.WmsCenter;
import com.macro.mall.service.WmsCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WmsCenterServiceImpl implements WmsCenterService {
    @Autowired
    private WmsCenterMapper centerMapper;
    public OmsGLSAddress getTransitAddressByCountry(String country) {
        WmsCenter transitCenter = centerMapper.getCenterByCountry(country);
        if (transitCenter == null) return null;

        OmsGLSAddress transitAddress = new OmsGLSAddress();
        transitAddress.setName(transitCenter.getName()); // 中转负责人名称
//        transitAddress.setStreet(transitCenter.getStreet()); // 街道
//        transitAddress.setHouseNumber(transitCenter.getHouseNumber()); // 门牌号
        transitAddress.setHouseNumberInfo(transitCenter.getDetailAddress()); // 楼栋信息
        transitAddress.setCity(transitCenter.getCity()); // 城市
        transitAddress.setZipCode(transitCenter.getPostCode()); // 邮编
        transitAddress.setCountryIsoCode(transitCenter.getCountryCode()); // 国家代码
        transitAddress.setContactName(transitCenter.getName()); // 联系人

        return transitAddress;
    }
}
