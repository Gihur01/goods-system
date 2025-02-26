package com.macro.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.dao.OmsOrderDao;
import com.macro.mall.dao.OmsOrderOperateHistoryDao;
import com.macro.mall.dto.*;
import com.macro.mall.mapper.OmsOrderItemMapper;
import com.macro.mall.mapper.OmsOrderMapper;
import com.macro.mall.mapper.OmsOrderOperateHistoryMapper;
import com.macro.mall.model.*;
import com.macro.mall.service.OmsOrderService;
import com.macro.mall.service.UmsAdminService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 订单管理Service实现类
 * Created by macro on 2018/10/11.
 */
@Service
public class OmsOrderServiceImpl implements OmsOrderService {
    private static final Logger log = LoggerFactory.getLogger(OmsOrderService.class);
    @Autowired
    private OmsOrderMapper orderMapper;
    @Autowired
    private OmsOrderItemMapper orderItemMapper;
    @Autowired
    private OmsOrderDao orderDao;
    @Autowired
    private OmsOrderOperateHistoryDao orderOperateHistoryDao;
    @Autowired
    private OmsOrderOperateHistoryMapper orderOperateHistoryMapper;
    @Autowired
    private UmsAdminService umsAdminService;

    @Override
    public List<OmsOrder> list(OmsOrderQueryParam queryParam, Integer pageSize, Integer pageNum) {
        List<UmsRole> UserRole = umsAdminService.getCurrentUserRole();
        Long roleId = UserRole.get(0).getId();
        log.info("角色ID: {}", roleId);
        if(roleId == 6) {
            String salesChannelId = umsAdminService.getCurrentUserSalesChannelId();
            log.info("零售商ID: {}", salesChannelId);
            queryParam.setSalesChannelId(salesChannelId);
        }
        if(roleId == 8) {
            String orderCountryNum = umsAdminService.getOrderCountryNum();
            log.info("物流国家: {}", orderCountryNum);
            queryParam.setOrderCountryNum(orderCountryNum);
        }
        PageHelper.startPage(pageNum, pageSize);
        return orderDao.getList(queryParam);
    }

    public List<OmsOrderItem> listItem(OmsOrderItemQueryParam queryParam, Integer pageSize, Integer pageNum) {
        List<UmsRole> UserRole = umsAdminService.getCurrentUserRole();
        Long roleId = UserRole.get(0).getId();
        log.info("角色ID: {}", roleId);
        if(roleId == 7) {
            List<Long> warehouseId = umsAdminService.getWarehousesByAdminId();
            log.info("仓库ID: {}", warehouseId);
            queryParam.setWarehouseId(warehouseId);
        }
        if(roleId == 8) {
            String location = umsAdminService.getOrderCountryNum();
            log.info("物流国家: {}", location);
            queryParam.setLocation(location);
        }
        log.info("查询参数: {}", queryParam);
        PageHelper.startPage(pageNum, pageSize);
        return orderDao.getListItem(queryParam);
    }

    public List<OmsOrderParcel> listParcel(OmsOrderParcelQueryParam queryParam, Integer pageSize, Integer pageNum) {
        List<UmsRole> UserRole = umsAdminService.getCurrentUserRole();
        Long roleId = UserRole.get(0).getId();
        log.info("角色ID: {}", roleId);
        if(roleId == 7) {
            List<Long> warehouseId = umsAdminService.getWarehousesByAdminId();
            log.info("仓库ID: {}", warehouseId);
            queryParam.setWarehouseId(warehouseId);
        }
        if(roleId == 8) {
            String location = umsAdminService.getOrderCountryNum();
            log.info("物流国家: {}", location);
            queryParam.setLocation(location);
        }
        log.info("查询参数: {}", queryParam);
        PageHelper.startPage(pageNum, pageSize);
        return orderDao.getListParcel(queryParam);
    }

