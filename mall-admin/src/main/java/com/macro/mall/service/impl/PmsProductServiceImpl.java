package com.macro.mall.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.github.pagehelper.PageHelper;
import com.macro.mall.dao.*;
import com.macro.mall.dto.PmsProductParam;
import com.macro.mall.dto.PmsProductQueryParam;
import com.macro.mall.dto.PmsProductResult;
import com.macro.mall.mapper.*;
import com.macro.mall.model.*;
import com.macro.mall.service.PmsProductService;
import com.macro.mall.service.UmsAdminService;
import com.macro.mall.service.WmsWarehouseService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;


/**
 * 商品管理Service实现类
 * Created by macro on 2018/4/26.
 */
@Slf4j
@Service
public class PmsProductServiceImpl implements PmsProductService {
    private static final Logger LOGGER = LoggerFactory.getLogger(PmsProductServiceImpl.class);
    @Autowired
    private PmsProductMapper productMapper;
    @Autowired
    private PmsMemberPriceDao memberPriceDao;
    @Autowired
    private PmsMemberPriceMapper memberPriceMapper;
    @Autowired
    private PmsProductLadderDao productLadderDao;
    @Autowired
    private PmsProductLadderMapper productLadderMapper;
    @Autowired
    private PmsProductFullReductionDao productFullReductionDao;
    @Autowired
    private PmsProductFullReductionMapper productFullReductionMapper;
    @Autowired
    private PmsSkuStockDao skuStockDao;
    @Autowired
    private PmsSkuStockMapper skuStockMapper;
    @Autowired
    private PmsProductAttributeValueDao productAttributeValueDao;
    @Autowired
    private PmsProductAttributeValueMapper productAttributeValueMapper;
    @Autowired
    private CmsSubjectProductRelationDao subjectProductRelationDao;
    @Autowired
    private CmsSubjectProductRelationMapper subjectProductRelationMapper;
    @Autowired
    private CmsPrefrenceAreaProductRelationDao prefrenceAreaProductRelationDao;
    @Autowired
    private CmsPrefrenceAreaProductRelationMapper prefrenceAreaProductRelationMapper;
    @Autowired
    private PmsProductDao productDao;
    @Autowired
    private PmsProductVertifyRecordDao productVertifyRecordDao;
    @Autowired
    private PmsProductMapper pmsProductMapper;
    @Autowired
    private UmsAdminService umsAdminService;
    @Autowired
    private WmsWarehouseService wmsWarehouseService;

    @Override
    public int create(PmsProductParam productParam) {
        int count;
        //创建商品
        PmsProduct product = productParam;
        product.setId(null);
        productMapper.insertSelective(product);
        //根据促销类型设置价格：会员价格、阶梯价格、满减价格
        Long productId = product.getId();
        //会员价格
        relateAndInsertList(memberPriceDao, productParam.getMemberPriceList(), productId);
        //阶梯价格
        relateAndInsertList(productLadderDao, productParam.getProductLadderList(), productId);
        //满减价格
        relateAndInsertList(productFullReductionDao, productParam.getProductFullReductionList(), productId);
        //处理sku的编码
        handleSkuStockCode(productParam.getSkuStockList(),productId);
        //添加sku库存信息
        relateAndInsertList(skuStockDao, productParam.getSkuStockList(), productId);
        //添加商品参数,添加自定义商品规格
        relateAndInsertList(productAttributeValueDao, productParam.getProductAttributeValueList(), productId);
        //关联专题
        relateAndInsertList(subjectProductRelationDao, productParam.getSubjectProductRelationList(), productId);
        //关联优选
        relateAndInsertList(prefrenceAreaProductRelationDao, productParam.getPrefrenceAreaProductRelationList(), productId);
        count = 1;
        return count;
    }

    private void handleSkuStockCode(List<PmsSkuStock> skuStockList, Long productId) {
        if(CollectionUtils.isEmpty(skuStockList))return;
        for(int i=0;i<skuStockList.size();i++){
            PmsSkuStock skuStock = skuStockList.get(i);
            if(StrUtil.isEmpty(skuStock.getSkuCode())){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                StringBuilder sb = new StringBuilder();
                //日期
                sb.append(sdf.format(new Date()));
                //四位商品id
                sb.append(String.format("%04d", productId));
                //三位索引id
                sb.append(String.format("%03d", i+1));
                skuStock.setSkuCode(sb.toString());
            }
        }
    }

