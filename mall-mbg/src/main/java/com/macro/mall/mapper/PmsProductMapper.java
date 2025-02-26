package com.macro.mall.mapper;

import com.macro.mall.model.PmsCertification;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.PmsProductExample;

import java.util.Collection;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PmsProductMapper {
    long countByExample(PmsProductExample example);

    int deleteByExample(PmsProductExample example);

    int deleteByPrimaryKey(Long id);

    int insert(PmsProduct record);

    int insertSelective(PmsProduct record);

    List<PmsProduct> selectByExampleWithBLOBs(PmsProductExample example);

    List<PmsProduct> selectByExample(PmsProductExample example);

    static PmsCertification selectByProductSn(String productSn) {
        return null;
    }

    PmsProduct selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") PmsProduct record, @Param("example") PmsProductExample example);

    int updateByExampleWithBLOBs(@Param("record") PmsProduct record, @Param("example") PmsProductExample example);

    int updateByExample(@Param("record") PmsProduct record, @Param("example") PmsProductExample example);

    int updateByPrimaryKeySelective(PmsProduct record);

    int updateByPrimaryKeyWithBLOBs(PmsProduct record);

    int updateByPrimaryKey(PmsProduct record);

    /**
     * 根据仓库 ID 过滤商品列表
     */
    List<PmsProduct> listByWarehouseIds(@Param("warehouseIds") List<Long> warehouseIds);

    List<PmsProduct> getProductsBySns(List<String> productSn);
}