package com.macro.mall.mapper;

import com.macro.mall.model.*;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;

public interface OmsOrderMapper {
    long countByExample(OmsOrderExample example);

    int deleteByExample(OmsOrderExample example);

    int deleteByPrimaryKey(Long id);

    int insert(OmsOrder record);

    int insertSelective(OmsOrder record);

    List<OmsOrder> selectByExample(OmsOrderExample example);

    OmsOrder selectByPrimaryKey(Long id);

    OmsOrder selectByOrderSn(String orderSn);

    int updateByExampleSelective(@Param("record") OmsOrder record, @Param("example") OmsOrderExample example);

    int updateByExample(@Param("record") OmsOrder record, @Param("example") OmsOrderExample example);

    int updateByPrimaryKeySelective(OmsOrder record);

    int updateByOrderSnSelective(OmsOrder record);

    int updateByPrimaryKey(OmsOrder record);

    int insertOrder(OmsOrder order);

    int insertOrderItem(OmsOrderItem order);

    OmsOrder getOrderById(@Param("id") Long id);

    void batchInsertOrderItems(List<OmsOrderItem> newOrderItems);

    void batchInsertParcels(List<OmsOrderParcel> parcelList);

    void insertParcel(OmsOrderParcel newParcel);

    List<OmsOrderParcel> getParcelsByIds(@Param("ids") List<Long> ids);

    List<OmsOrderItem> getItemsByParcelId(@Param("parcelId") Long parcelId);

    List<OmsOrderItemSimple> getPackingList(List<Long> parcelIds);


    /**
     * 通用状态更新方法
     * @param tableName       表名 (oms_order_item 或 oms_order_parcel)
     * @param statusColumn    状态字段 (item_status 或 parcel_status)
     * @param statusValue     更新后的状态值
     * @param conditionColumn 条件字段 (order_id 或 parcel_id)
     * @param ids             需要更新的 ID 列表
     * @return 更新的行数
     */
    int updateStatus(@Param("tableName") String tableName,
                     @Param("statusColumn") String statusColumn,
                     @Param("statusValue") int statusValue,
                     @Param("conditionColumn") String conditionColumn,
                     @Param("ids") List<Long> ids);

    void updateParcelSn(Long parcelId, String parcelSn, int parcelStatus);

    @MapKey("parcelId")
    Map<Long, Map<String, Object>> getItemStatuses(@Param("parcelIds") List<Long> parcelIds);

    @MapKey("parcelId")
    Map<Long, Map<String, Object>> getParcelStatuses(@Param("parcelIds")  List<Long> parcelIds);
}