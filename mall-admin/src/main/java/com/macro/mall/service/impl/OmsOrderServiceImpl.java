package com.macro.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.dao.OmsOrderDao;
import com.macro.mall.dao.OmsOrderOperateHistoryDao;
import com.macro.mall.dto.*;
import com.macro.mall.mapper.OmsOrderItemMapper;
import com.macro.mall.mapper.OmsOrderMapper;
import com.macro.mall.mapper.OmsOrderOperateHistoryMapper;
import com.macro.mall.mapper.WmsCenterMapper;
import com.macro.mall.model.*;
import com.macro.mall.service.OmsOrderService;
import com.macro.mall.service.UmsAdminService;
import com.macro.mall.service.WmsCenterService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
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
    @Autowired
    private WmsCenterMapper centerMapper;
    @Autowired
    private WmsCenterService centerService;

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
        if (ids == null || ids.isEmpty()) {
            log.warn("批量获取物流单号失败，订单ID列表为空");
            return 0;
        }

        List<OmsOrderParcel> parcels = orderMapper.getParcelsByIds(ids);
        if (parcels == null || parcels.isEmpty()) {
            log.warn("未找到对应的包裹信息");
            return 0;
        }

        for (OmsOrderParcel parcel : parcels) {
            Long orderId = parcel.getOrderId();
            String parcelLocation = parcel.getLocation();

            // 查询订单获取 order_country
            OmsOrder order = orderMapper.getOrderById(orderId);
            if (order == null) {
                log.error("订单ID: {} 未找到，无法获取 order_country", orderId);
                continue;
            }
            String orderCountry = order.getOrderCountry();

            OmsGLSAddress finalReceiverAddress = centerService.getTransitAddressByCountry(parcel.getWarehouseId()); // 订单最终收件人地址

            // 获取发货人地址（仓库地址）
            OmsGLSAddress senderAddress = centerService.getTransitAddressByCountry(parcel.getWarehouseId());

            // 如果 location 与 order_country 不一致，说明是跨国订单，需要创建两个包裹
            if (!parcelLocation.equals(orderCountry)) {
                log.info("订单ID: {} 需要跨国物流，原包裹发往中转仓库 {}", orderId, orderCountry);

                // 查询 wms_center 获取中转仓库地址
                OmsGLSAddress transitAddress = centerService.getTransitAddressByCountry(orderCountry);
                if (transitAddress == null) {
                    log.error("未找到 order_country: {} 对应的中转仓库信息", orderCountry);
                    continue;
                }

                // **第一个包裹: 从当前仓库发往 order_country（中转仓库）**
                callGLSApi(parcel, transitAddress, senderAddress);

                // **创建新的包裹**
                OmsOrderParcel newParcel = new OmsOrderParcel();
                newParcel.setOrderId(orderId);
                newParcel.setLocation(orderCountry);
                newParcel.setCreateTime(new Timestamp(System.currentTimeMillis()));
                newParcel.setParcelStatus(0); // 未发货
                orderMapper.insertParcel(newParcel);

                // **第二个包裹: 从 order_country（中转仓库）发往最终客户**
                callGLSApi(newParcel, finalReceiverAddress, transitAddress);
            } else {
                // **普通国内包裹，直接发到客户地址**
                callGLSApi(parcel, finalReceiverAddress, senderAddress);
            }
        }
        return parcels.size();
    }

    /**
     * 调用 GLS API 获取 ParcelSn
     * @param parcel 需要发货的包裹信息
     * @param receiverAddress 收件人地址
     * @param senderAddress 发件人地址
     */
    private void callGLSApi(OmsOrderParcel parcel, OmsGLSAddress receiverAddress, OmsGLSAddress senderAddress) {
//        GLSRequest request = new GLSRequest();
//        request.setUsername("myglsapitest@test.mygls.hu");
//        request.setPassword("1pImY_gls.hu");
//
//        GLSParcel glsParcel = new GLSParcel();
//        glsParcel.setClientNumber(12345678);
//        glsParcel.setClientReference("order_" + parcel.getOrderId());
//        glsParcel.setCount(1);
//        glsParcel.setCODAmount(0);
//        glsParcel.setContent("General Goods");
//
//        // 发货地址（仓库或中转站）
//        glsParcel.setPickupAddress(senderAddress);
//
//        // 收货地址（中转站或最终客户）
//        glsParcel.setDeliveryAddress(receiverAddress);
//
//        request.setParcelList(Collections.singletonList(glsParcel));
//
//        GLSResponse response = glsApiService.sendParcelRequest(request);
//        if (response != null && response.isSuccess()) {
//            parcel.setParcelSn(response.getParcelNumber());
//            orderMapper.updateParcel(parcel);
//            log.info("成功获取 GLS 物流单号: {}", response.getParcelNumber());
//        } else {
//            log.error("GLS API 请求失败: {}", response);
//        }
    }
}
