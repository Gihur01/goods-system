package com.macro.mall.controller;

import com.macro.mall.model.CusLogistics;
import com.macro.mall.service.CusLogisticsService;
import io.swagger.annotations.Api;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

@Controller
@Api(tags = "CusUserController")
@Tag(name = "CusUserController", description = "清关管理")
@RequestMapping("/cus")
public class CusUserController {
    @Autowired
    private CusLogisticsService cusLogisticsService;

    private static final String EXCEL_FILE_NAME = "logistics.xlsx";
    private static final Logger logger = LoggerFactory.getLogger(CusUserController.class);

    /**
     * 导出物流信息为 Excel 文件
     */
    @PostMapping("/exportExcel")
    public void exportExcel(HttpServletResponse response) {
        try {
            // 设置响应头，防止乱码
            String encodedFileName = URLEncoder.encode(EXCEL_FILE_NAME, "UTF-8").replaceAll("\\+", "%20");

            // 设置文件类型为 Excel 并指定下载文件名
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");

            // 调用服务层，生成并返回 Excel 文件
            cusLogisticsService.exportToExcel(response);
        } catch (IOException e) {
            logger.error("导出 Excel 文件失败", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            try {
                response.getWriter().write("导出 Excel 文件失败: " + e.getMessage());
            } catch (IOException ex) {
                logger.error("写入响应失败", ex);
            }
        }
    }

    /**
     * 删除物流记录，支持删除多条数据
     */
    @PostMapping("/deleteLogistics")
    public ResponseEntity<String> deleteLogistics(@RequestBody List<Map<String, String>> logisticsList) {
        try {
            int totalDeleted = 0;

            for (Map<String, String> logistics : logisticsList) {
                String waybillNumber = logistics.get("waybillNumber");
                String customerOrderNumber = logistics.get("customerOrderNumber");
                String fwTrackingNumber = logistics.get("fwTrackingNumber");

                int deletedRecords = cusLogisticsService.deleteLogistics(waybillNumber, customerOrderNumber, fwTrackingNumber);
                totalDeleted += deletedRecords;
            }

            if (totalDeleted > 0) {
                return ResponseEntity.ok(totalDeleted + " 条物流记录已删除");
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("未找到匹配的物流记录，删除失败");
            }
        } catch (Exception e) {
            logger.error("删除物流记录失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("删除失败: " + e.getMessage());
        }
    }

    /**
     * 保存或更新物流记录
     */
    @PostMapping("/saveOrUpdate")
    public ResponseEntity<String> saveOrUpdateLogistics(@RequestBody CusLogistics logistics) {
        try {
            cusLogisticsService.saveOrUpdate(logistics);
            return ResponseEntity.ok("操作成功");
        } catch (Exception e) {
            logger.error("保存或更新物流记录失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("操作失败: " + e.getMessage());
        }
    }
}
