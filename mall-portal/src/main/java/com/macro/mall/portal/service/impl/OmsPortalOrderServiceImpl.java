package com.macro.mall.portal.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import com.github.pagehelper.PageHelper;
import com.macro.mall.common.api.CommonPage;
import com.macro.mall.common.exception.Asserts;
import com.macro.mall.common.service.RedisService;
import com.macro.mall.mapper.*;
import com.macro.mall.model.*;
import com.macro.mall.portal.component.CancelOrderSender;
import com.macro.mall.portal.dao.PortalOrderDao;
import com.macro.mall.portal.dao.PortalOrderItemDao;
import com.macro.mall.portal.dao.SmsCouponHistoryDao;
import com.macro.mall.portal.domain.*;
import com.macro.mall.portal.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * 前台订单管理Service
 * Created by macro on 2018/8/30.
 */
@Slf4j
@Service
public class OmsPortalOrderServiceImpl implements OmsPortalOrderService {
    @Autowired
    private UmsMemberService memberService;
    @Autowired
    private OmsCartItemService cartItemService;
    @Autowired
    private UmsMemberReceiveAddressService memberReceiveAddressService;
    @Autowired
    private UmsMemberCouponService memberCouponService;
    @Autowired
    private UmsIntegrationConsumeSettingMapper integrationConsumeSettingMapper;
    @Autowired
    private PmsSkuStockMapper skuStockMapper;
    @Autowired
    private SmsCouponHistoryDao couponHistoryDao;
    @Autowired
    private OmsOrderMapper orderMapper;
    @Autowired
    private PortalOrderItemDao orderItemDao;
    @Autowired
    private SmsCouponHistoryMapper couponHistoryMapper;
    @Autowired
    private RedisService redisService;
    @Value("${redis.key.orderId}")
    private String REDIS_KEY_ORDER_ID;
    @Value("${redis.database}")
    private String REDIS_DATABASE;
    @Autowired
    private PortalOrderDao portalOrderDao;
    @Autowired
    private OmsOrderSettingMapper orderSettingMapper;
    @Autowired
    private OmsOrderItemMapper orderItemMapper;
    @Autowired
    private CancelOrderSender cancelOrderSender;
    @Autowired
    private PmsPortalProductService productService;
    @Autowired
    private OmsOrderOperateHistoryMapper orderOperateHistoryMapper;

