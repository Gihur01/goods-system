package com.macro.mall.service;

import com.macro.mall.model.WmsWarehouse;

import java.util.List;
import java.util.Optional;

public interface WmsWarehouseService {

    /**
     * 获取所有仓库的详细信息
     */
    List<WmsWarehouse> getAllWarehouses();

    /**
     * 根据仓库ID获取指定仓库的详细信息
     */
    Optional<List<WmsWarehouse>> getWarehousesByIds(List<Long> warehouseIds);
}
