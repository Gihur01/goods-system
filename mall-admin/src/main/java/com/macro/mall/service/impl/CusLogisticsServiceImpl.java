package com.macro.mall.service.impl;

import com.alibaba.excel.EasyExcel;
import com.macro.mall.dto.CusLogisticsBaseDTO;
import com.macro.mall.mapper.CusLogisticsMapper;
import com.macro.mall.model.CusBaseLogistics;
import com.macro.mall.model.CusLogistics;
import com.macro.mall.service.CusLogisticsService;
import com.macro.mall.service.OmsOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.lang.reflect.Field;
import java.sql.Timestamp;
import java.util.List;

@Service
public class CusLogisticsServiceImpl implements CusLogisticsService {

    private static final Logger log = LoggerFactory.getLogger(OmsOrderService.class);
    @Autowired
    private CusLogisticsMapper cusLogisticsMapper;

    /**
     * 获取所有物流记录
     * @return 物流记录列表
     */
    @Override
    public List<CusBaseLogistics> getAllLogistics() {
        return cusLogisticsMapper.selectAllLogistics();
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

    /**
     * 保存或更新物流记录
     * @param logistics 物流记录
     */
    public void saveOrUpdateLogistics(CusLogistics logistics) {
        CusLogistics existingLogistics = cusLogisticsMapper.selectByWaybillAndCustomerOrder(
                logistics.getWaybillNumber(), logistics.getCustomerOrderNumber(), logistics.getFwTrackingNumber());

        Timestamp currentTimestamp = getCurrentTimestamp(); // 获取当前时间戳

        if (existingLogistics != null) {
            log.info("logistics to update: {}", logistics);
            log.info("existingLogistics before update: {}", existingLogistics);

            // 如果存在，执行更新，确保只更新不为 null 的字段
            existingLogistics.setTrackUpdateTime(currentTimestamp); // 无论如何更新 trackUpdateTime 为当前时间

            // 使用反射更新其它字段
            updateNonNullFields(existingLogistics, logistics);

            log.info("existingLogistics after update: {}", existingLogistics); // 打印更新后的状态

            cusLogisticsMapper.updateByWaybillAndCustomerOrder(existingLogistics);
        } else {
            // 如果不存在，执行插入
            logistics.setCreateTime(currentTimestamp); // 设置 create_time 和 track_update_time 为当前时间
            logistics.setTrackUpdateTime(currentTimestamp);
            cusLogisticsMapper.insertLogistics(logistics);
        }
    }

    /**
     * 获取当前时间戳
     * @return 当前时间戳
     */
    private Timestamp getCurrentTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }

    // 查找柜号对应的物流记录
    public CusLogistics findByContainerNumber(String containerNumber) {
        return cusLogisticsMapper.findByContainerNumber(containerNumber);
    }

    // 更新 customs_clearance_materials 字段
    public void updateCustomsClearanceMaterials(String containerNumber, String filePath) {
        cusLogisticsMapper.updateCustomsClearanceMaterials(containerNumber, filePath);
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
