package com.macro.mall.mapper;

import com.macro.mall.model.CusBaseLogistics;
import com.macro.mall.model.CusLogistics;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Optional;

public interface CusLogisticsMapper {
    List<CusBaseLogistics> selectAllLogistics();

    int deleteByWaybillAndCustomerOrder(String waybillNumber, String customerOrderNumber, String fwTrackingNumber);

    CusLogistics selectByWaybillAndCustomerOrder(String waybillNumber, String customerOrderNumber, String fwTrackingNumber);

    void updateByWaybillAndCustomerOrder(CusLogistics logistics);

    void insertLogistics(CusLogistics logistics);

    // 根据柜号查找物流记录
    @Select("SELECT * FROM logistics_records WHERE container_number = #{containerNumber}")
    CusLogistics findByContainerNumber(@Param("containerNumber") String containerNumber);

    // 更新 customs_clearance_materials 字段
    @Update("UPDATE logistics_records SET customs_clearance_materials = #{filePath} WHERE container_number = #{containerNumber}")
    void updateCustomsClearanceMaterials(@Param("containerNumber") String containerNumber, @Param("filePath") String filePath);
}
