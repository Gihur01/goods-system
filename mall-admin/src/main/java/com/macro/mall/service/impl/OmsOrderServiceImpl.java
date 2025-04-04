package com.macro.mall.service.impl;

import com.github.pagehelper.PageHelper;
import com.macro.mall.common.exception.Asserts;
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
import org.springframework.context.annotation.Bean;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.*;
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
        List<UmsRole> userRoles = umsAdminService.getCurrentUserRole();
        if (userRoles == null || userRoles.isEmpty()) {
            log.warn("当前用户没有角色信息");
            return Collections.emptyList();
        }

        Long roleId = userRoles.get(0).getId();
        log.info("角色ID: {}", roleId);

        // Java 8 兼容的 Set 初始化方式
        Set<Long> warehouseRoles = Collections.singleton(7L);
        Set<Long> locationRoles = Collections.singleton(8L);

        // 获取当前用户有权限的仓库 ID
        if (warehouseRoles.contains(roleId)) {
            List<Long> warehouseIds = umsAdminService.getWarehousesByAdminId();
            log.info("用户有权限的仓库ID: {}", warehouseIds);

            // 如果 queryParam 传了 warehouseId，则交叉筛选
            if (queryParam.getWarehouseId() != null && !queryParam.getWarehouseId().isEmpty()) {
                // 取交集：保证最终的 warehouseId 仍在用户权限范围内
                List<Long> filteredWarehouseIds = queryParam.getWarehouseId()
                        .stream()
                        .filter(warehouseIds::contains)
                        .collect(Collectors.toList());

                // 交集为空时，返回空列表，避免无权限数据泄露
                if (filteredWarehouseIds.isEmpty()) {
                    log.warn("用户传入的仓库ID不在权限范围内，返回空列表");
                    return Collections.emptyList();
                }

                queryParam.setWarehouseId(filteredWarehouseIds);
            } else {
                // 直接使用用户有权限的仓库 ID
                queryParam.setWarehouseId(warehouseIds);
            }
        }

        if (locationRoles.contains(roleId)) {
            String location = umsAdminService.getOrderCountryNum();
            log.info("物流国家: {}", location);
            queryParam.setLocation(location);
        }

        log.info("最终查询参数: {}", queryParam);

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
        order.setModifyTime(LocalDateTime.now());
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
        order.setModifyTime(LocalDateTime.now());
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
        order.setModifyTime(LocalDateTime.now());
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
        log.info("获取的包裹信息: {}", parcels);

        for (OmsOrderParcel parcel : parcels) {

            // 仅当 parcelStatus 为 1 (未发货) 时才处理
            if (parcel.getParcelStatus() != 1) {
                log.info("包裹ID: {} 状态为 {}，跳过该包裹", parcel.getId(), parcel.getParcelStatus());
                continue;  // 跳过状态不是 1 的包裹
            }

            if (parcel.getOrderId() == null) {
                log.error("包裹数据异常，orderId 为空，parcelId: {}", parcel.getId());
                continue;
            }

            Long orderId = parcel.getOrderId();
            log.info("parcel.orderId: {}", parcel.getOrderId());
            String parcelLocation = parcel.getLocation();
            log.info("parcel.getLocation: {}", parcel.getLocation());

            // 查询订单获取 order_country
            OmsOrder order = orderMapper.getOrderById(orderId);
            if (order == null) {
                log.error("订单ID: {} 未找到，无法获取 order_country", orderId);
                continue;
            }
            String orderCountry = order.getReceiverCountry();
            log.info("orderCountry: {}", order.getReceiverCountry());

            OmsGLSAddress finalReceiverAddress = new OmsGLSAddress();
            finalReceiverAddress.setName(order.getReceiverName());
            finalReceiverAddress.setStreet(order.getReceiverStreet());
            finalReceiverAddress.setHouseNumber(order.getReceiverStreetNum());
            finalReceiverAddress.setHouseNumberInfo(order.getReceiverDetailAddress());
            finalReceiverAddress.setCity(order.getReceiverCity());
            finalReceiverAddress.setZipCode(order.getReceiverPostCode());
            finalReceiverAddress.setCountryIsoCode(order.getReceiverCountry());
            finalReceiverAddress.setContactName(order.getReceiverName());

            // 获取发货人地址（仓库地址）
            OmsGLSAddress senderAddress = centerService.getTransitAddressByCountry(parcel.getLocation());
            log.info("senderCountry: {}", senderAddress.getCountryIsoCode());

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
                callGLSApi(parcel.getId(), transitAddress, senderAddress);

                // **创建新的包裹**
                OmsOrderParcel newParcel = new OmsOrderParcel();
                newParcel.setOrderId(orderId);
                newParcel.setWarehouseId(parcel.getWarehouseId());
                newParcel.setLocation(orderCountry);
                newParcel.setCreateTime(new Timestamp(System.currentTimeMillis()));
                newParcel.setParcelStatus(1); // 未发货
                orderMapper.insertParcel(newParcel);
                log.info("New Parcel ID: {}", newParcel.getId());

                // **第二个包裹: 从 order_country（中转仓库）发往最终客户**
                callGLSApi(newParcel.getId(), finalReceiverAddress, transitAddress);
            } else {
                // **普通国内包裹，直接发到客户地址**
                callGLSApi(parcel.getId(), finalReceiverAddress, senderAddress);
            }
        }
        return parcels.size();
    }

    /**
     * 调用 GLS API 获取 ParcelSn
     * @param parcelId 需要发货的包裹id
     * @param receiverAddress 收件人地址
     * @param senderAddress 发件人地址
     */
    private void callGLSApi(Long parcelId, OmsGLSAddress receiverAddress, OmsGLSAddress senderAddress) {
        // 生成 parcelSn
        String parcelSn = receiverAddress.getCountryIsoCode() + senderAddress.getCountryIsoCode();

        // 记录日志
        log.info("ParcelSn: {}", parcelSn);

        // 更新数据库中的 parcel_sn
        orderMapper.updateParcelSn(parcelId, parcelSn, 2);
    }


    public byte[] getPrintedLabels(List<String> parcelSnList) {
//        String url = "https://api.test.mygls.hu/ParcelService.svc/json/GetPrintedLabels";
//
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_JSON);
//
//        // 构造请求体
//        Map<String, Object> requestBody = new HashMap<>();
//        requestBody.put("ParcelIdList", parcelSnList);
//        requestBody.put("PrintPosition", 1); // 1-4 可选
//        requestBody.put("ShowPrintDialog", false); // 不直接弹出打印对话框
//
//        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);
//
//        ResponseEntity<byte[]> response = restTemplate.exchange(
//                url,
//                HttpMethod.POST,
//                entity,
//                byte[].class
//        );
//
//        return response.getBody();
        try {
            // 读取本地 PDF 文件，路径改成你自己的
            Path pdfPath = Paths.get("C:/Users/Mr.Li/Downloads/mygls_api_20210106/CSHARP-PHP-JAVA_SOAP-REST_CLIENTS_PUBLISHED_10/JAVA/java_clients/java_clients_rest_PrintLabels.pdf");
            return Files.readAllBytes(pdfPath);
        } catch (IOException e) {
            e.printStackTrace();
            // 记录异常并返回自定义错误信息
            throw new RuntimeException("Failed to read the PDF file: " + e.getMessage());
        }
    }


    public List<OmsOrderItemSimple> stockup(List<Long> parcelIds, OmsOrderParcelQueryParam queryParam) {
        List<OmsOrderItemSimple> packingList = new ArrayList<>();

        if (parcelIds == null || parcelIds.isEmpty()) {
            // 获取当前用户角色信息
            List<UmsRole> userRoles = umsAdminService.getCurrentUserRole();
            if (userRoles == null || userRoles.isEmpty()) {
                log.warn("当前用户没有角色信息");
                return Collections.emptyList();
            }

            Long roleId = userRoles.get(0).getId();
            log.info("角色ID: {}", roleId);

            Set<Long> warehouseRoles = Collections.singleton(7L);
            Set<Long> locationRoles = Collections.singleton(8L);

            // 如果用户有仓库权限，则筛选仓库
            if (warehouseRoles.contains(roleId)) {
                List<Long> warehouseIds = umsAdminService.getWarehousesByAdminId();
                log.info("用户有权限的仓库ID: {}", warehouseIds);

                if (queryParam.getWarehouseId() != null && !queryParam.getWarehouseId().isEmpty()) {
                    List<Long> filteredWarehouseIds = queryParam.getWarehouseId()
                            .stream()
                            .filter(warehouseIds::contains)
                            .collect(Collectors.toList());

                    if (filteredWarehouseIds.isEmpty()) {
                        log.warn("用户传入的仓库ID不在权限范围内，返回空列表");
                        return Collections.emptyList();
                    }
                    queryParam.setWarehouseId(filteredWarehouseIds);
                } else {
                    queryParam.setWarehouseId(warehouseIds);
                }
            }

            if (locationRoles.contains(roleId)) {
                String location = umsAdminService.getOrderCountryNum();
                log.info("物流国家: {}", location);
                queryParam.setLocation(location);
            }

            log.info("最终查询参数: {}", queryParam);
            log.info("3. 根据 queryParam 查询符合条件的包裹");
            List<OmsOrderParcel> parcelList = orderDao.getListParcel(queryParam);

            log.info("4. 提取 parcelIds");
            parcelIds = parcelList.stream()
                    .map(OmsOrderParcel::getId)
                    .filter(Objects::nonNull)
                    .distinct()
                    .collect(Collectors.toList());
        }

        if (parcelIds.isEmpty()) {
            return Collections.emptyList();
        }

        log.info("5. 根据 parcelIds 查询备货清单");
        packingList = orderMapper.getPackingList(parcelIds);

        if (packingList.isEmpty()) {
            return Collections.emptyList();
        }

        log.info("6. 检查 item_status 是否可更新");

        // 查询当前状态
        Map<Long, Map<String, Object>> rawStatusMap = orderMapper.getItemStatuses(parcelIds);
        log.info("查询到的 item_status Map: {}", rawStatusMap);
        Map<Long, Integer> currentStatusMap = rawStatusMap.entrySet().stream()
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        entry -> (Integer) entry.getValue().get("item_status")
                ));

        int newStatus = 3; // 目标状态（开始备货）
        for (Map.Entry<Long, Integer> entry : currentStatusMap.entrySet()) {
            Long parcelId = entry.getKey();
            Integer currentStatus = entry.getValue();

            if (currentStatus == null || currentStatus >= newStatus) {
                String errorMessage = "状态更新失败：包裹 " + parcelId + " 当前状态为 " + currentStatus + "，无法更新到 " + newStatus;
                log.error(errorMessage);

                // 抛出 ApiException 异常
                Asserts.fail(errorMessage);  // 使用 Asserts 类来抛出 ApiException
            }
        }

        log.info("7. 更新 item_status = {}", newStatus);
        int updatedRows = orderMapper.updateStatus("oms_order_item", "item_status", newStatus, "parcel_id", parcelIds);

        if (updatedRows != parcelIds.size()) {
            String errorMessage ="状态更新失败：部分包裹未能成功更新";
            log.error(errorMessage);

            // 抛出 ApiException 异常
            Asserts.fail(errorMessage);  // 使用 Asserts 类来抛出 ApiException
        }

        return packingList;
    }

    public int completePacking(List<Long> parcelIds, OmsOrderParcelQueryParam queryParam) {
        if (parcelIds != null && !parcelIds.isEmpty()) {
            return orderMapper.updateStatus("oms_order_item", "item_status", 4, "parcel_id", parcelIds);
        } else {
            List<UmsRole> userRoles = umsAdminService.getCurrentUserRole();
            if (userRoles == null || userRoles.isEmpty()) {
                log.warn("当前用户没有角色信息");
                return 0;
            }

            Long roleId = userRoles.get(0).getId();
            log.info("角色ID: {}", roleId);

            // Java 8 兼容的 Set 初始化方式
            Set<Long> warehouseRoles = Collections.singleton(7L);
            Set<Long> locationRoles = Collections.singleton(8L);

            // 获取当前用户有权限的仓库 ID
            if (warehouseRoles.contains(roleId)) {
                List<Long> warehouseIds = umsAdminService.getWarehousesByAdminId();
                log.info("用户有权限的仓库ID: {}", warehouseIds);

                // 如果 queryParam 传了 warehouseId，则交叉筛选
                if (queryParam.getWarehouseId() != null && !queryParam.getWarehouseId().isEmpty()) {
                    // 取交集：保证最终的 warehouseId 仍在用户权限范围内
                    List<Long> filteredWarehouseIds = queryParam.getWarehouseId()
                            .stream()
                            .filter(warehouseIds::contains)
                            .collect(Collectors.toList());

                    // 交集为空时，返回空列表，避免无权限数据泄露
                    if (filteredWarehouseIds.isEmpty()) {
                        log.warn("用户传入的仓库ID不在权限范围内，返回空列表");
                        return 0;
                    }

                    queryParam.setWarehouseId(filteredWarehouseIds);
                } else {
                    // 直接使用用户有权限的仓库 ID
                    queryParam.setWarehouseId(warehouseIds);
                }
            }

            if (locationRoles.contains(roleId)) {
                String location = umsAdminService.getOrderCountryNum();
                log.info("物流国家: {}", location);
                queryParam.setLocation(location);
            }

            log.info("最终查询参数: {}", queryParam);

            log.info("3. 根据 queryParam 查询符合条件的包裹");
            List<OmsOrderParcel> parcelList = orderDao.getListParcel(queryParam);

            log.info("4. 提取 parcelIds");
            List<Long> parcelIdsFromQuery = parcelList.stream()
                    .map(OmsOrderParcel::getId)
                    .filter(Objects::nonNull)
                    .distinct()
                    .collect(Collectors.toList());

            log.info("5. 检查 item_status 是否可更新");

            // 查询当前状态
            Map<Long, Map<String, Object>> rawStatusMap = orderMapper.getItemStatuses(parcelIdsFromQuery);
            log.info("查询到的 item_status Map: {}", rawStatusMap);
            Map<Long, Integer> currentStatusMap = rawStatusMap.entrySet().stream()
                    .collect(Collectors.toMap(
                            Map.Entry::getKey,
                            entry -> (Integer) entry.getValue().get("item_status")
                    ));

            int newStatus = 4; // 目标状态（开始备货）
            for (Map.Entry<Long, Integer> entry : currentStatusMap.entrySet()) {
                Long parcelId = entry.getKey();
                Integer currentStatus = entry.getValue();

                if (currentStatus == null || currentStatus >= newStatus) {
                    String errorMessage = "状态更新失败：包裹 " + parcelId + " 当前状态为 " + currentStatus + "，无法更新到 " + newStatus;
                    log.error(errorMessage);

                    // 抛出 ApiException 异常
                    Asserts.fail(errorMessage);  // 使用 Asserts 类来抛出 ApiException
                }
            }

            if (!parcelIdsFromQuery.isEmpty()) {
                log.info("6. 根据查询到的 parcelIds 更新状态");
                return orderMapper.updateStatus("oms_order_item", "item_status", newStatus, "parcel_id", parcelIdsFromQuery);
            }
        }
        String errorMessage = "状态更新失败：包裹 ";
        log.error(errorMessage);

        // 抛出 ApiException 异常
        Asserts.fail(errorMessage);  // 使用 Asserts 类来抛出 ApiException
        return 0;
    }

    public int collectParcel(List<Long> parcelIds, OmsOrderParcelQueryParam queryParam) {
        if (parcelIds != null && !parcelIds.isEmpty()) {
            return orderMapper.updateStatus("oms_order_parcel", "parcel_status", 5, "id", parcelIds);
        } else {
            List<UmsRole> userRoles = umsAdminService.getCurrentUserRole();
            if (userRoles == null || userRoles.isEmpty()) {
                log.warn("当前用户没有角色信息");
                return 0;
            }

            Long roleId = userRoles.get(0).getId();
            log.info("角色ID: {}", roleId);

            // Java 8 兼容的 Set 初始化方式
            Set<Long> warehouseRoles = Collections.singleton(7L);
            Set<Long> locationRoles = Collections.singleton(8L);

            // 获取当前用户有权限的仓库 ID
            if (warehouseRoles.contains(roleId)) {
                List<Long> warehouseIds = umsAdminService.getWarehousesByAdminId();
                log.info("用户有权限的仓库ID: {}", warehouseIds);

                // 如果 queryParam 传了 warehouseId，则交叉筛选
                if (queryParam.getWarehouseId() != null && !queryParam.getWarehouseId().isEmpty()) {
                    // 取交集：保证最终的 warehouseId 仍在用户权限范围内
                    List<Long> filteredWarehouseIds = queryParam.getWarehouseId()
                            .stream()
                            .filter(warehouseIds::contains)
                            .collect(Collectors.toList());

                    // 交集为空时，返回空列表，避免无权限数据泄露
                    if (filteredWarehouseIds.isEmpty()) {
                        log.warn("用户传入的仓库ID不在权限范围内，返回空列表");
                        return 0;
                    }

                    queryParam.setWarehouseId(filteredWarehouseIds);
                } else {
                    // 直接使用用户有权限的仓库 ID
                    queryParam.setWarehouseId(warehouseIds);
                }
            }

            if (locationRoles.contains(roleId)) {
                String location = umsAdminService.getOrderCountryNum();
                log.info("物流国家: {}", location);
                queryParam.setLocation(location);
            }

            log.info("最终查询参数: {}", queryParam);

            log.info("3. 根据 queryParam 查询符合条件的包裹");
            List<OmsOrderParcel> parcelList = orderDao.getListParcel(queryParam);

            log.info("4. 提取 parcelIds");
            List<Long> parcelIdsFromQuery = parcelList.stream()
                    .map(OmsOrderParcel::getId)
                    .filter(Objects::nonNull)
                    .distinct()
                    .collect(Collectors.toList());

            log.info("5. 检查 parcel_status 是否可更新");

            // 查询当前状态
            Map<Long, Map<String, Object>> rawStatusMap = orderMapper.getParcelStatuses(parcelIdsFromQuery);
            log.info("查询到的 parcel_status Map: {}", rawStatusMap);
            Map<Long, Integer> currentStatusMap = rawStatusMap.entrySet().stream()
                    .collect(Collectors.toMap(
                            Map.Entry::getKey,
                            entry -> (Integer) entry.getValue().get("parcel_status")
                    ));

            int targetStatus = 5; // 目标状态（开始备货）
            for (Map.Entry<Long, Integer> entry : currentStatusMap.entrySet()) {
                Long parcelId = entry.getKey();
                Integer currentStatus = entry.getValue();

                // 如果当前状态已经是目标状态或更高，抛出异常
                if (currentStatus == null || currentStatus >= targetStatus) {
                    String errorMessage = "状态更新失败：包裹 " + parcelId + " 当前状态为 " + currentStatus + "，无法更新到 " + targetStatus;
                    log.error(errorMessage);
                    Asserts.fail(errorMessage);  // 抛出异常
                }
            }

            if (!parcelIdsFromQuery.isEmpty()) {
                log.info("5. 根据查询到的 parcelIds 更新状态");
                return orderMapper.updateStatus("oms_order_parcel", "parcel_status", targetStatus, "id", parcelIdsFromQuery);
            }
        }
        log.warn("没有找到需要更新的包裹");
        return 0;

    }

}