    @Override
    @Transactional
    public OmsOrder createOrder(OmsOrderCreateParam orderCreateParam) {
        log.info("Received orderCreateParam: {}", orderCreateParam);

        // 1. 校验订单参数
        if (orderCreateParam == null || orderCreateParam.getOrderItems() == null || orderCreateParam.getOrderItems().isEmpty()) {
            throw new IllegalArgumentException("订单参数或订单项不能为空");
        }

        if (orderCreateParam.getReceiverAddress() == null) {
            throw new IllegalArgumentException("收货地址不能为空");
        }

        // 2. 创建订单
        OmsOrder omsOrder = new OmsOrder();
        BeanUtils.copyProperties(orderCreateParam, omsOrder);
        omsOrder.setOrderSn(orderCreateParam.getOrderSn());
        omsOrder.setOrderChannelCode(orderCreateParam.getOrderChannelCode());
        omsOrder.setOrderCountry(orderCreateParam.getReceiverAddress().getCountry());
        omsOrder.setPayAmount(orderCreateParam.getPayAmount());
        omsOrder.setPaymentTime(orderCreateParam.getPaymentTime());
        omsOrder.setFreightAmount(orderCreateParam.getFreightAmount());
        omsOrder.setNote(orderCreateParam.getNote());
        omsOrder.setMemberUsername(orderCreateParam.getMemberUsername());
        omsOrder.setReceiverName(orderCreateParam.getReceiverAddress().getName());
        omsOrder.setReceiverPhone(orderCreateParam.getReceiverAddress().getPhone());
        omsOrder.setReceiverPostCode(orderCreateParam.getReceiverAddress().getPostCode());
        omsOrder.setReceiverCountry(orderCreateParam.getReceiverAddress().getCountry());
        omsOrder.setReceiverCity(orderCreateParam.getReceiverAddress().getCity());
        omsOrder.setReceiverStreet(orderCreateParam.getReceiverAddress().getStreet());
        omsOrder.setReceiverStreetNum(orderCreateParam.getReceiverAddress().getStreetNum());
        omsOrder.setReceiverDetailAddress(orderCreateParam.getReceiverAddress().getDetailAddress());
        omsOrder.setCreateTime(LocalDateTime.now()); // 设置创建时间
        omsOrder.setModifyTime(LocalDateTime.now()); // 设置修改时间
        omsOrder.setStatus(0);
        omsOrder.setConfirmStatus(0);
        omsOrder.setDeleteStatus(0);

        // 3. 插入订单到数据库
        orderMapper.insertOrder(omsOrder);

        // 4. 获取订单 ID
        Long orderId = omsOrder.getId();
        if (orderId == null) {
            throw new RuntimeException("订单ID 生成失败");
        }

        // 5. 查询商品的仓库信息 (使用 productId 查询)
        log.info("5. 查询商品的仓库信息 (使用 productId 查询)");
        List<Long> productIds = orderCreateParam.getOrderItems().stream()
                .map(OmsOrderItemCreate::getProductId)  // 使用 productId
                .collect(Collectors.toList());
        Map<Long, PmsProductWarehouseInfo> warehouseInfoMap = productService.getWarehouseInfoByProductIds(productIds);
        log.info("仓库信息查询结果: {}", warehouseInfoMap);
        if (warehouseInfoMap == null || warehouseInfoMap.isEmpty()) {
            throw new RuntimeException("商品仓库信息查询失败，productIds：" + productIds);
        }

        // 6. 转换 OmsOrderItemSimple -> OmsOrderItem
        log.info("6. 转换 OmsOrderItemSimple -> OmsOrderItem");
        Map<String, List<OmsOrderItem>> parcelMap = new HashMap<>();
        for (OmsOrderItemCreate simpleItem : orderCreateParam.getOrderItems()) {
            PmsProductWarehouseInfo warehouseInfo = warehouseInfoMap.get(simpleItem.getProductId()); // 使用 productId
            if (warehouseInfo == null) {
                throw new RuntimeException("商品Id " + simpleItem.getProductId() + " 没有对应的仓库信息");
            }

            OmsOrderItem item = new OmsOrderItem();
            BeanUtils.copyProperties(simpleItem, item);
            item.setOrderId(orderId);
            item.setLocation(warehouseInfo.getLocation());
            item.setWarehouseId(warehouseInfo.getWarehouseId());

            parcelMap.computeIfAbsent(warehouseInfo.getLocation(), k -> new ArrayList<>()).add(item);
        }

        // 7. 创建包裹
        log.info("7. 创建包裹");
        List<OmsOrderParcel> parcelList = new ArrayList<>();
        for (String location : parcelMap.keySet()) {
            OmsOrderParcel parcel = new OmsOrderParcel();
            parcel.setOrderId(orderId);
            parcel.setWarehouseId(parcelMap.get(location).get(0).getWarehouseId());
            parcel.setLocation(location);
            parcel.setParcelStatus(0);
            parcel.setCreateTime(new Timestamp(System.currentTimeMillis()));
            parcel.setDeleteStatus(0);
            parcelList.add(parcel);
        }
        log.info("Created parcels: {}", parcelList);

        // 8. 批量插入订单包裹
        orderMapper.batchInsertParcels(parcelList);

        // 9. 绑定 `parcelId` 并插入订单商品
        List<OmsOrderItem> newOrderItemList = new ArrayList<>();
        for (OmsOrderParcel parcel : parcelList) {
            if (parcel.getId() == null) {
                throw new RuntimeException("包裹ID 生成失败");
            }

            List<OmsOrderItem> parcelOrderItems = parcelMap.get(parcel.getLocation());
            for (OmsOrderItem orderItem : parcelOrderItems) {
                orderItem.setParcelId(parcel.getId());
                for (OmsOrderItemCreate itemSimple : orderCreateParam.getOrderItems()) {
                    // 根据商品信息设置相应的字段
                    if (orderItem.getProductId().equals(itemSimple.getProductId())) { // 假设根据 ProductId 来匹配商品
                        orderItem.setProductId(itemSimple.getProductId());
                        orderItem.setItemStatus(0);
                        orderItem.setProductName(itemSimple.getProductName());
                        orderItem.setProductSn(itemSimple.getProductSn());
                        orderItem.setProductCode(itemSimple.getProductCode());
                        orderItem.setProductPrice(itemSimple.getProductPrice());
                        orderItem.setProductQuantity(itemSimple.getProductQuantity());
                        orderItem.setProductNote(itemSimple.getProductNote());
                        orderItem.setRealAmount(itemSimple.getRealAmount());
                        orderItem.setDeleteStatus(0); // 根据需求设置为 0
                        break;
                    }
                }
                newOrderItemList.add(orderItem);
            }
        }

        // 10. 批量插入订单商品
        orderMapper.batchInsertOrderItems(newOrderItemList);

        log.info("Order created successfully: {}", omsOrder);
        return omsOrder;
    }


