package com.macro.mall.mapper;

import com.macro.mall.model.WmsCenter;

public interface WmsCenterMapper {
    WmsCenter getCenterByCountry(String orderCountry);
}
