package com.macro.mall.demo.service.impl;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.macro.mall.demo.mapper.TransLogMapper;
import com.macro.mall.demo.model.TransLog;
import com.macro.mall.demo.service.TransLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Service
public class TransLogServiceImpl implements TransLogService {
    private static final Logger log = LoggerFactory.getLogger(OrderServiceImpl.class);

    @Autowired
    private TransLogMapper transLogMapper;

    public String extractStatusCode(String response) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(response);
            return jsonNode.has("statusCode") ? jsonNode.get("statusCode").asText() : "unknown";
        } catch (Exception e) {
            log.error("解析 response 失败: {}", e.getMessage());
            return "error";
        }
    }

    public void saveToFile(String apiName, Object originalRequest, Object modifiedRequest, String response) {
        try {
            // 生成带时间戳的文件名
            String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
            String fileName = "Logs/" + apiName + "_" + timestamp + ".log";

            // 确保 logs 目录存在
            File logDir = new File("Logs");
            if (!logDir.exists()) {
                logDir.mkdirs();
            }

            // 使用 ObjectMapper 将请求对象转换为 JSON 字符串
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.enable(SerializationFeature.INDENT_OUTPUT); // 美化 JSON 输出

            String originalRequestJson = objectMapper.writeValueAsString(originalRequest);
            String modifiedRequestJson = objectMapper.writeValueAsString(modifiedRequest);

            // 打开文件流，并指定 UTF-8
            try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(fileName), StandardCharsets.UTF_8))) {
                writer.write("API Name: " + apiName + "\n");
                writer.write("Timestamp: " + timestamp + "\n\n");

                writer.write("=== Original Request ===\n");
                writer.write(originalRequestJson + "\n\n"); // 记录修改前的请求

                writer.write("=== Modified Request ===\n");
                writer.write(modifiedRequestJson + "\n\n"); // 记录修改后的请求

                writer.write("=== Response ===\n");
                writer.write(response + "\n"); // 记录响应内容
            }

            log.info("请求（修改前 & 修改后）和响应已保存到本地文件: {}", fileName);
        } catch (IOException e) {
            log.error("保存请求和响应失败: {}", e.getMessage(), e);
        }
    }

    public void logRequest(String clientId, String api, String responseMessage, String requestStatus) {
        TransLog log = new TransLog();
        log.setRequestUser(clientId);
        log.setRequestApi(api);
        log.setRequestStatus(requestStatus);
        log.setResponseMessage(responseMessage);
        transLogMapper.insert(log);
    }
}
