package com.macro.mall.dao;

import com.macro.mall.dto.*;
import com.macro.mall.model.OmsOrder;
import com.macro.mall.model.OmsOrderItem;
import com.macro.mall.model.OmsOrderItemSimple;
import com.macro.mall.model.OmsOrderParcel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 订单查询自定义Dao
 * Created by macro on 2018/10/12.
 */
public interface OmsOrderDao {
    /**
     * 条件查询订单
     */
    List<OmsOrder> getList(@Param("queryParam") OmsOrderQueryParam queryParam);
    /**
     * 条件查询订单商品
     */
    List<OmsOrderItem> getListItem(@Param("queryParam") OmsOrderItemQueryParam queryParam);
    /**
     * 条件查询包裹
     */
    List<OmsOrderParcel> getListParcel(@Param("queryParam") OmsOrderParcelQueryParam queryParam);

    /**
     * 批量发货
     */
    int delivery(@Param("list") List<OmsOrderDeliveryParam> deliveryParamList);

    /**
     * 获取订单详情
     */
    OmsOrderDetail getDetail(@Param("id") Long id);

    List<OmsOrderItemSimple> getPackingListByQueryParam(@Param("queryParam") OmsOrderParcelQueryParam queryParam);
}
