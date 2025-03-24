package com.macro.mall.demo.mapper;

import com.macro.mall.demo.model.UmsEuex;
import com.macro.mall.demo.model.request.Verify;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UmsEuexMapper {
    UmsEuex findByClientIdAndToken(@Param("verify") Verify verify);
}
