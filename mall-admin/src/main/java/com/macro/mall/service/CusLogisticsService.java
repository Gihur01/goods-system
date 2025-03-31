package com.macro.mall.service;
import com.macro.mall.model.CusBaseLogistics;
import com.macro.mall.model.CusLogistics;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

public interface CusLogisticsService {
    List<CusBaseLogistics> getAllLogistics();

    int deleteLogistics(String waybillNumber, String customerOrderNumber, String fwTrackingNumber);

    void saveOrUpdateLogistics(CusLogistics logistics);

    CusLogistics findByContainerNumber(String containerNumber);

    void updateCustomsClearanceMaterials(String containerNumber, String filePath);
}
