package com.macro.mall.service;
import com.macro.mall.model.CusLogistics;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface CusLogisticsService {
    void exportToExcel(HttpServletResponse response) throws IOException;

    int deleteLogistics(String waybillNumber, String customerOrderNumber, String fwTrackingNumber);

    void saveOrUpdate(CusLogistics logistics);
}