    @Override
    public int updateReceiverInfo(OmsReceiverInfoParam receiverInfoParam) {
        log.info("info:{}", receiverInfoParam.getReceiverAddress().getCountry());
        // **1. 先查询订单是否存在**
        OmsOrder existingOrder = orderMapper.selectByOrderSn(receiverInfoParam.getOrderSn());
        if (existingOrder == null) {
            return 0; // 订单不存在，直接返回 0
        }

        // **2. 更新订单收货人信息**
        OmsOrder order = new OmsOrder();
        order.setOrderSn(receiverInfoParam.getOrderSn());
        order.setReceiverName(receiverInfoParam.getReceiverAddress().getName());
        order.setReceiverPhone(receiverInfoParam.getReceiverAddress().getPhone());
        order.setReceiverPostCode(receiverInfoParam.getReceiverAddress().getPostCode());
        order.setReceiverCountry(receiverInfoParam.getReceiverAddress().getCountry());
        order.setReceiverCity(receiverInfoParam.getReceiverAddress().getCity());
        order.setReceiverStreet(receiverInfoParam.getReceiverAddress().getStreet());
        order.setReceiverStreetNum(receiverInfoParam.getReceiverAddress().getStreetNum());
        order.setReceiverDetailAddress(receiverInfoParam.getReceiverAddress().getDetailAddress());
        order.setModifyTime(LocalDateTime.now());
        log.info("order:{}", order.getReceiverCountry());

        // **3. 进行更新**
        int count = orderMapper.updateByOrderSnSelective(order);

        // **4. 只有更新成功才插入操作记录**
        if (count > 0) {
            OmsOrderOperateHistory history = new OmsOrderOperateHistory();
            history.setOrderSn(receiverInfoParam.getOrderSn());
            history.setCreateTime(new Date());
            history.setOperateMan("后台管理员");
            history.setNote("修改收货人信息");
            orderOperateHistoryMapper.insert(history);
        }

        return count;
    }


    @Override
    public Integer paySuccess(Long orderId, Integer payType) {
        //修改订单支付状态
        OmsOrder order = new OmsOrder();
        order.setId(orderId);
        order.setStatus(1);
        order.setPaymentTime(LocalDateTime.now());
        order.setPayType(payType);
        OmsOrderExample orderExample = new OmsOrderExample();
        orderExample.createCriteria()
                .andIdEqualTo(order.getId())
                .andDeleteStatusEqualTo(0)
                .andStatusEqualTo(0);
        //只修改未付款状态的订单
        int updateCount = orderMapper.updateByExampleSelective(order, orderExample);
        if(updateCount==0){
            Asserts.fail("订单不存在或订单状态不是未支付！");
        }
        //恢复所有下单商品的锁定库存，扣减真实库存
        OmsOrderDetail orderDetail = portalOrderDao.getDetail(orderId);
        int totalCount = 0;
        for (OmsOrderItem orderItem : orderDetail.getOrderItemList()) {
            int count = portalOrderDao.reduceSkuStock(orderItem.getProductSkuId(),orderItem.getProductQuantity());
            if(count==0){
                Asserts.fail("库存不足，无法扣减！");
            }
            totalCount+=count;
        }
        return totalCount;
    }

