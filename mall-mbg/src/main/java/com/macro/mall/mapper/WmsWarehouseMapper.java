package com.macro.mall.mapper;

import com.macro.mall.model.WmsWarehouse;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import java.util.Optional;

public interface WmsWarehouseMapper {

    /**
     * 获取所有仓库的详细信息
     */
    List<WmsWarehouse> getAllWarehouses();

    /**
     * 根据仓库 ID 获取指定仓库的详细信息
     */
    List<WmsWarehouse> getWarehousesByIds(@Param("warehouseIds") List<Long> warehouseIds);

    // 你可以根据需求添加更多的方法，例如：
    // 插入、更新、删除仓库
    int insert(WmsWarehouse warehouse);

    int update(WmsWarehouse warehouse);

    int delete(Long warehouseId);
}
