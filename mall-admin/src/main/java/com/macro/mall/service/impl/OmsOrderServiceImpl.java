package com.macro.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.dao.OmsOrderDao;
import com.macro.mall.dao.OmsOrderOperateHistoryDao;
import com.macro.mall.dto.*;
import com.macro.mall.mapper.OmsOrderMapper;
import com.macro.mall.mapper.OmsOrderOperateHistoryMapper;
import com.macro.mall.model.*;
import com.macro.mall.service.OmsOrderService;
import com.macro.mall.service.UmsAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import lombok.extern.slf4j.Slf4j;
import java.util.Collections;
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
        order.setReceiverName(receiverInfoParam.getReceiverName());
        order.setReceiverPhone(receiverInfoParam.getReceiverPhone());
        order.setReceiverPostCode(receiverInfoParam.getReceiverPostCode());
        order.setReceiverDetailAddress(receiverInfoParam.getReceiverDetailAddress());
        order.setReceiverProvince(receiverInfoParam.getReceiverProvince());
        order.setReceiverCity(receiverInfoParam.getReceiverCity());
        order.setReceiverRegion(receiverInfoParam.getReceiverRegion());
        order.setModifyTime(new Date());
        int count = orderMapper.updateByPrimaryKeySelective(order);
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
}
