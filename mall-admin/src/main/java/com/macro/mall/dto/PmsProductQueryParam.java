package com.macro.mall.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 商品查询参数
 * Created by macro on 2018/4/27.
 */
@Data
@EqualsAndHashCode
public class PmsProductQueryParam {
    @ApiModelProperty("上架状态")
    private Integer publishStatus;
    @ApiModelProperty("审核状态")
    private Integer verifyStatus;
    @ApiModelProperty("商品名称模糊关键字")
    private String keyword;
    @ApiModelProperty("商品扫描码")
    private String productSn;
    @ApiModelProperty("商品货号")
    private String productCode;
    @ApiModelProperty("商品分类编号")
    private Long productCategoryId;
    @ApiModelProperty("商品品牌编号")
    private Long brandId;
    @ApiModelProperty("仓库")
    private String warehouseId;
    @ApiModelProperty("国家")
    private String location;
    @ApiModelProperty("新品")
    private Integer NewStatus;
    @ApiModelProperty("推荐")
    private Integer RecommandStatus;
    @ApiModelProperty("开始月份")
    @DateTimeFormat(pattern = "yyyy-MM")
    private Date StartMonth;  // 新增字段：上架时间
    @ApiModelProperty("结束月份")
    @DateTimeFormat(pattern = "yyyy-MM")
    private Date EndMonth;  // 新增字段：上架时间
}
