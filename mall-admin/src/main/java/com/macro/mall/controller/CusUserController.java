package com.macro.mall.controller;

import com.macro.mall.model.CusLogistics;
import com.macro.mall.service.CusLogisticsService;
import io.swagger.annotations.Api;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * 清关管理Controller
 */
@Controller
@Api(tags = "CusUserController")
@Tag(name = "CusUserController", description = "清关管理")
@RequestMapping("/cus")
public class CusUserController {
    @Autowired
    private CusLogisticsService cusLogisticsService;

    @GetMapping("/exportExcel")
    public void exportExcel(HttpServletResponse response) throws IOException {
        // 设置响应头，防止乱码
        String fileName = "logistics.xlsx";
        String encodedFileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");

        // 设置文件类型为 Excel 并指定下载文件名
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");

        // 调用服务层，生成并返回 Excel 文件
        cusLogisticsService.exportToExcel(response);
    }

    /**
     * 删除物流记录，支持删除多条数据
     * @param waybillNumber 运单号
     * @param customerOrderNumber 客户订单号
     * @param fwTrackingNumber FW 追踪号
     * @return 删除结果
     */
    @DeleteMapping("/deleteLogistics")
    public String deleteLogistics(@RequestParam String waybillNumber,
                                  @RequestParam String customerOrderNumber,
                                  @RequestParam String fwTrackingNumber) {

        int deletedRecords = cusLogisticsService.deleteLogistics(waybillNumber, customerOrderNumber, fwTrackingNumber);

        if (deletedRecords > 0) {
            return deletedRecords + " 条物流记录已删除";
        } else {
            return "未找到匹配的物流记录，删除失败";
        }
    }

    @PostMapping("/saveOrUpdate")
    public ResponseEntity<String> saveOrUpdateLogistics(@RequestBody CusLogistics logistics) {
        cusLogisticsService.saveOrUpdate(logistics);
        return ResponseEntity.ok("Operation successful");
    }
}
