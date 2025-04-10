package com.macro.mall.mapper;

import com.macro.mall.model.CusBaseLogistics;
import com.macro.mall.model.CusLogistics;
import com.macro.mall.model.CusLogisticsHistory;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

public interface CusLogisticsMapper {

    CusLogistics selectByWaybillAndCustomerOrder(String waybillNumber, String customerOrderNumber, String fwTrackingNumber);

    void updateByWaybillAndCustomerOrder(CusLogistics logistics);

    void insertLogistics(CusLogistics logistics);

    // 根据ID查找物流记录
    @Select("SELECT * FROM logistics_records WHERE id = #{id}")
    CusLogistics findById(@Param("id") Integer containerNumber);

    // 更新 customs_clearance_materials 字段
    @Update("UPDATE logistics_records SET customs_clearance_materials = #{filePath} WHERE id = #{id}")
    void updateCustomsClearanceMaterials(@Param("id") Integer id, @Param("filePath") String filePath);
    @Update("UPDATE logistics_records SET customs_clearance_result = #{filePath} WHERE id = #{id}")
    void updateCustomsClearanceResult(@Param("id") Integer id, @Param("filePath") String filePath);


    int updateNoteByKeys(@Param("waybillNumber") String waybillNumber,
                         @Param("customerOrderNumber") String customerOrderNumber,
                         @Param("fwTrackingNumber") String fwTrackingNumber,
                         @Param("note") String note,
                         @Param("trackUpdateTime") Timestamp trackUpdateTime);

    CusLogistics querySingleLogistics(@Param("field") String field,
                                      @Param("username") String username,
                                      @Param("waybillNumber") String waybillNumber,
                                      @Param("customerOrderNumber") String customerOrderNumber,
                                      @Param("fwTrackingNumber") String fwTrackingNumber);


    Long getLogisticsId(String waybillNumber, String customerOrderNumber, String fwTrackingNumber);

    void insertLogisticsHistory(Long logisticsId, String note, Timestamp trackUpdateTime, String username);

    List<CusLogisticsHistory> getLogisticsHistoryByLogisticsId(@Param("logisticsId") Long logisticsId);

    List<CusBaseLogistics> selectAllLogistics(@Param("field")String field, @Param("username") String username, @Param("startTime") Long startTimestamp, @Param("endTime") Long endTimestamp);

    List<CusBaseLogistics> ROOTselectAllLogistics(@Param("startTime") Long startTimestamp, @Param("endTime") Long endTimestamp);

    int updateStatusByIds(List<Integer> ids, String status);

    int deleteByIds(List<Integer> ids);
}