    @Override
    public Integer cancelTimeOutOrder() {
        Integer count=0;
        OmsOrderSetting orderSetting = orderSettingMapper.selectByPrimaryKey(1L);
        //查询超时、未支付的订单及订单详情
        List<OmsOrderDetail> timeOutOrders = portalOrderDao.getTimeOutOrders(orderSetting.getNormalOrderOvertime());
        if (CollectionUtils.isEmpty(timeOutOrders)) {
            return count;
        }
        //修改订单状态为交易取消
        List<Long> ids = new ArrayList<>();
        for (OmsOrderDetail timeOutOrder : timeOutOrders) {
            ids.add(timeOutOrder.getId());
        }
        portalOrderDao.updateOrderStatus(ids, 4);
        for (OmsOrderDetail timeOutOrder : timeOutOrders) {
            //解除订单商品库存锁定
            portalOrderDao.releaseSkuStockLock(timeOutOrder.getOrderItemList());
            //修改优惠券使用状态
            updateCouponStatus(timeOutOrder.getCouponId(), timeOutOrder.getMemberId(), 0);
            //返还使用积分
            if (timeOutOrder.getUseIntegration() != null) {
                UmsMember member = memberService.getById(timeOutOrder.getMemberId());
                memberService.updateIntegration(timeOutOrder.getMemberId(), member.getIntegration() + timeOutOrder.getUseIntegration());
            }
        }
        return timeOutOrders.size();
    }

    @Override
    public void cancelOrder(Long orderId) {
        //查询未付款的取消订单
        OmsOrderExample example = new OmsOrderExample();
        example.createCriteria().andIdEqualTo(orderId).andStatusEqualTo(0).andDeleteStatusEqualTo(0);
        List<OmsOrder> cancelOrderList = orderMapper.selectByExample(example);
        if (CollectionUtils.isEmpty(cancelOrderList)) {
            return;
        }
        OmsOrder cancelOrder = cancelOrderList.get(0);
        if (cancelOrder != null) {
            //修改订单状态为取消
            cancelOrder.setStatus(4);
            orderMapper.updateByPrimaryKeySelective(cancelOrder);
            OmsOrderItemExample orderItemExample = new OmsOrderItemExample();
            orderItemExample.createCriteria().andOrderIdEqualTo(orderId);
            List<OmsOrderItem> orderItemList = orderItemMapper.selectByExample(orderItemExample);
            //解除订单商品库存锁定
            if (!CollectionUtils.isEmpty(orderItemList)) {
                for (OmsOrderItem orderItem : orderItemList) {
                    int count = portalOrderDao.releaseStockBySkuId(orderItem.getProductSkuId(),orderItem.getProductQuantity());
                    if(count==0){
                        Asserts.fail("库存不足，无法释放！");
                    }
                }
            }
            //修改优惠券使用状态
            updateCouponStatus(cancelOrder.getCouponId(), cancelOrder.getMemberId(), 0);
            //返还使用积分
            if (cancelOrder.getUseIntegration() != null) {
                UmsMember member = memberService.getById(cancelOrder.getMemberId());
                memberService.updateIntegration(cancelOrder.getMemberId(), member.getIntegration() + cancelOrder.getUseIntegration());
            }
        }
    }

    @Override
    public void sendDelayMessageCancelOrder(Long orderId) {
        //获取订单超时时间
        OmsOrderSetting orderSetting = orderSettingMapper.selectByPrimaryKey(1L);
        long delayTimes = orderSetting.getNormalOrderOvertime() * 60 * 1000;
        //发送延迟消息
        cancelOrderSender.sendMessage(orderId, delayTimes);
    }

    @Override
    public void confirmReceiveOrder(Long orderId) {
        UmsMember member = memberService.getCurrentMember();
        OmsOrder order = orderMapper.selectByPrimaryKey(orderId);
        if(!member.getId().equals(order.getMemberId())){
            Asserts.fail("不能确认他人订单！");
        }
        if(order.getStatus()!=2){
            Asserts.fail("该订单还未发货！");
        }
        order.setStatus(3);
        order.setConfirmStatus(1);
        order.setReceiveTime(LocalDateTime.now());
        orderMapper.updateByPrimaryKey(order);
    }

