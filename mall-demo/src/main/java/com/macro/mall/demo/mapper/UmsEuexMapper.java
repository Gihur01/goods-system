package com.macro.mall.demo.mapper;

import com.macro.mall.demo.dto.Verify;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UmsEuexMapper {
    int validateAuth(@Param("verify")Verify verify);
}
