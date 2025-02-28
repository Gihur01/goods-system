package com.macro.mall.service;


import com.macro.mall.model.OmsGLSAddress;
import org.springframework.stereotype.Service;

public interface WmsCenterService {
    OmsGLSAddress getTransitAddressByCountry(String country);
}
