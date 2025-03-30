package com.macro.mall.service.impl;

import com.alibaba.excel.EasyExcel;
import com.macro.mall.dto.CusLogisticsBaseDTO;
import com.macro.mall.mapper.CusLogisticsMapper;
import com.macro.mall.model.CusLogistics;
import com.macro.mall.service.CusLogisticsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CusLogisticsServiceImpl implements CusLogisticsService {
    @Autowired
    private CusLogisticsMapper cusLogisticsMapper;

    @Override
    public void exportToExcel(HttpServletResponse response) throws IOException {
        Logger logger = LoggerFactory.getLogger(this.getClass());

        // 查询数据库中的物流数据
        logger.info("Fetching logistics data from the database...");
        List<CusLogistics> logisticsList = cusLogisticsMapper.selectAll();

        if (logisticsList == null || logisticsList.isEmpty()) {
            logger.warn("No logistics data found to export.");
        } else {
            logger.info("Fetched {} records from the database.", logisticsList.size());
        }

        // 转换数据到 Excel DTO
        logger.info("Converting logistics data to Excel DTO...");
        List<CusLogisticsBaseDTO> excelData = logisticsList.stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());

        // 输出转换后的数据日志
        logger.debug("Converted data to Excel DTO: {}", excelData);

        // 使用 EasyExcel 导出
        logger.info("Writing Excel data to response output stream...");
        EasyExcel.write(response.getOutputStream(), CusLogisticsBaseDTO.class)
                .sheet("Logistics Data")
                .doWrite(excelData);

        logger.info("Excel file exported successfully.");
    }

    // 提取转换逻辑，避免 BeanUtils.copyProperties 每次重复调用
    private CusLogisticsBaseDTO convertToDTO(CusLogistics logistics) {
        CusLogisticsBaseDTO dto = new CusLogisticsBaseDTO();

        // 属性拷贝 (如果需要映射的字段名一致)
        dto.setId(logistics.getId());
        dto.setReceiveDate(logistics.getReceiveDate());
        dto.setReceiveTime(logistics.getReceiveTime());
        dto.setWaybillNumber(logistics.getWaybillNumber());
        dto.setCustomerOrderNumber(logistics.getCustomerOrderNumber());
        dto.setFwTrackingNumber(logistics.getFwTrackingNumber());
        dto.setContainerNumber(logistics.getContainerNumber());
        dto.setStatus(logistics.getStatus());
        dto.setLogisticsChannel(logistics.getLogisticsChannel());
        dto.setLoadingPort(logistics.getLoadingPort());
        dto.setLoadingTime(logistics.getLoadingTime());
        dto.setArrivalPort(logistics.getArrivalPort());
        dto.setArrivalDate(logistics.getArrivalDate());

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

    public void saveOrUpdate(CusLogistics logistics) {
        // 查询是否存在记录
        CusLogistics existingLogistics = cusLogisticsMapper.selectByWaybillAndCustomerOrder(
                logistics.getWaybillNumber(), logistics.getCustomerOrderNumber(), logistics.getFwTrackingNumber());

        if (existingLogistics != null) {
            // 如果存在，执行更新
            // 设置 track_update_time 为当前时间
            logistics.setTrackUpdateTime(new Timestamp(System.currentTimeMillis()));
            cusLogisticsMapper.updateByWaybillAndCustomerOrder(logistics);
        } else {
            // 如果不存在，执行插入
            // 设置 create_time 和 track_update_time 为当前时间
            logistics.setCreateTime(new Timestamp(System.currentTimeMillis()));
            logistics.setTrackUpdateTime(new Timestamp(System.currentTimeMillis()));
            cusLogisticsMapper.insertLogistics(logistics);
        }
    }

}
