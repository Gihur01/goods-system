package com.macro.mall.controller;

import com.macro.mall.common.api.CommonResult;
import com.macro.mall.model.WmsWarehouse;
import com.macro.mall.service.WmsWarehouseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@Api(tags = "WmsWarehouseController")
@Tag(name = "WmsWarehouseController", description = "后台仓库管理")
@RequestMapping("/warehouses")
public class WmsWarehouseController {

    @Autowired
    private WmsWarehouseService wmsWarehouseService;

    /**
     * 获取所有仓库的详细信息
     */
    @ApiOperation(value = "获取所有仓库的详细信息")
    @GetMapping("/AllList")
    public CommonResult<List<WmsWarehouse>> getAllWarehouses() {
        List<WmsWarehouse> warehouses = wmsWarehouseService.getAllWarehouses();
        return CommonResult.success(warehouses);
    }

    /**
     * 根据仓库ID获取仓库的详细信息
     */
    @ApiOperation(value = "根据仓库ID获取仓库的详细信息")
    @GetMapping("/List")
    public CommonResult<List<WmsWarehouse>> getWarehousesByIds(@RequestParam List<Long> warehouseIds) {
        Optional<List<WmsWarehouse>> warehouses = wmsWarehouseService.getWarehousesByIds(warehouseIds);
        if (warehouses.isPresent() && !warehouses.get().isEmpty()) {
            return CommonResult.success(warehouses.get());
        }
        return CommonResult.failed("未找到任何仓库");
    }
}