    @Override
    public PmsProductResult getUpdateInfo(Long id) {
        return productDao.getUpdateInfo(id);
    }

    @Override
    public int update(Long id, PmsProductParam productParam) {
        int count;
        //更新商品信息
        PmsProduct product = productParam;
        product.setId(id);
        productMapper.updateByPrimaryKeySelective(product);
        //会员价格
        PmsMemberPriceExample pmsMemberPriceExample = new PmsMemberPriceExample();
        pmsMemberPriceExample.createCriteria().andProductIdEqualTo(id);
        memberPriceMapper.deleteByExample(pmsMemberPriceExample);
        relateAndInsertList(memberPriceDao, productParam.getMemberPriceList(), id);
        //阶梯价格
        PmsProductLadderExample ladderExample = new PmsProductLadderExample();
        ladderExample.createCriteria().andProductIdEqualTo(id);
        productLadderMapper.deleteByExample(ladderExample);
        relateAndInsertList(productLadderDao, productParam.getProductLadderList(), id);
        //满减价格
        PmsProductFullReductionExample fullReductionExample = new PmsProductFullReductionExample();
        fullReductionExample.createCriteria().andProductIdEqualTo(id);
        productFullReductionMapper.deleteByExample(fullReductionExample);
        relateAndInsertList(productFullReductionDao, productParam.getProductFullReductionList(), id);
        //修改sku库存信息
        handleUpdateSkuStockList(id, productParam);
        //修改商品参数,添加自定义商品规格
        PmsProductAttributeValueExample productAttributeValueExample = new PmsProductAttributeValueExample();
        productAttributeValueExample.createCriteria().andProductIdEqualTo(id);
        productAttributeValueMapper.deleteByExample(productAttributeValueExample);
        relateAndInsertList(productAttributeValueDao, productParam.getProductAttributeValueList(), id);
        //关联专题
        CmsSubjectProductRelationExample subjectProductRelationExample = new CmsSubjectProductRelationExample();
        subjectProductRelationExample.createCriteria().andProductIdEqualTo(id);
        subjectProductRelationMapper.deleteByExample(subjectProductRelationExample);
        relateAndInsertList(subjectProductRelationDao, productParam.getSubjectProductRelationList(), id);
        //关联优选
        CmsPrefrenceAreaProductRelationExample prefrenceAreaExample = new CmsPrefrenceAreaProductRelationExample();
        prefrenceAreaExample.createCriteria().andProductIdEqualTo(id);
        prefrenceAreaProductRelationMapper.deleteByExample(prefrenceAreaExample);
        relateAndInsertList(prefrenceAreaProductRelationDao, productParam.getPrefrenceAreaProductRelationList(), id);
        count = 1;
        return count;
    }

