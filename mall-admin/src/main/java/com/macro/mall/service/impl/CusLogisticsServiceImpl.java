package com.macro.mall.service.impl;

import com.alibaba.excel.EasyExcel;
import com.macro.mall.dto.CusLogisticsBaseDTO;
import com.macro.mall.dto.CusQueryParam;
import com.macro.mall.mapper.CusLogisticsMapper;
import com.macro.mall.model.CusBaseLogistics;
import com.macro.mall.model.CusLogistics;
import com.macro.mall.model.CusLogisticsHistory;
import com.macro.mall.model.UmsRole;
import com.macro.mall.service.CusLogisticsService;
import com.macro.mall.service.OmsOrderService;
import com.macro.mall.service.UmsAdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import java.io.File;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.IOException;
import java.lang.reflect.Field;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Service
public class CusLogisticsServiceImpl implements CusLogisticsService {
    @Autowired
    private UmsAdminService umsAdminService;

    private static final Logger log = LoggerFactory.getLogger(OmsOrderService.class);
    @Autowired
    private CusLogisticsMapper cusLogisticsMapper;

    /**
     * 获取所有物流记录
     * @return 物流记录列表
     */
    @Override
    public List<CusBaseLogistics> getAllLogistics(CusQueryParam queryParam) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        ZoneId zone = ZoneId.of("UTC"); // 强烈建议固定使用 UTC

        Long startTimestamp = null;
        Long endTimestamp = null;

        if (queryParam.getStartDate() != null) {
            startTimestamp = LocalDate.parse(queryParam.getStartDate(), formatter)
                    .atStartOfDay(zone)
                    .toInstant().toEpochMilli();
        }

        if (queryParam.getEndDate() != null) {
            endTimestamp = LocalDate.parse(queryParam.getEndDate(), formatter)
                    .plusDays(1)
                    .atStartOfDay(zone)
                    .toInstant().toEpochMilli() - 1;
        }

        // 打印日志辅助调试
//        System.out.println("开始时间戳（ms）：" + startTimestamp);
//        System.out.println("结束时间戳（ms）：" + endTimestamp);
//        System.out.println("开始时间（UTC）：" + Instant.ofEpochMilli(startTimestamp));
//        System.out.println("结束时间（UTC）：" + Instant.ofEpochMilli(endTimestamp));

        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        log.info("username:{}", username);
        List<UmsRole> userRoles = umsAdminService.getCurrentUserRole();
        String role = userRoles.get(0).getName();

        String field;
        if ("清关代理公司".equals(role)) {
            field = "cc_companyno";
        } else if ("物流代理公司".equals(role)) {
            field = "fw_logistics_no";
        } else if ("发货代理公司".equals(role)) {
            field = "acceptance_channel_no";
        } else if ("超级管理员".equals(role)) {
            return cusLogisticsMapper.ROOTselectAllLogistics(startTimestamp, endTimestamp);
        } else {
            throw new RuntimeException("不支持的角色类型: " + role);
        }

        log.info("当前用户: {}, 角色: {}, 使用字段: {}, 时间范围: {} - {}",
                username, role, field, startTimestamp, endTimestamp);

