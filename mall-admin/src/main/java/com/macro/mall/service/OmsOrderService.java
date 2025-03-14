package com.macro.mall.service;

import com.macro.mall.dto.*;
import com.macro.mall.model.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 订单管理Service
 * Created by macro on 2018/10/11.
 */
public interface OmsOrderService {
    /**
     * 分页查询订单
     */
    List<OmsOrder> list(OmsOrderQueryParam queryParam, Integer pageSize, Integer pageNum);

    List<OmsOrderItem> listItem(OmsOrderItemQueryParam queryParam, Integer pageSize, Integer pageNum);

    List<OmsOrderParcel> listParcel(OmsOrderParcelQueryParam queryParam, Integer pageSize, Integer pageNum);

    /**
     * 批量发货
     */
    @Transactional
    int delivery(List<OmsOrderDeliveryParam> deliveryParamList);

    /**
     * 批量关闭订单
     */
    @Transactional
    int close(List<Long> ids, String note);

    /**
     * 批量删除订单
     */
    int delete(List<Long> ids);

    /**
     * 获取指定订单详情
     */
    OmsOrderDetail detail(Long id);

    /**
     * 修改订单收货人信息
     */
    @Transactional
    int updateReceiverInfo(OmsReceiverInfoParam receiverInfoParam);

    /**
     * 修改订单费用信息
     */
    @Transactional
    int updateMoneyInfo(OmsMoneyInfoParam moneyInfoParam);

    /**
     * 修改订单备注
     */
    @Transactional
    int updateNote(Long id, String note, Integer status);


    boolean canCancelOrder(String orderSn);

    int cancelOrder(String orderSn);

    boolean canConfirmReceive(String orderSn);

    int confirmReceiveOrder(String orderSn);

    /**
     * 批量获取包裹编号
     */
    int getParcelSn(List<Long> ids);
    /**
     * 批量打印包裹面单
     */
    byte[] getPrintedLabels(List<String> parcelSnList);


    List<OmsOrderItemSimple> stockup(List<Long> parcelIds, OmsOrderParcelQueryParam queryParam);

    int completePacking(List<Long> parcelIds);

    int collectParcel(List<Long> parcelIds);
}