    @Override
    public CommonPage<OmsOrderDetail> list(Integer status, Integer pageNum, Integer pageSize) {
        if(status==-1){
            status = null;
        }
        UmsMember member = memberService.getCurrentMember();
        PageHelper.startPage(pageNum,pageSize);
        OmsOrderExample orderExample = new OmsOrderExample();
        OmsOrderExample.Criteria criteria = orderExample.createCriteria();
        criteria.andDeleteStatusEqualTo(0)
                .andMemberIdEqualTo(member.getId());
        if(status!=null){
            criteria.andStatusEqualTo(status);
        }
        orderExample.setOrderByClause("create_time desc");
        List<OmsOrder> orderList = orderMapper.selectByExample(orderExample);
        CommonPage<OmsOrder> orderPage = CommonPage.restPage(orderList);
        //设置分页信息
        CommonPage<OmsOrderDetail> resultPage = new CommonPage<>();
        resultPage.setPageNum(orderPage.getPageNum());
        resultPage.setPageSize(orderPage.getPageSize());
        resultPage.setTotal(orderPage.getTotal());
        resultPage.setTotalPage(orderPage.getTotalPage());
        if(CollUtil.isEmpty(orderList)){
            return resultPage;
        }
        //设置数据信息
        List<Long> orderIds = orderList.stream().map(OmsOrder::getId).collect(Collectors.toList());
        OmsOrderItemExample orderItemExample = new OmsOrderItemExample();
        orderItemExample.createCriteria().andOrderIdIn(orderIds);
        List<OmsOrderItem> orderItemList = orderItemMapper.selectByExample(orderItemExample);
        List<OmsOrderDetail> orderDetailList = new ArrayList<>();
        for (OmsOrder omsOrder : orderList) {
            OmsOrderDetail orderDetail = new OmsOrderDetail();
            BeanUtil.copyProperties(omsOrder,orderDetail);
            List<OmsOrderItem> relatedItemList = orderItemList.stream().filter(item -> item.getOrderId().equals(orderDetail.getId())).collect(Collectors.toList());
            orderDetail.setOrderItemList(relatedItemList);
            orderDetailList.add(orderDetail);
        }
        resultPage.setList(orderDetailList);
        return resultPage;
    }

    @Override
    public OmsOrderDeliveryDetail detail(String orderSn) {
        // 查询订单信息
        OmsOrder omsOrder = orderMapper.selectByOrderSn(orderSn);
        if (omsOrder == null) {
            throw new RuntimeException("订单不存在: " + orderSn);
        }

        // 查询订单的包裹信息
        List<OmsOrderParcel> orderParcels = orderMapper.getParcelsByIds(Arrays.asList(omsOrder.getId()));
        log.info("orderparcel:{}", orderParcels);

        // 构建返回对象
        OmsOrderDeliveryDetail deliveryDetail = new OmsOrderDeliveryDetail();
        deliveryDetail.setOrderSn(orderSn);

        // 组装包裹信息
        List<OmsOrderDeliveryDetail.Parcel> parcelList = new ArrayList<>();
        for (OmsOrderParcel parcel : orderParcels) {
            OmsOrderDeliveryDetail.Parcel parcelDetail = new OmsOrderDeliveryDetail.Parcel();
            parcelDetail.setParcelId(parcel.getId());

            // 设置物流信息
            OmsOrderDeliveryDetail.Delivery delivery = new OmsOrderDeliveryDetail.Delivery();
            delivery.setParcelCompany(parcel.getParcelCompany());
            delivery.setParcelSn(parcel.getParcelSn());
            delivery.setParcelStatus(parcel.getParcelStatus());
//            delivery.setStatusDescription(parcel.getStatusDescription());
//            delivery.setLastOperator(parcel.getLastOperator());
//            delivery.setLatestUpdate(parcel.getLatestUpdate().getTime()); // 假设 latestUpdate 是 Date 类型
            delivery.setLocation(parcel.getLocation());
            parcelDetail.setDelivery(delivery);

            // 查询包裹内商品
            List<OmsOrderItem> parcelItems = orderMapper.getItemsByParcelId(parcel.getId());
            List<OmsOrderDeliveryDetail.Item> itemList = new ArrayList<>();
            for (OmsOrderItem item : parcelItems) {
                OmsOrderDeliveryDetail.Item itemDetail = new OmsOrderDeliveryDetail.Item();
                itemDetail.setProductSn(item.getProductSn());
                itemDetail.setProductName(item.getProductName());
                itemDetail.setProductQuantity(item.getProductQuantity());
                itemDetail.setProductStatus(item.getItemStatus());
                itemList.add(itemDetail);
            }
            parcelDetail.setItems(itemList);

            // 添加到包裹列表
            parcelList.add(parcelDetail);
        }

        deliveryDetail.setParcels(parcelList);
        return deliveryDetail;
    }