    private void handleUpdateSkuStockList(Long id, PmsProductParam productParam) {
        //当前的sku信息
        List<PmsSkuStock> currSkuList = productParam.getSkuStockList();
        //当前没有sku直接删除
        if(CollUtil.isEmpty(currSkuList)){
            PmsSkuStockExample skuStockExample = new PmsSkuStockExample();
            skuStockExample.createCriteria().andProductIdEqualTo(id);
            skuStockMapper.deleteByExample(skuStockExample);
            return;
        }
        //获取初始sku信息
        PmsSkuStockExample skuStockExample = new PmsSkuStockExample();
        skuStockExample.createCriteria().andProductIdEqualTo(id);
        List<PmsSkuStock> oriStuList = skuStockMapper.selectByExample(skuStockExample);
        //获取新增sku信息
        List<PmsSkuStock> insertSkuList = currSkuList.stream().filter(item->item.getId()==null).collect(Collectors.toList());
        //获取需要更新的sku信息
        List<PmsSkuStock> updateSkuList = currSkuList.stream().filter(item->item.getId()!=null).collect(Collectors.toList());
        List<Long> updateSkuIds = updateSkuList.stream().map(PmsSkuStock::getId).collect(Collectors.toList());
        //获取需要删除的sku信息
        List<PmsSkuStock> removeSkuList = oriStuList.stream().filter(item-> !updateSkuIds.contains(item.getId())).collect(Collectors.toList());
        handleSkuStockCode(insertSkuList,id);
        handleSkuStockCode(updateSkuList,id);
        //新增sku
        if(CollUtil.isNotEmpty(insertSkuList)){
            relateAndInsertList(skuStockDao, insertSkuList, id);
        }
        //删除sku
        if(CollUtil.isNotEmpty(removeSkuList)){
            List<Long> removeSkuIds = removeSkuList.stream().map(PmsSkuStock::getId).collect(Collectors.toList());
            PmsSkuStockExample removeExample = new PmsSkuStockExample();
            removeExample.createCriteria().andIdIn(removeSkuIds);
            skuStockMapper.deleteByExample(removeExample);
        }
        //修改sku
        if(CollUtil.isNotEmpty(updateSkuList)){
            for (PmsSkuStock pmsSkuStock : updateSkuList) {
                skuStockMapper.updateByPrimaryKeySelective(pmsSkuStock);
            }
        }

    }

//    @Override
//    public List<PmsProduct> list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum) {
//        // 启动分页插件
//        PageHelper.startPage(pageNum, pageSize);
//
//        // 创建查询条件
//        PmsProductExample productExample = new PmsProductExample();
//        PmsProductExample.Criteria criteria = productExample.createCriteria();
//
//        // 默认条件：查询没有删除的商品
//        criteria.andDeleteStatusEqualTo(0);
//
//        // 根据传入的商品发布状态进行过滤
//        if (productQueryParam.getPublishStatus() != null) {
//            criteria.andPublishStatusEqualTo(productQueryParam.getPublishStatus());
//        }
//
//        // 根据商品审核状态进行过滤
//        if (productQueryParam.getVerifyStatus() != null) {
//            criteria.andVerifyStatusEqualTo(productQueryParam.getVerifyStatus());
//        }
//
//        // 如果传入了关键词，进行商品名称模糊查询
//        if (!StrUtil.isEmpty(productQueryParam.getKeyword())) {
//            criteria.andNameLike("%" + productQueryParam.getKeyword() + "%");
//        }
//
//        // 根据商品货号进行精确查询
//        if (!StrUtil.isEmpty(productQueryParam.getProductSn())) {
//            criteria.andProductSnEqualTo(productQueryParam.getProductSn());
//        }
//
//        // 根据品牌ID进行过滤
//        if (productQueryParam.getBrandId() != null) {
//            criteria.andBrandIdEqualTo(productQueryParam.getBrandId());
//        }
//
//        // 根据商品类别ID进行过滤
//        if (productQueryParam.getProductCategoryId() != null) {
//            criteria.andProductCategoryIdEqualTo(productQueryParam.getProductCategoryId());
//        }
//
//        // 根据仓库进行过滤，如果传递了仓库字段
//        if (!StrUtil.isEmpty(productQueryParam.getWarehouseId())) {
//            criteria.andWarehouseEqualTo(productQueryParam.getWarehouseId());
//        }
//
//        // 根据上架时间进行过滤，如果传递了上架时间（只传递了年月）
//        if (productQueryParam.getStartMonth() != null && productQueryParam.getEndMonth() != null) {
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
//
//            // 解析开始月份
//            Calendar startCalendar = Calendar.getInstance();
//            startCalendar.setTime(productQueryParam.getStartMonth());
//            int startYear = startCalendar.get(Calendar.YEAR);
//            int startMonth = startCalendar.get(Calendar.MONTH)+1; // 注意：这里是0-11，1月是0，2月是1
//
//            // 获取开始月份的第一天（00:00:00）
//            startCalendar.set(startYear, startMonth, 1, 0, 0, 0); // 这里使用原始月份
//            Date startDate = startCalendar.getTime();
//
//            // 解析结束月份
//            Calendar endCalendar = Calendar.getInstance();
//            endCalendar.setTime(productQueryParam.getEndMonth());
//            int endYear = endCalendar.get(Calendar.YEAR);
//            int endMonth = endCalendar.get(Calendar.MONTH)+1; // 同样是0-11
//
//            // 获取结束月份的最后一天（23:59:59）
//            endCalendar.set(endYear, endMonth, endCalendar.getActualMaximum(Calendar.DAY_OF_MONTH), 23, 59, 59);
//            Date endDate = endCalendar.getTime();
//
//            System.out.println("Start Date: " + startDate);
//            System.out.println("End Date: " + endDate);
//
//            // 使用日期范围进行查询，查询在开始日期和结束日期之间的记录
//            criteria.andShelfTimeBetween(startDate, endDate);
//        }
//
//        // 执行查询并返回结果
//        return productMapper.selectByExample(productExample);
//    }

