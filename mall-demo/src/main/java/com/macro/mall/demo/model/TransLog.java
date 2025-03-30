package com.macro.mall.demo.model;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class TransLog {
    private Long id;
    private String requestUser;
    private String requestApi;
    private LocalDateTime requestTime;
    private String requestStatus;
    private String responseMessage;
}
