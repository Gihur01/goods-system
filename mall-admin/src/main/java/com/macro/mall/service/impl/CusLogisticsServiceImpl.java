package com.macro.mall.service.impl;

import com.alibaba.excel.EasyExcel;
import com.macro.mall.dto.CusLogisticsBaseDTO;
import com.macro.mall.mapper.CusLogisticsMapper;
import com.macro.mall.model.CusBaseLogistics;
import com.macro.mall.model.CusLogistics;
import com.macro.mall.service.CusLogisticsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Service
public class CusLogisticsServiceImpl implements CusLogisticsService {
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
            // 如果存在，执行更新
            logistics.setTrackUpdateTime(currentTimestamp); // 设置 track_update_time 为当前时间
            cusLogisticsMapper.updateByWaybillAndCustomerOrder(logistics);
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

}
