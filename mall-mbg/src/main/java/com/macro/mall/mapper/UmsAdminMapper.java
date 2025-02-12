package com.macro.mall.mapper;

import com.macro.mall.model.UmsAdmin;
import com.macro.mall.model.UmsAdminExample;
import java.util.List;

import com.macro.mall.model.WmsAdminWarehouseRelation;
import org.apache.ibatis.annotations.Param;

public interface UmsAdminMapper {
    long countByExample(UmsAdminExample example);

    int deleteByExample(UmsAdminExample example);

    int deleteByPrimaryKey(Long id);

    int insert(UmsAdmin record);

    int insertSelective(UmsAdmin record);

    List<UmsAdmin> selectByExample(UmsAdminExample example);

    UmsAdmin selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") UmsAdmin record, @Param("example") UmsAdminExample example);

    int updateByExample(@Param("record") UmsAdmin record, @Param("example") UmsAdminExample example);

    int updateByPrimaryKeySelective(UmsAdmin record);

    int updateByPrimaryKey(UmsAdmin record);

    /**
     * 根据 adminId 查询该用户有权限查看的仓库 ID 列表
     */
    List<Long> selectWarehouseIdsByAdminId(@Param("adminId") Long adminId);
    /**
     * 根据 adminId 查询该用户的零售商ID
     */
    String selectSalesChannelIdById(@Param("adminId") Long adminId);
    /**
     * 根据 adminId 查询该用户的物流国家
     */
    String selectOrderCountryNumById(@Param("adminId") Long adminId);
}