package com.macro.mall.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.macro.mall.dto.CusQueryParam;
import com.macro.mall.dto.CusQueryRequestDTO;
import com.macro.mall.dto.CusUploadClearanceRequest;
import com.macro.mall.model.CusBaseLogistics;
import com.macro.mall.model.CusLogistics;
import com.macro.mall.model.CusLogisticsHistory;
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
import com.fasterxml.jackson.core.type.TypeReference;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;
import java.util.Map;

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
    public ResponseEntity<List<CusBaseLogistics>> fetchAllLogistics(@RequestBody CusQueryParam queryParam) {
        try {
            log.info("Fetching all logistics data with query: {}", queryParam);

            List<CusBaseLogistics> logisticsList = cusLogisticsService.getAllLogistics(queryParam);
            log.info("Fetched logistics data: {}", logisticsList);
            return ResponseEntity.ok(logisticsList);
        } catch (Exception e) {
            log.error("获取物流信息失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(Collections.emptyList());
        }
    }

    @PostMapping("/query")
    public ResponseEntity<CusLogistics> queryLogistics(@RequestBody CusQueryRequestDTO request) {
        try {
            log.info("Querying logistics with params: {}", request);
            CusLogistics result = cusLogisticsService.queryLogistics(
                    request.getWaybillNumber(),
                    request.getCustomerOrderNumber(),
                    request.getFwTrackingNumber());

            if (result == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }

            return ResponseEntity.ok(result);
        } catch (Exception e) {
            log.error("查询物流信息失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
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

    @PostMapping("/updateLogisticsNote")
    public ResponseEntity<String> updateLogisticsNote(@RequestBody Map<String, Object> requestData) {
        try {
            ObjectMapper mapper = new ObjectMapper();

            String note = (String) requestData.get("note");

            List<Map<String, String>> logisticsList = mapper.convertValue(
                    requestData.get("logisticsList"),
                    new TypeReference<List<Map<String, String>>>() {}
            );

            if (note == null || note.trim().isEmpty()) {
                return ResponseEntity.badRequest().body("note 不能为空");
            }

            if (logisticsList == null || logisticsList.isEmpty()) {
                return ResponseEntity.badRequest().body("logisticsList 不能为空");
            }

            int updatedCount = 0;
            for (Map<String, String> logistics : logisticsList) {
                boolean updated = cusLogisticsService.updateLogisticsNote(
                        logistics.get("waybillNumber"),
                        logistics.get("customerOrderNumber"),
                        logistics.get("fwTrackingNumber"),
                        note
                );
                if (updated) updatedCount++;
            }

            return updatedCount > 0
                    ? ResponseEntity.ok(updatedCount + " 条物流记录已更新")
                    : ResponseEntity.status(HttpStatus.NOT_FOUND).body("未找到匹配的物流记录，更新失败");

        } catch (Exception e) {
            log.error("更新物流记录失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("更新失败: " + e.getMessage());
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

    @PostMapping("/uploadClearanceResult")
    public ResponseEntity<?> uploadClearanceResult(@RequestParam("file") MultipartFile file,
                                                   @RequestParam("requestData") String requestDataJson) {
        // 反序列化 JSON 字符串为对象
        ObjectMapper objectMapper = new ObjectMapper();
        CusUploadClearanceRequest request;
        try {
            request = objectMapper.readValue(requestDataJson, CusUploadClearanceRequest.class);
        } catch (IOException e) {
            return ResponseEntity.badRequest().body("Invalid JSON format");
        }

        List<String> result = cusLogisticsService.uploadFileAndUpdate(
                file,
                request.getIds(),
                request.getContainerNumber(),
                "customs_clearance_result",
                "result/"
        );
        return ResponseEntity.ok(result);
    }

    @PostMapping("/uploadClearanceMaterials")
    public ResponseEntity<?> uploadClearanceMaterials(@RequestParam("file") MultipartFile file,
                                                      @RequestParam("requestData") String requestDataJson) {
        // 反序列化 JSON 字符串为对象
        ObjectMapper objectMapper = new ObjectMapper();
        CusUploadClearanceRequest request;
        try {
            request = objectMapper.readValue(requestDataJson, CusUploadClearanceRequest.class);
        } catch (IOException e) {
            return ResponseEntity.badRequest().body("Invalid JSON format");
        }

        List<String> result = cusLogisticsService.uploadFileAndUpdate(
                file,
                request.getIds(),
                request.getContainerNumber(),
                "customs_clearance_materials",
                "materials/"
        );
        return ResponseEntity.ok(result);
    }

    @GetMapping("/download/{folder}/{fileName}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String folder, @PathVariable String fileName) {
        try {
            // 拼接文件存储的根路径和动态文件夹
            Path folderPath = Paths.get("/home/ecs-user/server/download").resolve(folder).normalize();
            Path filePath = folderPath.resolve(fileName);

            // 创建资源对象
            Resource resource = new UrlResource(filePath.toUri());

            // 检查文件是否存在
            if (!resource.exists()) {
                return ResponseEntity.notFound().build();
            }

            // 根据文件扩展名动态设置 MIME 类型
            String contentType = Files.probeContentType(filePath);
            if (contentType == null) {
                contentType = MediaType.APPLICATION_OCTET_STREAM_VALUE; // 默认二进制流
            }

            // 设置 HTTP 响应头，支持文件下载
            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(contentType))
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
                    .body(resource);

        } catch (MalformedURLException e) {
            // 文件路径错误处理
            return ResponseEntity.badRequest().body(null);
        } catch (IOException e) {
            // 文件读取失败或 MIME 类型获取失败处理
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

    @GetMapping("/getLogisticsHistory")
    public ResponseEntity<?> getLogisticsHistory(@RequestParam Long logisticsId) {
        try {
            List<CusLogisticsHistory> historyList = cusLogisticsService.getLogisticsHistoryByLogisticsId(logisticsId);
            return ResponseEntity.ok(historyList);
        } catch (Exception e) {
            log.error("查询历史轨迹失败", e);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("查询失败: " + e.getMessage());
        }
    }
}