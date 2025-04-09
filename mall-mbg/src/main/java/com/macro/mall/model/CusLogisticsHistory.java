package com.macro.mall.model;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class CusLogisticsHistory {
    private Integer id;
    private Integer logisticsId;
    private String note;
    private Timestamp trackUpdateTime;
    private String username;
}