    public List<PmsProduct> list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum) {
        // 2️⃣ 获取该用户有权限的仓库 ID 列表
        List<Long> warehouseIds = umsAdminService.getWarehousesByAdminId();
        log.info("当前用户拥有的仓库 ID 列表: {}", warehouseIds);

        // 3️⃣ 如果用户没有任何仓库权限，则跳过仓库权限过滤
        boolean hasWarehousePermission = (warehouseIds != null && !warehouseIds.isEmpty());
        if (!hasWarehousePermission) {
            log.info("用户没有仓库权限，将跳过仓库权限过滤");
        }

        // 4️⃣ 启动分页插件
        PageHelper.startPage(pageNum, pageSize);

        // 5️⃣ 创建查询条件
        PmsProductExample productExample = new PmsProductExample();
        PmsProductExample.Criteria criteria = productExample.createCriteria();

        // 默认条件：查询没有删除的商品
        criteria.andDeleteStatusEqualTo(0);

        // 根据传入的商品发布状态进行过滤
        if (productQueryParam.getPublishStatus() != null) {
            criteria.andPublishStatusEqualTo(productQueryParam.getPublishStatus());
        }

        // 根据商品审核状态进行过滤
        if (productQueryParam.getVerifyStatus() != null) {
            criteria.andVerifyStatusEqualTo(productQueryParam.getVerifyStatus());
        }

        // 如果传入了关键词，进行商品名称模糊查询
        if (!StrUtil.isEmpty(productQueryParam.getKeyword())) {
            criteria.andNameLike("%" + productQueryParam.getKeyword() + "%");
        }

        // 根据商品货号进行精确查询
        if (!StrUtil.isEmpty(productQueryParam.getProductSn())) {
            criteria.andProductSnEqualTo(productQueryParam.getProductSn());
        }

        // 根据品牌ID进行过滤
        if (productQueryParam.getBrandId() != null) {
            criteria.andBrandIdEqualTo(productQueryParam.getBrandId());
        }

        // 根据商品类别ID进行过滤
        if (productQueryParam.getProductCategoryId() != null) {
            criteria.andProductCategoryIdEqualTo(productQueryParam.getProductCategoryId());
        }

        // 6️⃣ 如果用户有仓库权限，则根据仓库权限进行过滤
        if (hasWarehousePermission) {
            criteria.andWarehouseIdIn(warehouseIds); // **🔴 关键改动，确保用户只能看有权限的仓库商品**
        }

        // 根据上架时间进行过滤
        if (productQueryParam.getStartMonth() != null && productQueryParam.getEndMonth() != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

            // 解析开始月份
            Calendar startCalendar = Calendar.getInstance();
            startCalendar.setTime(productQueryParam.getStartMonth());
            int startYear = startCalendar.get(Calendar.YEAR);
            int startMonth = startCalendar.get(Calendar.MONTH) + 1;

            // 获取开始月份的第一天（00:00:00）
            startCalendar.set(startYear, startMonth, 1, 0, 0, 0);
            Date startDate = startCalendar.getTime();

            // 解析结束月份
            Calendar endCalendar = Calendar.getInstance();
            endCalendar.setTime(productQueryParam.getEndMonth());
            int endYear = endCalendar.get(Calendar.YEAR);
            int endMonth = endCalendar.get(Calendar.MONTH) + 1;

            // 获取结束月份的最后一天（23:59:59）
            endCalendar.set(endYear, endMonth, endCalendar.getActualMaximum(Calendar.DAY_OF_MONTH), 23, 59, 59);
            Date endDate = endCalendar.getTime();

            log.info("筛选上架时间范围: {} - {}", startDate, endDate);

            criteria.andShelfTimeBetween(startDate, endDate);
        }

        // 7️⃣ 执行查询
        List<PmsProduct> productList = productMapper.selectByExample(productExample);
        log.info("查询到符合条件的商品数量: {}", productList.size());

        return productList;
    }


    @Override
    public int updateVerifyStatus(List<Long> ids, Integer verifyStatus, String detail) {
        PmsProduct product = new PmsProduct();
        product.setVerifyStatus(verifyStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        List<PmsProductVertifyRecord> list = new ArrayList<>();
        int count = productMapper.updateByExampleSelective(product, example);
        //修改完审核状态后插入审核记录
        for (Long id : ids) {
            PmsProductVertifyRecord record = new PmsProductVertifyRecord();
            record.setProductId(id);
            record.setCreateTime(new Date());
            record.setDetail(detail);
            record.setStatus(verifyStatus);
            record.setVertifyMan("test");
            list.add(record);
        }
        productVertifyRecordDao.insertList(list);
        return count;
    }

    @Override
    public int updatePublishStatus(List<Long> ids, Integer publishStatus) {
        PmsProduct record = new PmsProduct();
        record.setPublishStatus(publishStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateRecommendStatus(List<Long> ids, Integer recommendStatus) {
        PmsProduct record = new PmsProduct();
        record.setRecommandStatus(recommendStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateNewStatus(List<Long> ids, Integer newStatus) {
        PmsProduct record = new PmsProduct();
        record.setNewStatus(newStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateDeleteStatus(List<Long> ids, Integer deleteStatus) {
        PmsProduct record = new PmsProduct();
        record.setDeleteStatus(deleteStatus);
        PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public List<PmsProduct> list(String keyword) {
        PmsProductExample productExample = new PmsProductExample();
        PmsProductExample.Criteria criteria = productExample.createCriteria();
        criteria.andDeleteStatusEqualTo(0);
        if(!StrUtil.isEmpty(keyword)){
            criteria.andNameLike("%" + keyword + "%");
            productExample.or().andDeleteStatusEqualTo(0).andProductSnLike("%" + keyword + "%");
        }
        return productMapper.selectByExample(productExample);
    }

    /**
     * 建立和插入关系表操作
     *
     * @param dao       可以操作的dao
     * @param dataList  要插入的数据
     * @param productId 建立关系的id
     */
    private void relateAndInsertList(Object dao, List dataList, Long productId) {
        try {
            if (CollectionUtils.isEmpty(dataList)) return;
            for (Object item : dataList) {
                Method setId = item.getClass().getMethod("setId", Long.class);
                setId.invoke(item, (Long) null);
                Method setProductId = item.getClass().getMethod("setProductId", Long.class);
                setProductId.invoke(item, productId);
            }
            Method insertList = dao.getClass().getMethod("insertList", List.class);
            insertList.invoke(dao, dataList);
        } catch (Exception e) {
            LOGGER.warn("创建商品出错:{}", e.getMessage());
            throw new RuntimeException(e.getMessage());
        }
    }

//    @Override
//    public List<PmsProduct> getProductListForCurrentUser() {
//        // 1. 获取当前登录用户
//        String username = SecurityContextHolder.getContext().getAuthentication().getName();
//        log.info("当前登录用户名: {}", username);
//
//        // 2. 查询用户信息
//        UmsAdmin admin = umsAdminService.getAdminByUsername(username);
//        if (admin == null) {
//            log.warn("用户 {} 不存在！", username);
//            return Collections.emptyList();
//        }
//        Long adminId = admin.getId();
//        log.info("获取到用户 ID: {}", adminId);
//
//        // 3. 获取该用户有权限的仓库 ID 列表
//        List<Long> warehouseIds = umsAdminService.getWarehousesByAdminId(adminId);
//        log.info("用户 {} 拥有的仓库 ID 列表: {}", username, warehouseIds);
//
//        // 如果用户没有任何仓库权限，则返回空列表
//        if (warehouseIds.isEmpty()) {
//            return Collections.emptyList();
//        }
//
//        // 查询符合条件的商品
//        List<PmsProduct> productList = pmsProductMapper.listByWarehouseIds(warehouseIds);
//        log.info("查询到符合条件的商品数量: {}", productList.size());
//
//        return productList;
//    }

}
