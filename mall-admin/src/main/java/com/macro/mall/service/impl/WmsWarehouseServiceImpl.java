package com.macro.mall.service.impl;

import com.macro.mall.mapper.WmsWarehouseMapper;
import com.macro.mall.model.WmsWarehouse;
import com.macro.mall.service.WmsWarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class WmsWarehouseServiceImpl implements WmsWarehouseService {
    @Autowired
    private WmsWarehouseMapper WarehouseMapper;

    /**
     * 获取所有仓库的详细信息
     */
    @Override
    public List<WmsWarehouse> getAllWarehouses() {
        // 使用仓库 Repository 查询所有仓库信息
        return WarehouseMapper.getAllWarehouses();
    }

    /**
     * 根据仓库ID获取指定仓库的详细信息
     */
    @Override
    public Optional<WmsWarehouse> getWarehouseById(Long warehouseId) {
        // 使用仓库 Repository 根据 ID 查询仓库
        return WarehouseMapper.getWarehouseById(warehouseId);
    }
}