    @Override
    public int delivery(List<OmsOrderDeliveryParam> deliveryParamList) {
        //批量发货
        int count = orderDao.delivery(deliveryParamList);
        //添加操作记录
        List<OmsOrderOperateHistory> operateHistoryList = deliveryParamList.stream()
                .map(omsOrderDeliveryParam -> {
                    OmsOrderOperateHistory history = new OmsOrderOperateHistory();
                    history.setOrderId(omsOrderDeliveryParam.getOrderId());
                    history.setCreateTime(new Date());
                    history.setOperateMan("后台管理员");
                    history.setOrderStatus(2);
                    history.setNote("完成发货");
                    return history;
                }).collect(Collectors.toList());
        orderOperateHistoryDao.insertList(operateHistoryList);
        return count;
    }

    @Override
    public int close(List<Long> ids, String note) {
        OmsOrder record = new OmsOrder();
        record.setStatus(4);
        OmsOrderExample example = new OmsOrderExample();
        example.createCriteria().andDeleteStatusEqualTo(0).andIdIn(ids);
        int count = orderMapper.updateByExampleSelective(record, example);
        List<OmsOrderOperateHistory> historyList = ids.stream().map(orderId -> {
            OmsOrderOperateHistory history = new OmsOrderOperateHistory();
            history.setOrderId(orderId);
            history.setCreateTime(new Date());
            history.setOperateMan("后台管理员");
            history.setOrderStatus(4);
            history.setNote("订单关闭:"+note);
            return history;
        }).collect(Collectors.toList());
        orderOperateHistoryDao.insertList(historyList);
        return count;
    }

    @Override
    public int delete(List<Long> ids) {
        OmsOrder record = new OmsOrder();
        record.setDeleteStatus(1);
        OmsOrderExample example = new OmsOrderExample();
        example.createCriteria().andDeleteStatusEqualTo(0).andIdIn(ids);
        return orderMapper.updateByExampleSelective(record, example);
    }

    @Override
    public OmsOrderDetail detail(Long id) {
        return orderDao.getDetail(id);
    }

    @Override
    public int updateReceiverInfo(OmsReceiverInfoParam receiverInfoParam) {
        OmsOrder order = new OmsOrder();
        order.setId(receiverInfoParam.getOrderId());
        order.setOrderSn(receiverInfoParam.getOrderSn());
        order.setReceiverName(receiverInfoParam.getReceiverName());
        order.setReceiverPhone(receiverInfoParam.getReceiverPhone());
        order.setReceiverPostCode(receiverInfoParam.getReceiverPostCode());
        order.setReceiverDetailAddress(receiverInfoParam.getReceiverDetailAddress());
        order.setReceiverProvince(receiverInfoParam.getReceiverProvince());
        order.setReceiverCity(receiverInfoParam.getReceiverCity());
        order.setReceiverRegion(receiverInfoParam.getReceiverRegion());
        order.setModifyTime(new Date());
        if(receiverInfoParam.getOrderId() != null) {
            int count = orderMapper.updateByPrimaryKeySelective(order);
        }
        int count = orderMapper.updateByOrderSnSelective(order);

        //插入操作记录
        OmsOrderOperateHistory history = new OmsOrderOperateHistory();
        history.setOrderId(receiverInfoParam.getOrderId());
        history.setCreateTime(new Date());
        history.setOperateMan("后台管理员");
        history.setOrderStatus(receiverInfoParam.getStatus());
        history.setNote("修改收货人信息");
        orderOperateHistoryMapper.insert(history);
        return count;
    }

    @Override
    public int updateMoneyInfo(OmsMoneyInfoParam moneyInfoParam) {
        OmsOrder order = new OmsOrder();
        order.setId(moneyInfoParam.getOrderId());
        order.setFreightAmount(moneyInfoParam.getFreightAmount());
        order.setDiscountAmount(moneyInfoParam.getDiscountAmount());
        order.setModifyTime(new Date());
        int count = orderMapper.updateByPrimaryKeySelective(order);
        //插入操作记录
        OmsOrderOperateHistory history = new OmsOrderOperateHistory();
        history.setOrderId(moneyInfoParam.getOrderId());
        history.setCreateTime(new Date());
        history.setOperateMan("后台管理员");
        history.setOrderStatus(moneyInfoParam.getStatus());
        history.setNote("修改费用信息");
        orderOperateHistoryMapper.insert(history);
        return count;
    }

