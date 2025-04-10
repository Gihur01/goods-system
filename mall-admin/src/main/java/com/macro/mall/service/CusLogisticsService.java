package com.macro.mall.service;
import com.macro.mall.dto.CusQueryParam;
import com.macro.mall.model.CusBaseLogistics;
import com.macro.mall.model.CusLogistics;
import com.macro.mall.model.CusLogisticsHistory;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface CusLogisticsService {
    
    void saveOrUpdateLogistics(CusLogistics logistics);

    boolean updateLogisticsNote(String waybillNumber, String customerOrderNumber, String fwTrackingNumber, String note);

    CusLogistics queryLogistics(String waybillNumber, String customerOrderNumber, String fwTrackingNumber);

    List<CusLogisticsHistory> getLogisticsHistoryByLogisticsId(Long logisticsId);

    List<CusBaseLogistics> getAllLogistics(CusQueryParam queryParam);

    List<String> uploadFileAndUpdate(MultipartFile file, List<Integer> ids, String containerNumber, String dbField, String subDir);

    int updateStatusByIds(List<Integer> ids, String targetStatus);

    int deleteLogisticsByIds(List<Integer> ids);
}
