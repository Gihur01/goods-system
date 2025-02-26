package com.macro.mall.mapper;

import com.macro.mall.model.OmsOrder;
import com.macro.mall.model.OmsOrderExample;
import java.util.List;

import com.macro.mall.model.OmsOrderItem;
import com.macro.mall.model.OmsOrderParcel;
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
}