package com.macro.mall.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class CusUploadClearanceRequest {
    private MultipartFile file;  // 上传的文件
    private List<Integer> ids;  // 要上传的 IDs 列表
    private String containerNumber;  // containerNumber
}