    @Override
    public void deleteOrder(Long orderId) {
        UmsMember member = memberService.getCurrentMember();
        OmsOrder order = orderMapper.selectByPrimaryKey(orderId);
        if(!member.getId().equals(order.getMemberId())){
            Asserts.fail("不能删除他人订单！");
        }
        if(order.getStatus()==3||order.getStatus()==4){
            order.setDeleteStatus(1);
            orderMapper.updateByPrimaryKey(order);
        }else{
            Asserts.fail("只能删除已完成或已关闭的订单！");
        }
    }

    @Override
    public void paySuccessByOrderSn(String orderSn, Integer payType) {
        OmsOrderExample example =  new OmsOrderExample();
        example.createCriteria()
                .andOrderSnEqualTo(orderSn)
                .andStatusEqualTo(0)
                .andDeleteStatusEqualTo(0);
        List<OmsOrder> orderList = orderMapper.selectByExample(example);
        if(CollUtil.isNotEmpty(orderList)){
            OmsOrder order = orderList.get(0);
            paySuccess(order.getId(),payType);
        }
    }

    /**
     * 生成18位订单编号:8位日期+2位平台号码+2位支付方式+6位以上自增id
     */
    private String generateOrderSn(OmsOrder order) {
        StringBuilder sb = new StringBuilder();
        String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String key = REDIS_DATABASE+":"+ REDIS_KEY_ORDER_ID + date;
        Long increment = redisService.incr(key, 1);
        sb.append(date);
        sb.append(String.format("%02d", order.getSourceType()));
        sb.append(String.format("%02d", order.getPayType()));
        String incrementStr = increment.toString();
        if (incrementStr.length() <= 6) {
            sb.append(String.format("%06d", increment));
        } else {
            sb.append(incrementStr);
        }
        return sb.toString();
    }

    /**
     * 从购物车中删除已下单的商品信息
     */
    private void deleteCartItemList(List<CartPromotionItem> cartPromotionItemList, UmsMember currentMember) {
        List<Long> ids = new ArrayList<>();
        for (CartPromotionItem cartPromotionItem : cartPromotionItemList) {
            ids.add(cartPromotionItem.getId());
        }
        cartItemService.delete(currentMember.getId(), ids);
    }

    /**
     * 计算该订单赠送的成长值
     */
    private Integer calcGiftGrowth(List<OmsOrderItem> orderItemList) {
        Integer sum = 0;
        for (OmsOrderItem orderItem : orderItemList) {
            sum = sum + orderItem.getGiftGrowth() * orderItem.getProductQuantity();
        }
        return sum;
    }

    /**
     * 计算该订单赠送的积分
     */
    private Integer calcGifIntegration(List<OmsOrderItem> orderItemList) {
        int sum = 0;
        for (OmsOrderItem orderItem : orderItemList) {
            sum += orderItem.getGiftIntegration() * orderItem.getProductQuantity();
        }
        return sum;
    }

