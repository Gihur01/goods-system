package com.macro.mall.demo.service;

public interface TransLogService {
    String extractStatusCode(String response);

    void saveToFile(String apiName, Object originalRequest, Object modifiedRequest, String response);

    void logRequest(String clientId, String api, String responseMessage, String requestStatus);
}