        return cusLogisticsMapper.selectAllLogistics(field, username, startTimestamp, endTimestamp);
    }

    public CusLogistics queryLogistics(String waybillNumber, String customerOrderNumber, String fwTrackingNumber) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        List<UmsRole> userRoles = umsAdminService.getCurrentUserRole();
        String role = userRoles.get(0).getName();

        String field;
        if ("清关代理公司".equals(role)) {
            field = "cc_companyno";
        } else if ("物流代理公司".equals(role)) {
            field = "fw_logistics_no";
        } else if ("发货代理公司".equals(role)) {
            field = "acceptance_channel_no";
        } else {
            throw new RuntimeException("不支持的角色类型: " + role);
        }

        return cusLogisticsMapper.querySingleLogistics(field, username, waybillNumber, customerOrderNumber, fwTrackingNumber);
    }

    /**
     * 将 CusLogistics 实体转换为 DTO
     * @param logistics 物流记录实体
     * @return 物流记录 DTO
     */
    private CusLogisticsBaseDTO convertToDto(CusLogistics logistics) {
        CusLogisticsBaseDTO dto = new CusLogisticsBaseDTO();
        BeanUtils.copyProperties(logistics, dto); // 使用 BeanUtils 进行属性拷贝
        return dto;
    }

    /**
     * 根据运单号、客户订单号和 FW 追踪号删除物流记录
     * @param waybillNumber 运单号
     * @param customerOrderNumber 客户订单号
     * @param fwTrackingNumber FW 追踪号
     * @return 删除的记录数
     */
    public int deleteLogistics(String waybillNumber, String customerOrderNumber, String fwTrackingNumber) {
        return cusLogisticsMapper.deleteByWaybillAndCustomerOrder(waybillNumber, customerOrderNumber, fwTrackingNumber);
    }

    public boolean updateLogisticsNote(String waybillNumber, String customerOrderNumber, String fwTrackingNumber, String note) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Timestamp trackUpdateTime = getCurrentTimestamp();  // 在 service 层获取时间
        // 获取 logistics_id
        Long logisticsId = cusLogisticsMapper.getLogisticsId(waybillNumber, customerOrderNumber, fwTrackingNumber);
        if (logisticsId != null) {
            // 保存历史轨迹
            cusLogisticsMapper.insertLogisticsHistory(logisticsId, note, trackUpdateTime, username);
        }

        // 更新当前轨迹
        int rowsAffected = cusLogisticsMapper.updateNoteByKeys(waybillNumber, customerOrderNumber, fwTrackingNumber, note, trackUpdateTime);
        return rowsAffected > 0;
    }

    /**
     * 保存或更新物流记录
     * @param logistics 物流记录
     */
    public void saveOrUpdateLogistics(CusLogistics logistics) {
        CusLogistics existingLogistics = cusLogisticsMapper.selectByWaybillAndCustomerOrder(
                logistics.getWaybillNumber(), logistics.getCustomerOrderNumber(), logistics.getFwTrackingNumber());

        Timestamp currentTimestamp = getCurrentTimestamp(); // 获取当前时间戳
        String username = SecurityContextHolder.getContext().getAuthentication().getName();

        if (existingLogistics != null) {
            log.info("logistics to update: {}", logistics);
            log.info("existingLogistics before update: {}", existingLogistics);

            // 如果存在，执行更新，确保只更新不为 null 的字段
            existingLogistics.setTrackUpdateTime(currentTimestamp); // 无论如何更新 trackUpdateTime 为当前时间

            // 使用反射更新其它字段
            updateNonNullFields(existingLogistics, logistics);

            existingLogistics.setAcceptanceChannelNo(username);

            log.info("existingLogistics after update: {}", existingLogistics); // 打印更新后的状态

            cusLogisticsMapper.updateByWaybillAndCustomerOrder(existingLogistics);
        } else {
            log.info("username:{}", username);
            // 如果不存在，执行插入
            logistics.setCreateTime(currentTimestamp); // 设置 create_time 和 track_update_time 为当前时间
            logistics.setTrackUpdateTime(currentTimestamp);
            logistics.setAcceptanceChannelNo(username);
            cusLogisticsMapper.insertLogistics(logistics);
        }
    }

    public List<String> uploadFileAndUpdate(MultipartFile file, List<Integer> ids, String containerNumber,
                                            String dbField, String subDir) {
        List<String> results = new ArrayList<>();

        if (file.isEmpty()) {
            results.add("文件为空，上传失败");
            return results;
        }

        try {
            String uploadDir = "/home/ecs-user/server/download/" + subDir;
            String baseUrl = "http://47.91.89.160:8080/cus/download/" + subDir;

            File directory = new File(uploadDir);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // 文件名由 containerNumber 决定
            String fileName = containerNumber + "_" + System.currentTimeMillis() + ".xls";
            File destinationFile = new File(uploadDir + fileName);
            file.transferTo(destinationFile);
            String fileUrl = baseUrl + fileName;

            log.info("文件保存至：{}，URL：{}", destinationFile.getAbsolutePath(), fileUrl);

            for (Integer id : ids) {
                CusLogistics logistics = cusLogisticsMapper.findById(id);
                if (logistics != null) {
                    if ("customs_clearance_result".equals(dbField)) {
                        cusLogisticsMapper.updateCustomsClearanceResult(id, fileUrl);
                    } else if ("customs_clearance_materials".equals(dbField)) {
                        cusLogisticsMapper.updateCustomsClearanceMaterials(id, fileUrl);
                    }
                    results.add("ID " + id + " 更新成功");
                } else {
                    results.add("ID " + id + " 未找到对应物流记录");
                }
            }
        } catch (IOException e) {
            log.error("文件上传异常：{}", e.getMessage());
            results.add("文件上传失败：" + e.getMessage());
        }

        return results;
    }


    public List<CusLogisticsHistory> getLogisticsHistoryByLogisticsId(Long logisticsId) {
        return cusLogisticsMapper.getLogisticsHistoryByLogisticsId(logisticsId);
    }

    /**
     * 获取当前时间戳
     * @return 当前时间戳
     */
    private Timestamp getCurrentTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }



    // 使用反射更新非 null 字段
    private void updateNonNullFields(CusLogistics existingLogistics, CusLogistics logistics) {
        Field[] fields = CusLogistics.class.getDeclaredFields(); // 获取所有字段

        for (Field field : fields) {
            field.setAccessible(true); // 设置字段可访问

            try {
                Object newValue = field.get(logistics); // 获取 logistics 中的字段值

                // 只有在 logistics 中该字段不为 null 时才更新
                if (newValue != null) {
                    Object oldValue = field.get(existingLogistics); // 获取更新前的值

                    if (oldValue == null || !oldValue.equals(newValue)) {
                        // 记录更新的字段和值
                        log.info("Updating field: {}. Old value: {}, New value: {}", field.getName(), oldValue, newValue);
                    }

                    field.set(existingLogistics, newValue); // 更新字段值
                }
            } catch (IllegalAccessException e) {
                log.error("Error accessing field: {}", field.getName(), e);
            }
        }
    }
}