    /**
     * 将优惠券信息更改为指定状态
     *
     * @param couponId  优惠券id
     * @param memberId  会员id
     * @param useStatus 0->未使用；1->已使用
     */
    private void updateCouponStatus(Long couponId, Long memberId, Integer useStatus) {
        if (couponId == null) return;
        //查询第一张优惠券
        SmsCouponHistoryExample example = new SmsCouponHistoryExample();
        example.createCriteria().andMemberIdEqualTo(memberId)
                .andCouponIdEqualTo(couponId).andUseStatusEqualTo(useStatus == 0 ? 1 : 0);
        List<SmsCouponHistory> couponHistoryList = couponHistoryMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(couponHistoryList)) {
            SmsCouponHistory couponHistory = couponHistoryList.get(0);
            couponHistory.setUseTime(new Date());
            couponHistory.setUseStatus(useStatus);
            couponHistoryMapper.updateByPrimaryKeySelective(couponHistory);
        }
    }

    private void handleRealAmount(List<OmsOrderItem> orderItemList) {
        for (OmsOrderItem orderItem : orderItemList) {
            //原价-促销优惠-优惠券抵扣-积分抵扣
            BigDecimal realAmount = orderItem.getProductPrice()
                    .subtract(orderItem.getPromotionAmount())
                    .subtract(orderItem.getCouponAmount())
                    .subtract(orderItem.getIntegrationAmount());
            orderItem.setRealAmount(realAmount);
        }
    }

    /**
     * 获取订单促销信息
     */
    private String getOrderPromotionInfo(List<OmsOrderItem> orderItemList) {
        StringBuilder sb = new StringBuilder();
        for (OmsOrderItem orderItem : orderItemList) {
            sb.append(orderItem.getPromotionName());
            sb.append(";");
        }
        String result = sb.toString();
        if (result.endsWith(";")) {
            result = result.substring(0, result.length() - 1);
        }
        return result;
    }

    /**
     * 计算订单应付金额
     */
    private BigDecimal calcPayAmount(OmsOrder order) {
        //总金额+运费-促销优惠-优惠券优惠-积分抵扣
        BigDecimal payAmount = order.getTotalAmount()
                .add(order.getFreightAmount())
                .subtract(order.getPromotionAmount())
                .subtract(order.getCouponAmount())
                .subtract(order.getIntegrationAmount());
        return payAmount;
    }

    /**
     * 计算订单优惠券金额
     */
    private BigDecimal calcIntegrationAmount(List<OmsOrderItem> orderItemList) {
        BigDecimal integrationAmount = new BigDecimal(0);
        for (OmsOrderItem orderItem : orderItemList) {
            if (orderItem.getIntegrationAmount() != null) {
                integrationAmount = integrationAmount.add(orderItem.getIntegrationAmount().multiply(new BigDecimal(orderItem.getProductQuantity())));
            }
        }
        return integrationAmount;
    }

    /**
     * 计算订单优惠券金额
     */
    private BigDecimal calcCouponAmount(List<OmsOrderItem> orderItemList) {
        BigDecimal couponAmount = new BigDecimal(0);
        for (OmsOrderItem orderItem : orderItemList) {
            if (orderItem.getCouponAmount() != null) {
                couponAmount = couponAmount.add(orderItem.getCouponAmount().multiply(new BigDecimal(orderItem.getProductQuantity())));
            }
        }
        return couponAmount;
    }

    /**
     * 计算订单活动优惠
     */
    private BigDecimal calcPromotionAmount(List<OmsOrderItem> orderItemList) {
        BigDecimal promotionAmount = new BigDecimal(0);
        for (OmsOrderItem orderItem : orderItemList) {
            if (orderItem.getPromotionAmount() != null) {
                promotionAmount = promotionAmount.add(orderItem.getPromotionAmount().multiply(new BigDecimal(orderItem.getProductQuantity())));
            }
        }
        return promotionAmount;
    }

    /**
     * 获取可用积分抵扣金额
     *
     * @param useIntegration 使用的积分数量
     * @param totalAmount    订单总金额
     * @param currentMember  使用的用户
     * @param hasCoupon      是否已经使用优惠券
     */
    private BigDecimal getUseIntegrationAmount(Integer useIntegration, BigDecimal totalAmount, UmsMember currentMember, boolean hasCoupon) {
        BigDecimal zeroAmount = new BigDecimal(0);
        //判断用户是否有这么多积分
        if (useIntegration.compareTo(currentMember.getIntegration()) > 0) {
            return zeroAmount;
        }
        //根据积分使用规则判断是否可用
        //是否可与优惠券共用
        UmsIntegrationConsumeSetting integrationConsumeSetting = integrationConsumeSettingMapper.selectByPrimaryKey(1L);
        if (hasCoupon && integrationConsumeSetting.getCouponStatus().equals(0)) {
            //不可与优惠券共用
            return zeroAmount;
        }
        //是否达到最低使用积分门槛
        if (useIntegration.compareTo(integrationConsumeSetting.getUseUnit()) < 0) {
            return zeroAmount;
        }
        //是否超过订单抵用最高百分比
        BigDecimal integrationAmount = new BigDecimal(useIntegration).divide(new BigDecimal(integrationConsumeSetting.getUseUnit()), 2, RoundingMode.HALF_EVEN);
        BigDecimal maxPercent = new BigDecimal(integrationConsumeSetting.getMaxPercentPerOrder()).divide(new BigDecimal(100), 2, RoundingMode.HALF_EVEN);
        if (integrationAmount.compareTo(totalAmount.multiply(maxPercent)) > 0) {
            return zeroAmount;
        }
        return integrationAmount;
    }

    /**
     * 对每个下单商品进行优惠券金额分摊的计算
     *
     * @param orderItemList 可用优惠券的下单商品商品
     */
    private void calcPerCouponAmount(List<OmsOrderItem> orderItemList, SmsCoupon coupon) {
        BigDecimal totalAmount = calcTotalAmount(orderItemList);
        for (OmsOrderItem orderItem : orderItemList) {
            //(商品价格/可用商品总价)*优惠券面额
            BigDecimal couponAmount = orderItem.getProductPrice().divide(totalAmount, 3, RoundingMode.HALF_EVEN).multiply(coupon.getAmount());
            orderItem.setCouponAmount(couponAmount);
        }
    }

    /**
     * 获取该用户可以使用的优惠券
     *
     * @param cartPromotionItemList 购物车优惠列表
     * @param couponId              使用优惠券id
     */
    private SmsCouponHistoryDetail getUseCoupon(List<CartPromotionItem> cartPromotionItemList, Long couponId) {
        List<SmsCouponHistoryDetail> couponHistoryDetailList = memberCouponService.listCart(cartPromotionItemList, 1);
        for (SmsCouponHistoryDetail couponHistoryDetail : couponHistoryDetailList) {
            if (couponHistoryDetail.getCoupon().getId().equals(couponId)) {
                return couponHistoryDetail;
            }
        }
        return null;
    }

    /**
     * 计算总金额
     */
    private BigDecimal calcTotalAmount(List<OmsOrderItem> orderItemList) {
        BigDecimal totalAmount = new BigDecimal("0");
        for (OmsOrderItem item : orderItemList) {
            totalAmount = totalAmount.add(item.getProductPrice().multiply(new BigDecimal(item.getProductQuantity())));
        }
        return totalAmount;
    }

    /**
     * 锁定下单商品的所有库存
     */
    private void lockStock(List<CartPromotionItem> cartPromotionItemList) {
        for (CartPromotionItem cartPromotionItem : cartPromotionItemList) {
            PmsSkuStock skuStock = skuStockMapper.selectByPrimaryKey(cartPromotionItem.getProductSkuId());
            skuStock.setLockStock(skuStock.getLockStock() + cartPromotionItem.getQuantity());
            int count = portalOrderDao.lockStockBySkuId(cartPromotionItem.getProductSkuId(),cartPromotionItem.getQuantity());
            if(count==0){
                Asserts.fail("库存不足，无法下单");
            }
        }
    }

    /**
     * 判断下单商品是否都有库存
     */
    private boolean hasStock(List<CartPromotionItem> cartPromotionItemList) {
        for (CartPromotionItem cartPromotionItem : cartPromotionItemList) {
            if (cartPromotionItem.getRealStock()==null //判断真实库存是否为空
                    ||cartPromotionItem.getRealStock() <= 0 //判断真实库存是否小于0
                    || cartPromotionItem.getRealStock() < cartPromotionItem.getQuantity()) //判断真实库存是否小于下单的数量
            {
                return false;
            }
        }
        return true;
    }

    /**
     * 计算购物车中商品的价格
     */
    private ConfirmOrderResult.CalcAmount calcCartAmount(List<CartPromotionItem> cartPromotionItemList) {
        ConfirmOrderResult.CalcAmount calcAmount = new ConfirmOrderResult.CalcAmount();
        calcAmount.setFreightAmount(new BigDecimal(0));
        BigDecimal totalAmount = new BigDecimal("0");
        BigDecimal promotionAmount = new BigDecimal("0");
        for (CartPromotionItem cartPromotionItem : cartPromotionItemList) {
            totalAmount = totalAmount.add(cartPromotionItem.getPrice().multiply(new BigDecimal(cartPromotionItem.getQuantity())));
            promotionAmount = promotionAmount.add(cartPromotionItem.getReduceAmount().multiply(new BigDecimal(cartPromotionItem.getQuantity())));
        }
        calcAmount.setTotalAmount(totalAmount);
        calcAmount.setPromotionAmount(promotionAmount);
        calcAmount.setPayAmount(totalAmount.subtract(promotionAmount));
        return calcAmount;
    }

}
