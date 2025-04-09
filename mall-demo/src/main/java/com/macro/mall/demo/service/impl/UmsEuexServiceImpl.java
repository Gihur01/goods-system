package com.macro.mall.demo.service.impl;

import com.macro.mall.demo.dto.Verify;

import com.macro.mall.demo.mapper.UmsEuexMapper;
import com.macro.mall.demo.service.UmsEuexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UmsEuexServiceImpl implements UmsEuexService {
    @Autowired
    private UmsEuexMapper euexMapper;

    public boolean validateAuth(Verify verify) {
        return euexMapper.validateAuth(verify) > 0;
    }

}