    @Override
    public int updateNote(Long id, String note, Integer status) {
        OmsOrder order = new OmsOrder();
        order.setId(id);
        order.setNote(note);
        order.setModifyTime(new Date());
        int count = orderMapper.updateByPrimaryKeySelective(order);
        OmsOrderOperateHistory history = new OmsOrderOperateHistory();
        history.setOrderId(id);
        history.setCreateTime(new Date());
        history.setOperateMan("后台管理员");
        history.setOrderStatus(status);
        history.setNote("修改备注信息："+note);
        orderOperateHistoryMapper.insert(history);
        return count;
    }

//    @Override
//    @Transactional
//    public OmsOrder createOrder(OmsOrderCreateParam orderCreateParam) {
//        // 输出传入的 orderCreateParam
//        log.info("Received orderCreateParam: {}", orderCreateParam);
//
//        // 创建订单对象
//        OmsOrder omsOrder = new OmsOrder();
//
//        // 使用 BeanUtils 复制属性，将 OmsOrderCreateParam 中的相同属性值复制到 OmsOrder
//        BeanUtils.copyProperties(orderCreateParam, omsOrder);
//
//        // 输出复制到的 omsOrder
//        log.info("Copied omsOrder: {}", omsOrder);
//
//        // 设置订单没有的属性
//        omsOrder.setCreateTime(new Date());  // 设置订单创建时间
//        omsOrder.setModifyTime(new Date());  // 设置订单修改时间
//        omsOrder.setConfirmStatus(0);  // 默认未确认
//        omsOrder.setDeleteStatus(0);   // 默认未删除
//        omsOrder.setMemberId(1L);
//        omsOrder.setSalesChannelId("3742");
//
//        // 插入订单到数据库
//        orderMapper.insertOrder(omsOrder);
//
//        // 获取订单 ID
//        Long orderId = omsOrder.getId();
//
//        // 获取订单中的商品列表
//        List<OmsOrderItem> orderItems = orderCreateParam.getOrderItems();
//
//        // 遍历商品项列表，处理每一个商品项
//        for (OmsOrderItem orderItem : orderItems) {
//            // 创建新的商品项对象
//            OmsOrderItem omsOrderItem = new OmsOrderItem();
//
//            // 复制商品属性
//            BeanUtils.copyProperties(orderItem, omsOrderItem);
//
//            // 设置商品项的缺失属性
//            omsOrderItem.setOrderId(orderId);  // 关联订单ID
//            omsOrderItem.setDeleteStatus(0);  // 默认未删除
//
//            // 输出复制后的商品项信息
//            log.info("Copied orderItem: {}", omsOrderItem);
//
//            // 插入订单商品项到数据库
//            orderMapper.insertOrderItem(omsOrderItem);
//        }
//        // 返回已创建的订单对象
//        return omsOrder;
//    }

    public boolean canCancelOrder(String orderSn) {
        OmsOrder order = orderMapper.selectByOrderSn(orderSn);
        if (order == null) {
            throw new RuntimeException("订单不存在");
        }
        // 校验订单状态是否可以取消
        if (order.getStatus() != 0) { // 假设只有待支付状态可以取消
            return false;
        }
        return true;
    }

    public int cancelOrder(String orderSn) {
        OmsOrder order = new OmsOrder();
        order.setOrderSn(orderSn);
        order.setStatus(6); // 设为已取消状态
        return orderMapper.updateByOrderSnSelective(order);
    }

    public boolean canConfirmReceive(String orderSn) {
        OmsOrder order = orderMapper.selectByOrderSn(orderSn);
        if (order == null) {
            throw new RuntimeException("订单不存在");
        }
        // 校验订单状态是否为已发货
        if (order.getStatus() == 6) { // 假设只有已发货的订单可以确认收货
            return false;
        }
        return true;
    }

    public int confirmReceiveOrder(String orderSn) {
        OmsOrder order = new OmsOrder();
        order.setOrderSn(orderSn);
        order.setStatus(5); // 设为已取消状态
        return orderMapper.updateByOrderSnSelective(order);
    }

    @Override
    public int getParcelSn(List<Long> ids) {
        OmsOrder record = new OmsOrder();
        record.setDeleteStatus(1);
        OmsOrderExample example = new OmsOrderExample();
        example.createCriteria().andDeleteStatusEqualTo(0).andIdIn(ids);
        return orderMapper.updateByExampleSelective(record, example);
    }
}
