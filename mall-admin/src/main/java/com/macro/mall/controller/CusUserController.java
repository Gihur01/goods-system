package com.macro.mall.controller;

import com.macro.mall.model.CusBaseLogistics;
import com.macro.mall.model.CusLogistics;
import com.macro.mall.service.CusLogisticsService;
import io.swagger.annotations.Api;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Optional;

@RestController
@Api(tags = "CusUserController")
@Tag(name = "CusUserController", description = "清关管理")
@RequestMapping("/cus")
@RequiredArgsConstructor
public class CusUserController {
    private static final Logger log = LoggerFactory.getLogger(CusUserController.class);

    private final CusLogisticsService cusLogisticsService;

    // 定义上传目录（确保 Spring Boot 允许访问此目录）
    private static final String UPLOAD_DIR = "/home/ecs-user/server/download/";
    private static final String BASE_URL = "http://47.91.89.160:8080/cus/download/"; // 访问 URL 前缀



    /**
     * 获取所有物流信息（POST 请求）
     */
    @PostMapping("/fetchAll")
    public ResponseEntity<List<CusBaseLogistics>> fetchAllLogistics() {
        try {
            log.info("Fetching all logistics data...");  // 记录日志
            List<CusBaseLogistics> logisticsList = cusLogisticsService.getAllLogistics();
            log.info("Fetched logistics data: {}", logisticsList);  // 记录获取到的数据
            return ResponseEntity.ok(logisticsList);
        } catch (Exception e) {
            log.error("获取物流信息失败", e);  // 记录错误
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.emptyList());
        }
    }

    /**
     * 删除物流记录，支持批量删除（POST 请求）
     */
    @PostMapping("/removeLogistics")
    public ResponseEntity<String> removeLogistics(@RequestBody(required = false) List<Map<String, String>> logisticsList) {
        if (logisticsList == null || logisticsList.isEmpty()) {
            return ResponseEntity.badRequest().body("请求数据不能为空");
        }

        try {
            int totalDeleted = logisticsList.stream()
                    .mapToInt(logistics -> cusLogisticsService.deleteLogistics(
                            logistics.get("waybillNumber"),
                            logistics.get("customerOrderNumber"),
                            logistics.get("fwTrackingNumber")
                    )).sum();

            return totalDeleted > 0
                    ? ResponseEntity.ok(totalDeleted + " 条物流记录已删除")
                    : ResponseEntity.status(HttpStatus.NOT_FOUND).body("未找到匹配的物流记录，删除失败");
        } catch (Exception e) {
            log.error("删除物流记录失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("删除失败: " + e.getMessage());
        }
    }

    /**
     * 保存或更新物流记录（POST 请求）
     */
    @PostMapping("/saveOrUpdate")
    public ResponseEntity<String> saveOrUpdateLogistics(@RequestBody List<CusLogistics> logisticsList) {
        try {
            // 循环处理每个物流记录
            for (CusLogistics logistics : logisticsList) {
                cusLogisticsService.saveOrUpdateLogistics(logistics);
            }
            return ResponseEntity.ok("操作成功");
        } catch (Exception e) {
            log.error("保存或更新物流记录失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("操作失败: " + e.getMessage());
        }
    }

    @PostMapping("/uploadFile")
    public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file,
                                             @RequestParam("containerNumber") String containerNumber) {
        if (file.isEmpty()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("文件为空，上传失败");
        }

        try {
            // 确保目录存在
            File directory = new File(UPLOAD_DIR);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // 生成文件名
            String fileName = containerNumber + ".pdf";
            File destinationFile = new File(UPLOAD_DIR + fileName);

            // 保存文件
            file.transferTo(destinationFile);

            // 生成可访问的 URL
            String fileUrl = BASE_URL + fileName;

            // 查找柜号对应的物流记录
            CusLogistics logistics = cusLogisticsService.findByContainerNumber(containerNumber);
            if (logistics != null) {
                // 更新数据库中的文件 URL（不是本地路径）
                cusLogisticsService.updateCustomsClearanceMaterials(containerNumber, fileUrl);
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("未找到对应的柜号：" + containerNumber);
            }

            return ResponseEntity.ok("文件上传成功：" + fileUrl);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("文件上传失败：" + e.getMessage());
        }
    }

    @GetMapping("/download/{fileName}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName) {
        try {
            // 拼接文件路径
            Path filePath = Paths.get(UPLOAD_DIR).resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());

            // 检查文件是否存在
            if (!resource.exists()) {
                return ResponseEntity.notFound().build();
            }

            // 设置 HTTP 响应头，支持文件下载
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_PDF)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                    .body(resource);

        } catch (MalformedURLException e) {
            return ResponseEntity.badRequest().build();
        }
    }
}