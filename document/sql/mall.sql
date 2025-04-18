/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 30/03/2025 15:53:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `read_count` int(1) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_help
-- ----------------------------

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `help_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_help_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `report_type` int(1) NULL DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `report_object` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `report_status` int(1) NULL DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int(1) NULL DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户举报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_member_report
-- ----------------------------

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varbinary(500) NULL DEFAULT NULL COMMENT '展示图片',
  `sort` int(11) NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
INSERT INTO `cms_prefrence_area` VALUES (1, '让音质更出众', '音质不打折 完美现场感', NULL, NULL, 1);
INSERT INTO `cms_prefrence_area` VALUES (2, '让音质更出众22', '让音质更出众22', NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (3, '让音质更出众33', NULL, NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (4, '让音质更出众44', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区和产品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
INSERT INTO `cms_prefrence_area_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (24, 1, 23);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (25, 1, 47);

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题主图',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(1) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `collect_count` int(11) NULL DEFAULT NULL,
  `read_count` int(11) NULL DEFAULT NULL,
  `comment_count` int(11) NULL DEFAULT NULL,
  `album_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `forward_count` int(11) NULL DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
INSERT INTO `cms_subject` VALUES (1, 1, 'polo衬衫的也时尚', NULL, NULL, NULL, '2018-11-11 13:26:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` VALUES (2, 2, '大牌手机低价秒', NULL, NULL, NULL, '2018-11-12 13:27:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');
INSERT INTO `cms_subject` VALUES (3, 2, '晓龙845新品上市', NULL, NULL, NULL, '2018-11-13 13:27:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');
INSERT INTO `cms_subject` VALUES (4, 1, '夏天应该穿什么', NULL, NULL, NULL, '2018-11-01 13:27:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` VALUES (5, 1, '夏季精选', NULL, NULL, NULL, '2018-11-06 13:27:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` VALUES (6, 2, '品牌手机降价', NULL, NULL, NULL, '2018-11-07 13:27:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
INSERT INTO `cms_subject_category` VALUES (1, '服装专题', NULL, NULL, NULL, NULL);
INSERT INTO `cms_subject_category` VALUES (2, '手机专题', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题商品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
INSERT INTO `cms_subject_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_subject_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_subject_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_subject_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_subject_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_subject_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_subject_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_subject_product_relation` VALUES (29, 1, 23);
INSERT INTO `cms_subject_product_relation` VALUES (30, 4, 23);
INSERT INTO `cms_subject_product_relation` VALUES (31, 5, 23);
INSERT INTO `cms_subject_product_relation` VALUES (68, 2, 26);
INSERT INTO `cms_subject_product_relation` VALUES (69, 3, 26);
INSERT INTO `cms_subject_product_relation` VALUES (70, 6, 26);
INSERT INTO `cms_subject_product_relation` VALUES (71, 3, 47);

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `attend_count` int(11) NULL DEFAULT NULL COMMENT '参与人数',
  `attention_count` int(11) NULL DEFAULT NULL COMMENT '关注人数',
  `read_count` int(11) NULL DEFAULT NULL,
  `award_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参与方式',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '话题内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_topic
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `topic_id` bigint(20) NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cms_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for eu_express_trans_log
-- ----------------------------
DROP TABLE IF EXISTS `eu_express_trans_log`;
CREATE TABLE `eu_express_trans_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `request_api` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `request_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `request_status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `response_message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eu_express_trans_log
-- ----------------------------
INSERT INTO `eu_express_trans_log` VALUES (1, 'David', '/createOrder', '2025-03-22 14:09:51', 'error', '{\"statusCode\":\"error\",\"message\":\"验证失败：[Clientid] 或  [Token] 不正确，请联系物流提供！\"}');
INSERT INTO `eu_express_trans_log` VALUES (2, 'David', '/createOrder', '2025-03-22 15:18:14', 'error', '{\"statusCode\":\"error\",\"message\":\"[Clientid] 对应客户[David]不存在或已被删除！\"}');
INSERT INTO `eu_express_trans_log` VALUES (3, 'David', '/createOrder', '2025-03-22 16:41:47', 'error', '{\"statusCode\":\"error\",\"message\":\"[Clientid] 对应客户[David]不存在或已被删除！\"}');
INSERT INTO `eu_express_trans_log` VALUES (4, 'David', '/createOrder', '2025-03-23 01:25:43', 'error', '{\"statusCode\":\"error\",\"message\":\"订单类型 [OrderType] 字段值传入有误，正确值有[1:快件订单,2:快递制单,3:仓储订单,4:快递制单-及时返回单号]。\"}');
INSERT INTO `eu_express_trans_log` VALUES (5, 'David', '/createOrder', '2025-03-23 10:51:26', 'error', '{\"statusCode\":\"error\",\"message\":\"订单类型 [OrderType] 字段值传入有误，正确值有[1:快件订单,2:快递制单,3:仓储订单,4:快递制单-及时返回单号]。\"}');
INSERT INTO `eu_express_trans_log` VALUES (6, 'David', '/createOrder', '2025-03-23 10:52:18', 'error', '{\"statusCode\":\"error\",\"message\":\"订单类型 [OrderType] 字段值传入有误，正确值有[1:快件订单,2:快递制单,3:仓储订单,4:快递制单-及时返回单号]。\"}');
INSERT INTO `eu_express_trans_log` VALUES (7, 'David', '/createOrder', '2025-03-23 10:52:49', 'error', '{\"statusCode\":\"error\",\"message\":\"订单类型 [OrderType] 字段值传入有误，正确值有[1:快件订单,2:快递制单,3:仓储订单,4:快递制单-及时返回单号]。\"}');
INSERT INTO `eu_express_trans_log` VALUES (8, 'David', '/createOrder', '2025-03-23 10:54:34', 'error', '{\"statusCode\":\"error\",\"message\":\"请检查请求的Json数据格式中是否包含 [OrderDatas]字段，该字段类型为[JSONArray]，注意区分大小写！\"}');
INSERT INTO `eu_express_trans_log` VALUES (9, 'David', '/createOrder', '2025-03-23 15:45:12', 'error', '{\"statusCode\":\"error\",\"returnDatas\":[{\"statusCode\":\"error\",\"customerNumber\":\"test0315005\",\"childTrackingNumber\":\"\",\"shipmentid\":\"\",\"labelBillid\":\"\",\"message\":\"请求的 渠道id[ups666]在代理系统中不存在\"}],\"message\":\"\"}');
INSERT INTO `eu_express_trans_log` VALUES (10, 'David', '/createOrder', '2025-03-23 15:46:40', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[{\"statusCode\":\"error\",\"customerNumber\":\"test0315005\",\"childTrackingNumber\":\"\",\"shipmentid\":\"\",\"labelBillid\":\"\",\"totalAmt\":\"\",\"ccycode\":\"\",\"ifPianYuan\":\"1\",\"message\":\" 订单【EYT5032303307SZ】 制单失败：此渠道【美国】没有服务，不能走该渠道<br>\"}]}');
INSERT INTO `eu_express_trans_log` VALUES (11, 'David', '/createOrder', '2025-03-23 15:55:19', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[{\"statusCode\":\"error\",\"customerNumber\":\"test0315005\",\"childTrackingNumber\":\"\",\"shipmentid\":\"\",\"labelBillid\":\"\",\"totalAmt\":\"\",\"ccycode\":\"\",\"ifPianYuan\":\"1\",\"message\":\" 订单【EYT5032303308SZ】 制单失败：此渠道【美国】没有服务，不能走该渠道<br>\"}]}');
INSERT INTO `eu_express_trans_log` VALUES (12, 'David', '/createOrder', '2025-03-23 15:55:38', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[{\"statusCode\":\"success\",\"corpBillid\":\"EYT5032303309SZ\",\"trackNumber\":\"01805114342845\",\"customerNumber\":\"test0315005\",\"childTrackingNumber\":\"01805114342845,01805114342846,01805114342847,\",\"shipmentid\":\"\",\"labelBillid\":\"\",\"airportId\":\"\",\"totalAmt\":\"11.67\",\"ccycode\":\"EUR\",\"ifPianYuan\":\"0\",\"isPaperless\":\"1\",\"message\":\"创建订单成功！\"}]}');
INSERT INTO `eu_express_trans_log` VALUES (13, 'David', '/searchPrintPaper', '2025-03-23 16:12:40', 'error', '{\"statusCode\":\"error\",\"message\":\"查询失败，渠道代码：null，系统中不存在！\"}');
INSERT INTO `eu_express_trans_log` VALUES (14, 'David', '/searchPrintPaper', '2025-03-23 16:51:22', 'error', '{\"statusCode\":\"error\",\"message\":\"查询失败，渠道代码：DPD_BetaLo，没有设置标签打印格式，请联系物流商设置！\"}');
INSERT INTO `eu_express_trans_log` VALUES (15, 'David', '/searchPrintPaper', '2025-03-23 16:52:13', 'error', '{\"statusCode\":\"error\",\"message\":\"查询失败，渠道代码：DHL_FBA_Be，没有设置标签打印格式，请联系物流商设置！\"}');
INSERT INTO `eu_express_trans_log` VALUES (16, 'David', '/printOrderLabel', '2025-03-23 16:54:37', 'success', '{\"statusCode\":\"success\",\"url\":\"https://dtdh.kingtrans.net/upload/eorderlabel/2025-03-23/EYT5032303309SZ//01805114342845_AWB.PDF\",\"perUrl\":[\"https://dtdh.kingtrans.net/upload/eorderlabel/2025-03-23/EYT5032303309SZ//01805114342845_AWB.PDF\"],\"notExistsCorpbillid\":\"\",\"message\":\"\"}');
INSERT INTO `eu_express_trans_log` VALUES (17, 'David', '/searchStartChannel', '2025-03-23 17:20:01', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[{\"code\":\"UPS_DE\",\"cnname\":\"UPS德国-LCD\",\"enname\":\"UPS德国_609VR9-LCD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_0141\",\"cnname\":\"DPD德国0141仓位-德北\",\"enname\":\"DPD德国0141仓位-德北\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE\",\"cnname\":\"DPD德国0180仓位（德南）\",\"enname\":\"DPD德国0180仓位（德南）\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_NSR\",\"cnname\":\"UPS_NSR\",\"enname\":\"UPS_NSR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_SLHT\",\"cnname\":\"UPS世联互通\",\"enname\":\"UPS德国_SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_DE\",\"cnname\":\"DHL德国FBA-SLHT\",\"enname\":\"DHL_FBA_DE\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY\",\"cnname\":\"UPS_WLY-SLHT\",\"enname\":\"UPS_WLY-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE\",\"cnname\":\"DHL德国非FBA-SLHT\",\"enname\":\"DHL_DE\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU\",\"cnname\":\"DHL欧盟主要国家-SLHT\",\"enname\":\"DHL_EU\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_Jackst\",\"cnname\":\"UPS_Jackstar\",\"enname\":\"UPS_Jackstar\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_GT\",\"cnname\":\"UPS_WLY-GTI\",\"enname\":\"UPS_WLY-GTI\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_ou\",\"cnname\":\"UPS_WLY_ouyuan\",\"enname\":\"UPS_WLY_ouyuan\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_DR\",\"cnname\":\"UPS_WLY_DR\",\"enname\":\"UPS_WLY_DR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_HE\",\"cnname\":\"DHL德国FBA-HELIOCAR\",\"enname\":\"DHL_FBA_DE_HELIOCAR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_HEL\",\"cnname\":\"DHL德国非FBA-HELIOCARGO\",\"enname\":\"DHL_DE_HELIOCARGO\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_HEL\",\"cnname\":\"DHL欧盟主要国家-HELIOCARGO\",\"enname\":\"DHL_EU_HELIOCARGO\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_04\",\"cnname\":\"UPS_WLY_SLHT04\",\"enname\":\"UPS_WLY_SLHT04\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_02\",\"cnname\":\"UPS_WLY_Jackstar\",\"enname\":\"UPS_WLY_Jackstar\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HYC\",\"cnname\":\"DPD德国HYC-0180\",\"enname\":\"DPD德国HYC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_LC\",\"cnname\":\"UPS_WLY_rong\",\"enname\":\"UPS_WLY_rong\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_BS\",\"cnname\":\"UPS_WLY_BSD\",\"enname\":\"UPS_WLY_BSD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_JD\",\"cnname\":\"UPS-JD-FBA\",\"enname\":\"UPS_JD-FBA\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_GTI\",\"cnname\":\"DPD德国GTI-0180\",\"enname\":\"DPD德国GTI-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_HE\",\"cnname\":\"UPS_WLY_HELIOCARGO02\",\"enname\":\"UPS_WLY_HELIOCARGO02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_RO\",\"cnname\":\"DHL德国FBA_RONG\",\"enname\":\"DHL_FBA_DE_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RON\",\"cnname\":\"DHL德国非FBA-RONG\",\"enname\":\"DHL_DE_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_RON\",\"cnname\":\"DHL欧盟主要国家-RONG\",\"enname\":\"DHL_EU_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_RG\",\"cnname\":\"DHL德国FBA_RGG\",\"enname\":\"DHL_FBA_DE_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RGG\",\"cnname\":\"DHL德国非FBA-RGG\",\"enname\":\"DHL_DE_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_RGG\",\"cnname\":\"DHL欧盟主要国家-RGG\",\"enname\":\"DHL_EU_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_YD\",\"cnname\":\"DHL德国FBA-YDP\",\"enname\":\"DHL_FBA_DE_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_YDP\",\"cnname\":\"DHL德国非FBA-YDP\",\"enname\":\"DHL_DE_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_IN\",\"cnname\":\"DHL德国FBA-INTEL\",\"enname\":\"DHL_FBA_DE_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_05\",\"cnname\":\"UPS_WLY_SLHT05\",\"enname\":\"UPS_WLY_SLHT05\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_YDP\",\"cnname\":\"DHL欧盟主要国家-YDP\",\"enname\":\"DHL_EU_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_INT\",\"cnname\":\"DHL德国非FBA-INTEL\",\"enname\":\"DHL_DE_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE_INT\",\"cnname\":\"DPD德国INTEL-0180\",\"enname\":\"DPD德国INTEL-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_SH\",\"cnname\":\"DHL德国FBA-SHOJT\",\"enname\":\"DHL_FBA_DE_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_SHO\",\"cnname\":\"DHL德国非FBA-SHOJT\",\"enname\":\"DHL_DE_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_SHO\",\"cnname\":\"DHL欧盟主要国家-SHOJT\",\"enname\":\"DHL_EU_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE_Ren\",\"cnname\":\"DPD德国0180-Reniox\",\"enname\":\"DPD德国0180-Reniox\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_ron\",\"cnname\":\"UPS德国-rong\",\"enname\":\"UPS德国_609VR9-rong\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_DHL\",\"cnname\":\"DHL-德国20KG及以下非FBA-SLHT\",\"enname\":\"DHL-德国20KG及以下非FBA-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_DH2\",\"cnname\":\"DHL-德国20KG以上非FBA-SLHT\",\"enname\":\"DHL-德国20KG以上非FBA-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_INT\",\"cnname\":\"DHL欧盟主要国家-INTEL\",\"enname\":\"DHL_EU_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_HE\",\"cnname\":\"DHL-德国20KG及以下非FBA-Heliocargo\",\"enname\":\"DHL-德国20KG及以下非FBA-Heliocargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_r\",\"cnname\":\"DHL-德国20KG以上非FBA-RONG\",\"enname\":\"DHL-德国20KG以上非FBA-RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_XINC\",\"cnname\":\"DPD德国XINC-0180\",\"enname\":\"DPD德国XINC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_ouyuan\",\"cnname\":\"UPS_ouyuan-609\",\"enname\":\"UPS_ouyuan-609\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YWXC\",\"cnname\":\"DPD德国YWXC-0180\",\"enname\":\"DPD德国YWXC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_Ouyee\",\"cnname\":\"DPD_Ouyee\",\"enname\":\"DPD_Ouyee\",\"status\":\"0\",\"ifColl\":\"0\"},{\"code\":\"DPD_Desinn\",\"cnname\":\"DPD德国Desinn-0180\",\"enname\":\"DPD德国Desinn-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_Ca\",\"cnname\":\"DHL德国FBA_Cargo\",\"enname\":\"DHL_FBA_DE_Cargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HUAL\",\"cnname\":\"DPD德国HUAL-0180-17026\",\"enname\":\"DPD德国HUAL-0180-17026\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_JD_B2C\",\"cnname\":\"UPS-JD-B2C\",\"enname\":\"UPS_JD-B2C\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RGO\",\"cnname\":\"DHL-德国20KG以上非FBA-Heliocargo\",\"enname\":\"DHL-德国20KG以上非FBA-Heliocargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_ro\",\"cnname\":\"DHL-德国20KG及以下非FBA-RONG\",\"enname\":\"DHL-德国20KG及以下非FBA-RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HQBH\",\"cnname\":\"DPD德国HQBH-0180\",\"enname\":\"DPD德国HQBH-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_CDZ\",\"cnname\":\"UPS德国-CDZZ\",\"enname\":\"UPS德国_609VR9-CDZZ\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YIBO\",\"cnname\":\"DPD德国YIBO-0180\",\"enname\":\"DPD德国YIBO-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_JY\",\"cnname\":\"DPD德国JY-0180\",\"enname\":\"DPD德国JY-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_170\",\"cnname\":\"UPS德国-17026U\",\"enname\":\"UPS德国-17026U\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_YT_01\",\"cnname\":\"UPS_宇腾_01\",\"enname\":\"UPS_宇腾_01\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_0150\",\"cnname\":\"DPD德国0150 Bergheim科隆\",\"enname\":\"DPD德国0150 Bergheim\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_Cargo\",\"cnname\":\"UPS_Cargo-609VR\",\"enname\":\"UPS_Cargo-609VR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_SLHT\",\"cnname\":\"DPD德国SLHT02-0180\",\"enname\":\"DPD德国SLHT02-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_CD\",\"cnname\":\"UPS_WLY_CDZZ02\",\"enname\":\"UPS_WLY_CDZZ02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_rong02\",\"cnname\":\"DPD德国rong02-0180\",\"enname\":\"DPD德国rong02-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_KYTD\",\"cnname\":\"DPD德国KYTD-0180\",\"enname\":\"DPD德国KYTD-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_KYT\",\"cnname\":\"UPS德国_609VR9-KYTD02\",\"enname\":\"UPS德国_609VR9-KYTD02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_zfw\",\"cnname\":\"UPS德国-zfwl\",\"enname\":\"UPS德国_609VR9-zfwl\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_JT\",\"cnname\":\"UPS_WLY_JT02\",\"enname\":\"UPS_WLY_JT02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_SGS\",\"cnname\":\"UPS德国-SGS\",\"enname\":\"UPS德国_609VR9-SGS\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_SG\",\"cnname\":\"UPS_WLY_SGS\",\"enname\":\"UPS_WLY_SGS\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_LB\",\"cnname\":\"DPD德国LB-0180\",\"enname\":\"DPD德国LB-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_KY\",\"cnname\":\"UPS_WLY_KYTD02\",\"enname\":\"UPS_WLY_KYTD02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_KY\",\"cnname\":\"DHL德国FBA-KYTD\",\"enname\":\"DHL_FBA_DE_KYTD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_JT\",\"cnname\":\"DPD德国JT-0180\",\"enname\":\"DPD德国JT-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_JT\",\"cnname\":\"UPS德国_609VR9-JT02\",\"enname\":\"UPS德国_609VR9-JT02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YWHY\",\"cnname\":\"DPD德国YWHY-0180\",\"enname\":\"DPD德国YWHY-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_DM\",\"cnname\":\"DHL德国FBA-MCC\",\"enname\":\"DHL_FBA_DE_MCC\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_JY0\",\"cnname\":\"UPS德国_609VR9-JY02\",\"enname\":\"UPS德国_609VR9-JY02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_JY\",\"cnname\":\"UPS_WLY_JY02\",\"enname\":\"UPS_WLY_JY02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_BetaLo\",\"cnname\":\"DPD德国BetaLogisztika-0180\",\"enname\":\"DPD德国BetaLogisztika-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_zf\",\"cnname\":\"UPS_WLY_zfwl\",\"enname\":\"UPS_WLY_zfwl\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_MCC\",\"cnname\":\"DPD德国MCC-0180\",\"enname\":\"DPD德国MCC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_Be\",\"cnname\":\"DHL德国FBA_BetaLogisztika\",\"enname\":\"DHL_FBA_DE_BetaLogisztika\",\"status\":\"1\",\"ifColl\":\"0\"}]}');
INSERT INTO `eu_express_trans_log` VALUES (18, 'David', '/searchInsuranceType', '2025-03-23 17:23:53', 'error', '{\"statusCode\":\"error\",\"message\":\"系统中还未设置保险类型,如有问题请联系物流商！\"}');
INSERT INTO `eu_express_trans_log` VALUES (19, 'David', '/searchInsuranceType', '2025-03-23 17:26:10', 'error', '{\"statusCode\":\"error\",\"message\":\"系统中还未设置保险类型,如有问题请联系物流商！\"}');
INSERT INTO `eu_express_trans_log` VALUES (20, 'David', '/searchStartChannel', '2025-03-23 17:26:15', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[{\"code\":\"UPS_DE\",\"cnname\":\"UPS德国-LCD\",\"enname\":\"UPS德国_609VR9-LCD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_0141\",\"cnname\":\"DPD德国0141仓位-德北\",\"enname\":\"DPD德国0141仓位-德北\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE\",\"cnname\":\"DPD德国0180仓位（德南）\",\"enname\":\"DPD德国0180仓位（德南）\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_NSR\",\"cnname\":\"UPS_NSR\",\"enname\":\"UPS_NSR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_SLHT\",\"cnname\":\"UPS世联互通\",\"enname\":\"UPS德国_SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_DE\",\"cnname\":\"DHL德国FBA-SLHT\",\"enname\":\"DHL_FBA_DE\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY\",\"cnname\":\"UPS_WLY-SLHT\",\"enname\":\"UPS_WLY-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE\",\"cnname\":\"DHL德国非FBA-SLHT\",\"enname\":\"DHL_DE\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU\",\"cnname\":\"DHL欧盟主要国家-SLHT\",\"enname\":\"DHL_EU\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_Jackst\",\"cnname\":\"UPS_Jackstar\",\"enname\":\"UPS_Jackstar\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_GT\",\"cnname\":\"UPS_WLY-GTI\",\"enname\":\"UPS_WLY-GTI\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_ou\",\"cnname\":\"UPS_WLY_ouyuan\",\"enname\":\"UPS_WLY_ouyuan\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_DR\",\"cnname\":\"UPS_WLY_DR\",\"enname\":\"UPS_WLY_DR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_HE\",\"cnname\":\"DHL德国FBA-HELIOCAR\",\"enname\":\"DHL_FBA_DE_HELIOCAR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_HEL\",\"cnname\":\"DHL德国非FBA-HELIOCARGO\",\"enname\":\"DHL_DE_HELIOCARGO\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_HEL\",\"cnname\":\"DHL欧盟主要国家-HELIOCARGO\",\"enname\":\"DHL_EU_HELIOCARGO\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_04\",\"cnname\":\"UPS_WLY_SLHT04\",\"enname\":\"UPS_WLY_SLHT04\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_02\",\"cnname\":\"UPS_WLY_Jackstar\",\"enname\":\"UPS_WLY_Jackstar\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HYC\",\"cnname\":\"DPD德国HYC-0180\",\"enname\":\"DPD德国HYC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_LC\",\"cnname\":\"UPS_WLY_rong\",\"enname\":\"UPS_WLY_rong\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_BS\",\"cnname\":\"UPS_WLY_BSD\",\"enname\":\"UPS_WLY_BSD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_JD\",\"cnname\":\"UPS-JD-FBA\",\"enname\":\"UPS_JD-FBA\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_GTI\",\"cnname\":\"DPD德国GTI-0180\",\"enname\":\"DPD德国GTI-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_HE\",\"cnname\":\"UPS_WLY_HELIOCARGO02\",\"enname\":\"UPS_WLY_HELIOCARGO02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_RO\",\"cnname\":\"DHL德国FBA_RONG\",\"enname\":\"DHL_FBA_DE_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RON\",\"cnname\":\"DHL德国非FBA-RONG\",\"enname\":\"DHL_DE_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_RON\",\"cnname\":\"DHL欧盟主要国家-RONG\",\"enname\":\"DHL_EU_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_RG\",\"cnname\":\"DHL德国FBA_RGG\",\"enname\":\"DHL_FBA_DE_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RGG\",\"cnname\":\"DHL德国非FBA-RGG\",\"enname\":\"DHL_DE_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_RGG\",\"cnname\":\"DHL欧盟主要国家-RGG\",\"enname\":\"DHL_EU_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_YD\",\"cnname\":\"DHL德国FBA-YDP\",\"enname\":\"DHL_FBA_DE_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_YDP\",\"cnname\":\"DHL德国非FBA-YDP\",\"enname\":\"DHL_DE_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_IN\",\"cnname\":\"DHL德国FBA-INTEL\",\"enname\":\"DHL_FBA_DE_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_05\",\"cnname\":\"UPS_WLY_SLHT05\",\"enname\":\"UPS_WLY_SLHT05\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_YDP\",\"cnname\":\"DHL欧盟主要国家-YDP\",\"enname\":\"DHL_EU_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_INT\",\"cnname\":\"DHL德国非FBA-INTEL\",\"enname\":\"DHL_DE_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE_INT\",\"cnname\":\"DPD德国INTEL-0180\",\"enname\":\"DPD德国INTEL-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_SH\",\"cnname\":\"DHL德国FBA-SHOJT\",\"enname\":\"DHL_FBA_DE_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_SHO\",\"cnname\":\"DHL德国非FBA-SHOJT\",\"enname\":\"DHL_DE_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_SHO\",\"cnname\":\"DHL欧盟主要国家-SHOJT\",\"enname\":\"DHL_EU_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE_Ren\",\"cnname\":\"DPD德国0180-Reniox\",\"enname\":\"DPD德国0180-Reniox\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_ron\",\"cnname\":\"UPS德国-rong\",\"enname\":\"UPS德国_609VR9-rong\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_DHL\",\"cnname\":\"DHL-德国20KG及以下非FBA-SLHT\",\"enname\":\"DHL-德国20KG及以下非FBA-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_DH2\",\"cnname\":\"DHL-德国20KG以上非FBA-SLHT\",\"enname\":\"DHL-德国20KG以上非FBA-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_INT\",\"cnname\":\"DHL欧盟主要国家-INTEL\",\"enname\":\"DHL_EU_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_HE\",\"cnname\":\"DHL-德国20KG及以下非FBA-Heliocargo\",\"enname\":\"DHL-德国20KG及以下非FBA-Heliocargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_r\",\"cnname\":\"DHL-德国20KG以上非FBA-RONG\",\"enname\":\"DHL-德国20KG以上非FBA-RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_XINC\",\"cnname\":\"DPD德国XINC-0180\",\"enname\":\"DPD德国XINC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_ouyuan\",\"cnname\":\"UPS_ouyuan-609\",\"enname\":\"UPS_ouyuan-609\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YWXC\",\"cnname\":\"DPD德国YWXC-0180\",\"enname\":\"DPD德国YWXC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_Ouyee\",\"cnname\":\"DPD_Ouyee\",\"enname\":\"DPD_Ouyee\",\"status\":\"0\",\"ifColl\":\"0\"},{\"code\":\"DPD_Desinn\",\"cnname\":\"DPD德国Desinn-0180\",\"enname\":\"DPD德国Desinn-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_Ca\",\"cnname\":\"DHL德国FBA_Cargo\",\"enname\":\"DHL_FBA_DE_Cargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HUAL\",\"cnname\":\"DPD德国HUAL-0180-17026\",\"enname\":\"DPD德国HUAL-0180-17026\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_JD_B2C\",\"cnname\":\"UPS-JD-B2C\",\"enname\":\"UPS_JD-B2C\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RGO\",\"cnname\":\"DHL-德国20KG以上非FBA-Heliocargo\",\"enname\":\"DHL-德国20KG以上非FBA-Heliocargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_ro\",\"cnname\":\"DHL-德国20KG及以下非FBA-RONG\",\"enname\":\"DHL-德国20KG及以下非FBA-RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HQBH\",\"cnname\":\"DPD德国HQBH-0180\",\"enname\":\"DPD德国HQBH-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_CDZ\",\"cnname\":\"UPS德国-CDZZ\",\"enname\":\"UPS德国_609VR9-CDZZ\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YIBO\",\"cnname\":\"DPD德国YIBO-0180\",\"enname\":\"DPD德国YIBO-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_JY\",\"cnname\":\"DPD德国JY-0180\",\"enname\":\"DPD德国JY-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_170\",\"cnname\":\"UPS德国-17026U\",\"enname\":\"UPS德国-17026U\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_YT_01\",\"cnname\":\"UPS_宇腾_01\",\"enname\":\"UPS_宇腾_01\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_0150\",\"cnname\":\"DPD德国0150 Bergheim科隆\",\"enname\":\"DPD德国0150 Bergheim\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_Cargo\",\"cnname\":\"UPS_Cargo-609VR\",\"enname\":\"UPS_Cargo-609VR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_SLHT\",\"cnname\":\"DPD德国SLHT02-0180\",\"enname\":\"DPD德国SLHT02-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_CD\",\"cnname\":\"UPS_WLY_CDZZ02\",\"enname\":\"UPS_WLY_CDZZ02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_rong02\",\"cnname\":\"DPD德国rong02-0180\",\"enname\":\"DPD德国rong02-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_KYTD\",\"cnname\":\"DPD德国KYTD-0180\",\"enname\":\"DPD德国KYTD-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_KYT\",\"cnname\":\"UPS德国_609VR9-KYTD02\",\"enname\":\"UPS德国_609VR9-KYTD02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_zfw\",\"cnname\":\"UPS德国-zfwl\",\"enname\":\"UPS德国_609VR9-zfwl\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_JT\",\"cnname\":\"UPS_WLY_JT02\",\"enname\":\"UPS_WLY_JT02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_SGS\",\"cnname\":\"UPS德国-SGS\",\"enname\":\"UPS德国_609VR9-SGS\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_SG\",\"cnname\":\"UPS_WLY_SGS\",\"enname\":\"UPS_WLY_SGS\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_LB\",\"cnname\":\"DPD德国LB-0180\",\"enname\":\"DPD德国LB-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_KY\",\"cnname\":\"UPS_WLY_KYTD02\",\"enname\":\"UPS_WLY_KYTD02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_KY\",\"cnname\":\"DHL德国FBA-KYTD\",\"enname\":\"DHL_FBA_DE_KYTD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_JT\",\"cnname\":\"DPD德国JT-0180\",\"enname\":\"DPD德国JT-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_JT\",\"cnname\":\"UPS德国_609VR9-JT02\",\"enname\":\"UPS德国_609VR9-JT02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YWHY\",\"cnname\":\"DPD德国YWHY-0180\",\"enname\":\"DPD德国YWHY-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_DM\",\"cnname\":\"DHL德国FBA-MCC\",\"enname\":\"DHL_FBA_DE_MCC\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_JY0\",\"cnname\":\"UPS德国_609VR9-JY02\",\"enname\":\"UPS德国_609VR9-JY02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_JY\",\"cnname\":\"UPS_WLY_JY02\",\"enname\":\"UPS_WLY_JY02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_BetaLo\",\"cnname\":\"DPD德国BetaLogisztika-0180\",\"enname\":\"DPD德国BetaLogisztika-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_zf\",\"cnname\":\"UPS_WLY_zfwl\",\"enname\":\"UPS_WLY_zfwl\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_MCC\",\"cnname\":\"DPD德国MCC-0180\",\"enname\":\"DPD德国MCC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_Be\",\"cnname\":\"DHL德国FBA_BetaLogisztika\",\"enname\":\"DHL_FBA_DE_BetaLogisztika\",\"status\":\"1\",\"ifColl\":\"0\"}]}');
INSERT INTO `eu_express_trans_log` VALUES (21, 'David', '/searchStartChannel', '2025-03-23 17:26:28', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[{\"code\":\"UPS_DE\",\"cnname\":\"UPS德国-LCD\",\"enname\":\"UPS德国_609VR9-LCD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_0141\",\"cnname\":\"DPD德国0141仓位-德北\",\"enname\":\"DPD德国0141仓位-德北\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE\",\"cnname\":\"DPD德国0180仓位（德南）\",\"enname\":\"DPD德国0180仓位（德南）\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_NSR\",\"cnname\":\"UPS_NSR\",\"enname\":\"UPS_NSR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_SLHT\",\"cnname\":\"UPS世联互通\",\"enname\":\"UPS德国_SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_DE\",\"cnname\":\"DHL德国FBA-SLHT\",\"enname\":\"DHL_FBA_DE\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY\",\"cnname\":\"UPS_WLY-SLHT\",\"enname\":\"UPS_WLY-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE\",\"cnname\":\"DHL德国非FBA-SLHT\",\"enname\":\"DHL_DE\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU\",\"cnname\":\"DHL欧盟主要国家-SLHT\",\"enname\":\"DHL_EU\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_Jackst\",\"cnname\":\"UPS_Jackstar\",\"enname\":\"UPS_Jackstar\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_GT\",\"cnname\":\"UPS_WLY-GTI\",\"enname\":\"UPS_WLY-GTI\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_ou\",\"cnname\":\"UPS_WLY_ouyuan\",\"enname\":\"UPS_WLY_ouyuan\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_DR\",\"cnname\":\"UPS_WLY_DR\",\"enname\":\"UPS_WLY_DR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_HE\",\"cnname\":\"DHL德国FBA-HELIOCAR\",\"enname\":\"DHL_FBA_DE_HELIOCAR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_HEL\",\"cnname\":\"DHL德国非FBA-HELIOCARGO\",\"enname\":\"DHL_DE_HELIOCARGO\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_HEL\",\"cnname\":\"DHL欧盟主要国家-HELIOCARGO\",\"enname\":\"DHL_EU_HELIOCARGO\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_04\",\"cnname\":\"UPS_WLY_SLHT04\",\"enname\":\"UPS_WLY_SLHT04\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_02\",\"cnname\":\"UPS_WLY_Jackstar\",\"enname\":\"UPS_WLY_Jackstar\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HYC\",\"cnname\":\"DPD德国HYC-0180\",\"enname\":\"DPD德国HYC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_LC\",\"cnname\":\"UPS_WLY_rong\",\"enname\":\"UPS_WLY_rong\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_BS\",\"cnname\":\"UPS_WLY_BSD\",\"enname\":\"UPS_WLY_BSD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_JD\",\"cnname\":\"UPS-JD-FBA\",\"enname\":\"UPS_JD-FBA\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_GTI\",\"cnname\":\"DPD德国GTI-0180\",\"enname\":\"DPD德国GTI-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_HE\",\"cnname\":\"UPS_WLY_HELIOCARGO02\",\"enname\":\"UPS_WLY_HELIOCARGO02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_RO\",\"cnname\":\"DHL德国FBA_RONG\",\"enname\":\"DHL_FBA_DE_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RON\",\"cnname\":\"DHL德国非FBA-RONG\",\"enname\":\"DHL_DE_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_RON\",\"cnname\":\"DHL欧盟主要国家-RONG\",\"enname\":\"DHL_EU_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_RG\",\"cnname\":\"DHL德国FBA_RGG\",\"enname\":\"DHL_FBA_DE_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RGG\",\"cnname\":\"DHL德国非FBA-RGG\",\"enname\":\"DHL_DE_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_RGG\",\"cnname\":\"DHL欧盟主要国家-RGG\",\"enname\":\"DHL_EU_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_YD\",\"cnname\":\"DHL德国FBA-YDP\",\"enname\":\"DHL_FBA_DE_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_YDP\",\"cnname\":\"DHL德国非FBA-YDP\",\"enname\":\"DHL_DE_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_IN\",\"cnname\":\"DHL德国FBA-INTEL\",\"enname\":\"DHL_FBA_DE_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_05\",\"cnname\":\"UPS_WLY_SLHT05\",\"enname\":\"UPS_WLY_SLHT05\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_YDP\",\"cnname\":\"DHL欧盟主要国家-YDP\",\"enname\":\"DHL_EU_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_INT\",\"cnname\":\"DHL德国非FBA-INTEL\",\"enname\":\"DHL_DE_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE_INT\",\"cnname\":\"DPD德国INTEL-0180\",\"enname\":\"DPD德国INTEL-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_SH\",\"cnname\":\"DHL德国FBA-SHOJT\",\"enname\":\"DHL_FBA_DE_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_SHO\",\"cnname\":\"DHL德国非FBA-SHOJT\",\"enname\":\"DHL_DE_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_SHO\",\"cnname\":\"DHL欧盟主要国家-SHOJT\",\"enname\":\"DHL_EU_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE_Ren\",\"cnname\":\"DPD德国0180-Reniox\",\"enname\":\"DPD德国0180-Reniox\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_ron\",\"cnname\":\"UPS德国-rong\",\"enname\":\"UPS德国_609VR9-rong\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_DHL\",\"cnname\":\"DHL-德国20KG及以下非FBA-SLHT\",\"enname\":\"DHL-德国20KG及以下非FBA-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_DH2\",\"cnname\":\"DHL-德国20KG以上非FBA-SLHT\",\"enname\":\"DHL-德国20KG以上非FBA-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_INT\",\"cnname\":\"DHL欧盟主要国家-INTEL\",\"enname\":\"DHL_EU_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_HE\",\"cnname\":\"DHL-德国20KG及以下非FBA-Heliocargo\",\"enname\":\"DHL-德国20KG及以下非FBA-Heliocargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_r\",\"cnname\":\"DHL-德国20KG以上非FBA-RONG\",\"enname\":\"DHL-德国20KG以上非FBA-RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_XINC\",\"cnname\":\"DPD德国XINC-0180\",\"enname\":\"DPD德国XINC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_ouyuan\",\"cnname\":\"UPS_ouyuan-609\",\"enname\":\"UPS_ouyuan-609\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YWXC\",\"cnname\":\"DPD德国YWXC-0180\",\"enname\":\"DPD德国YWXC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_Ouyee\",\"cnname\":\"DPD_Ouyee\",\"enname\":\"DPD_Ouyee\",\"status\":\"0\",\"ifColl\":\"0\"},{\"code\":\"DPD_Desinn\",\"cnname\":\"DPD德国Desinn-0180\",\"enname\":\"DPD德国Desinn-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_Ca\",\"cnname\":\"DHL德国FBA_Cargo\",\"enname\":\"DHL_FBA_DE_Cargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HUAL\",\"cnname\":\"DPD德国HUAL-0180-17026\",\"enname\":\"DPD德国HUAL-0180-17026\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_JD_B2C\",\"cnname\":\"UPS-JD-B2C\",\"enname\":\"UPS_JD-B2C\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RGO\",\"cnname\":\"DHL-德国20KG以上非FBA-Heliocargo\",\"enname\":\"DHL-德国20KG以上非FBA-Heliocargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_ro\",\"cnname\":\"DHL-德国20KG及以下非FBA-RONG\",\"enname\":\"DHL-德国20KG及以下非FBA-RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HQBH\",\"cnname\":\"DPD德国HQBH-0180\",\"enname\":\"DPD德国HQBH-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_CDZ\",\"cnname\":\"UPS德国-CDZZ\",\"enname\":\"UPS德国_609VR9-CDZZ\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YIBO\",\"cnname\":\"DPD德国YIBO-0180\",\"enname\":\"DPD德国YIBO-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_JY\",\"cnname\":\"DPD德国JY-0180\",\"enname\":\"DPD德国JY-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_170\",\"cnname\":\"UPS德国-17026U\",\"enname\":\"UPS德国-17026U\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_YT_01\",\"cnname\":\"UPS_宇腾_01\",\"enname\":\"UPS_宇腾_01\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_0150\",\"cnname\":\"DPD德国0150 Bergheim科隆\",\"enname\":\"DPD德国0150 Bergheim\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_Cargo\",\"cnname\":\"UPS_Cargo-609VR\",\"enname\":\"UPS_Cargo-609VR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_SLHT\",\"cnname\":\"DPD德国SLHT02-0180\",\"enname\":\"DPD德国SLHT02-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_CD\",\"cnname\":\"UPS_WLY_CDZZ02\",\"enname\":\"UPS_WLY_CDZZ02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_rong02\",\"cnname\":\"DPD德国rong02-0180\",\"enname\":\"DPD德国rong02-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_KYTD\",\"cnname\":\"DPD德国KYTD-0180\",\"enname\":\"DPD德国KYTD-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_KYT\",\"cnname\":\"UPS德国_609VR9-KYTD02\",\"enname\":\"UPS德国_609VR9-KYTD02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_zfw\",\"cnname\":\"UPS德国-zfwl\",\"enname\":\"UPS德国_609VR9-zfwl\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_JT\",\"cnname\":\"UPS_WLY_JT02\",\"enname\":\"UPS_WLY_JT02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_SGS\",\"cnname\":\"UPS德国-SGS\",\"enname\":\"UPS德国_609VR9-SGS\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_SG\",\"cnname\":\"UPS_WLY_SGS\",\"enname\":\"UPS_WLY_SGS\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_LB\",\"cnname\":\"DPD德国LB-0180\",\"enname\":\"DPD德国LB-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_KY\",\"cnname\":\"UPS_WLY_KYTD02\",\"enname\":\"UPS_WLY_KYTD02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_KY\",\"cnname\":\"DHL德国FBA-KYTD\",\"enname\":\"DHL_FBA_DE_KYTD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_JT\",\"cnname\":\"DPD德国JT-0180\",\"enname\":\"DPD德国JT-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_JT\",\"cnname\":\"UPS德国_609VR9-JT02\",\"enname\":\"UPS德国_609VR9-JT02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YWHY\",\"cnname\":\"DPD德国YWHY-0180\",\"enname\":\"DPD德国YWHY-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_DM\",\"cnname\":\"DHL德国FBA-MCC\",\"enname\":\"DHL_FBA_DE_MCC\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_JY0\",\"cnname\":\"UPS德国_609VR9-JY02\",\"enname\":\"UPS德国_609VR9-JY02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_JY\",\"cnname\":\"UPS_WLY_JY02\",\"enname\":\"UPS_WLY_JY02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_BetaLo\",\"cnname\":\"DPD德国BetaLogisztika-0180\",\"enname\":\"DPD德国BetaLogisztika-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_zf\",\"cnname\":\"UPS_WLY_zfwl\",\"enname\":\"UPS_WLY_zfwl\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_MCC\",\"cnname\":\"DPD德国MCC-0180\",\"enname\":\"DPD德国MCC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_Be\",\"cnname\":\"DHL德国FBA_BetaLogisztika\",\"enname\":\"DHL_FBA_DE_BetaLogisztika\",\"status\":\"1\",\"ifColl\":\"0\"}]}');
INSERT INTO `eu_express_trans_log` VALUES (22, 'David', '/searchPrice', '2025-03-23 17:30:00', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[]}');
INSERT INTO `eu_express_trans_log` VALUES (23, 'David', '/searchTrack', '2025-03-23 17:32:51', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[{\"statusCode\":\"error\",\"trackNumber\":\"01805114342845\",\"message\":\"单号系统中不存在！\"}]}');
INSERT INTO `eu_express_trans_log` VALUES (24, 'David', '/cancelDelivery', '2025-03-23 17:34:44', 'error', '{\"statusCode\":\"error\",\"message\":\"请检查请求的Json数据格式中是否包含 [Verify] 和 [CorpBillid]字段,注意区分大小写！\"}');
INSERT INTO `eu_express_trans_log` VALUES (25, 'David', '/printOrderInvoice', '2025-03-23 17:37:48', 'error', '{\"statusCode\":\"error\",\"message\":\"传入的订单号系统中不存，可能已被删除或不是当前客户的订单！\"}');
INSERT INTO `eu_express_trans_log` VALUES (26, 'David', '/searchOrderTracknumber', '2025-03-23 17:56:08', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[{\"statusCode\":\"success\",\"corpBillid\":\"EYT5032303309SZ\",\"trackNumber\":\"01805114342845\",\"customerNumber\":\"test0315005\",\"childTrackingNumber\":\"01805114342845,01805114342846,01805114342847,\",\"shipmentid\":\"\",\"labelBillid\":\"\",\"totalAmt\":\"11.670\",\"ccycode\":\"EUR\",\"ifPianYuan\":\"0\",\"isPaperless\":\"1\",\"message\":\"\"}]}');
INSERT INTO `eu_express_trans_log` VALUES (27, 'David', '/cancelDelivery', '2025-03-23 17:58:06', 'error', '{\"statusCode\":\"error\",\"message\":\"请检查请求的Json数据格式中是否包含 [Verify] 和 [CorpBillid]字段,注意区分大小写！\"}');
INSERT INTO `eu_express_trans_log` VALUES (28, 'David', '/cancelDelivery', '2025-03-23 18:11:59', 'error', '{\"statusCode\":\"error\",\"message\":\"请检查请求的Json数据格式中是否包含 [Verify] 和 [CorpBillid]字段,注意区分大小写！\"}');
INSERT INTO `eu_express_trans_log` VALUES (29, 'David', '/searchStartChannel', '2025-03-24 14:21:05', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[{\"code\":\"UPS_DE\",\"cnname\":\"UPS德国-LCD\",\"enname\":\"UPS德国_609VR9-LCD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_0141\",\"cnname\":\"DPD德国0141仓位-德北\",\"enname\":\"DPD德国0141仓位-德北\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE\",\"cnname\":\"DPD德国0180仓位（德南）\",\"enname\":\"DPD德国0180仓位（德南）\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_NSR\",\"cnname\":\"UPS_NSR\",\"enname\":\"UPS_NSR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_SLHT\",\"cnname\":\"UPS世联互通\",\"enname\":\"UPS德国_SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_DE\",\"cnname\":\"DHL德国FBA-SLHT\",\"enname\":\"DHL_FBA_DE\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY\",\"cnname\":\"UPS_WLY-SLHT\",\"enname\":\"UPS_WLY-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE\",\"cnname\":\"DHL德国非FBA-SLHT\",\"enname\":\"DHL_DE\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU\",\"cnname\":\"DHL欧盟主要国家-SLHT\",\"enname\":\"DHL_EU\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_Jackst\",\"cnname\":\"UPS_Jackstar\",\"enname\":\"UPS_Jackstar\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_GT\",\"cnname\":\"UPS_WLY-GTI\",\"enname\":\"UPS_WLY-GTI\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_ou\",\"cnname\":\"UPS_WLY_ouyuan\",\"enname\":\"UPS_WLY_ouyuan\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_DR\",\"cnname\":\"UPS_WLY_DR\",\"enname\":\"UPS_WLY_DR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_HE\",\"cnname\":\"DHL德国FBA-HELIOCAR\",\"enname\":\"DHL_FBA_DE_HELIOCAR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_HEL\",\"cnname\":\"DHL德国非FBA-HELIOCARGO\",\"enname\":\"DHL_DE_HELIOCARGO\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_HEL\",\"cnname\":\"DHL欧盟主要国家-HELIOCARGO\",\"enname\":\"DHL_EU_HELIOCARGO\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_04\",\"cnname\":\"UPS_WLY_SLHT04\",\"enname\":\"UPS_WLY_SLHT04\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_02\",\"cnname\":\"UPS_WLY_Jackstar\",\"enname\":\"UPS_WLY_Jackstar\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HYC\",\"cnname\":\"DPD德国HYC-0180\",\"enname\":\"DPD德国HYC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_LC\",\"cnname\":\"UPS_WLY_rong\",\"enname\":\"UPS_WLY_rong\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_BS\",\"cnname\":\"UPS_WLY_BSD\",\"enname\":\"UPS_WLY_BSD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_JD\",\"cnname\":\"UPS-JD-FBA\",\"enname\":\"UPS_JD-FBA\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_GTI\",\"cnname\":\"DPD德国GTI-0180\",\"enname\":\"DPD德国GTI-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_HE\",\"cnname\":\"UPS_WLY_HELIOCARGO02\",\"enname\":\"UPS_WLY_HELIOCARGO02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_RO\",\"cnname\":\"DHL德国FBA_RONG\",\"enname\":\"DHL_FBA_DE_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RON\",\"cnname\":\"DHL德国非FBA-RONG\",\"enname\":\"DHL_DE_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_RON\",\"cnname\":\"DHL欧盟主要国家-RONG\",\"enname\":\"DHL_EU_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_RG\",\"cnname\":\"DHL德国FBA_RGG\",\"enname\":\"DHL_FBA_DE_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RGG\",\"cnname\":\"DHL德国非FBA-RGG\",\"enname\":\"DHL_DE_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_RGG\",\"cnname\":\"DHL欧盟主要国家-RGG\",\"enname\":\"DHL_EU_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_YD\",\"cnname\":\"DHL德国FBA-YDP\",\"enname\":\"DHL_FBA_DE_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_YDP\",\"cnname\":\"DHL德国非FBA-YDP\",\"enname\":\"DHL_DE_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_IN\",\"cnname\":\"DHL德国FBA-INTEL\",\"enname\":\"DHL_FBA_DE_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_05\",\"cnname\":\"UPS_WLY_SLHT05\",\"enname\":\"UPS_WLY_SLHT05\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_YDP\",\"cnname\":\"DHL欧盟主要国家-YDP\",\"enname\":\"DHL_EU_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_INT\",\"cnname\":\"DHL德国非FBA-INTEL\",\"enname\":\"DHL_DE_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE_INT\",\"cnname\":\"DPD德国INTEL-0180\",\"enname\":\"DPD德国INTEL-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_SH\",\"cnname\":\"DHL德国FBA-SHOJT\",\"enname\":\"DHL_FBA_DE_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_SHO\",\"cnname\":\"DHL德国非FBA-SHOJT\",\"enname\":\"DHL_DE_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_SHO\",\"cnname\":\"DHL欧盟主要国家-SHOJT\",\"enname\":\"DHL_EU_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE_Ren\",\"cnname\":\"DPD德国0180-Reniox\",\"enname\":\"DPD德国0180-Reniox\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_ron\",\"cnname\":\"UPS德国-rong\",\"enname\":\"UPS德国_609VR9-rong\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_DHL\",\"cnname\":\"DHL-德国20KG及以下非FBA-SLHT\",\"enname\":\"DHL-德国20KG及以下非FBA-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_DH2\",\"cnname\":\"DHL-德国20KG以上非FBA-SLHT\",\"enname\":\"DHL-德国20KG以上非FBA-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_INT\",\"cnname\":\"DHL欧盟主要国家-INTEL\",\"enname\":\"DHL_EU_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_HE\",\"cnname\":\"DHL-德国20KG及以下非FBA-Heliocargo\",\"enname\":\"DHL-德国20KG及以下非FBA-Heliocargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_r\",\"cnname\":\"DHL-德国20KG以上非FBA-RONG\",\"enname\":\"DHL-德国20KG以上非FBA-RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_XINC\",\"cnname\":\"DPD德国XINC-0180\",\"enname\":\"DPD德国XINC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_ouyuan\",\"cnname\":\"UPS_ouyuan-609\",\"enname\":\"UPS_ouyuan-609\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YWXC\",\"cnname\":\"DPD德国YWXC-0180\",\"enname\":\"DPD德国YWXC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_Ouyee\",\"cnname\":\"DPD_Ouyee\",\"enname\":\"DPD_Ouyee\",\"status\":\"0\",\"ifColl\":\"0\"},{\"code\":\"DPD_Desinn\",\"cnname\":\"DPD德国Desinn-0180\",\"enname\":\"DPD德国Desinn-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_Ca\",\"cnname\":\"DHL德国FBA_Cargo\",\"enname\":\"DHL_FBA_DE_Cargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HUAL\",\"cnname\":\"DPD德国HUAL-0180-17026\",\"enname\":\"DPD德国HUAL-0180-17026\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_JD_B2C\",\"cnname\":\"UPS-JD-B2C\",\"enname\":\"UPS_JD-B2C\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RGO\",\"cnname\":\"DHL-德国20KG以上非FBA-Heliocargo\",\"enname\":\"DHL-德国20KG以上非FBA-Heliocargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_ro\",\"cnname\":\"DHL-德国20KG及以下非FBA-RONG\",\"enname\":\"DHL-德国20KG及以下非FBA-RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HQBH\",\"cnname\":\"DPD德国HQBH-0180\",\"enname\":\"DPD德国HQBH-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_CDZ\",\"cnname\":\"UPS德国-CDZZ\",\"enname\":\"UPS德国_609VR9-CDZZ\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YIBO\",\"cnname\":\"DPD德国YIBO-0180\",\"enname\":\"DPD德国YIBO-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_JY\",\"cnname\":\"DPD德国JY-0180\",\"enname\":\"DPD德国JY-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_170\",\"cnname\":\"UPS德国-17026U\",\"enname\":\"UPS德国-17026U\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_YT_01\",\"cnname\":\"UPS_宇腾_01\",\"enname\":\"UPS_宇腾_01\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_0150\",\"cnname\":\"DPD德国0150 Bergheim科隆\",\"enname\":\"DPD德国0150 Bergheim\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_Cargo\",\"cnname\":\"UPS_Cargo-609VR\",\"enname\":\"UPS_Cargo-609VR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_SLHT\",\"cnname\":\"DPD德国SLHT02-0180\",\"enname\":\"DPD德国SLHT02-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_CD\",\"cnname\":\"UPS_WLY_CDZZ02\",\"enname\":\"UPS_WLY_CDZZ02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_rong02\",\"cnname\":\"DPD德国rong02-0180\",\"enname\":\"DPD德国rong02-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_KYTD\",\"cnname\":\"DPD德国KYTD-0180\",\"enname\":\"DPD德国KYTD-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_KYT\",\"cnname\":\"UPS德国_609VR9-KYTD02\",\"enname\":\"UPS德国_609VR9-KYTD02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_zfw\",\"cnname\":\"UPS德国-zfwl\",\"enname\":\"UPS德国_609VR9-zfwl\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_JT\",\"cnname\":\"UPS_WLY_JT02\",\"enname\":\"UPS_WLY_JT02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_SGS\",\"cnname\":\"UPS德国-SGS\",\"enname\":\"UPS德国_609VR9-SGS\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_SG\",\"cnname\":\"UPS_WLY_SGS\",\"enname\":\"UPS_WLY_SGS\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_LB\",\"cnname\":\"DPD德国LB-0180\",\"enname\":\"DPD德国LB-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_KY\",\"cnname\":\"UPS_WLY_KYTD02\",\"enname\":\"UPS_WLY_KYTD02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_KY\",\"cnname\":\"DHL德国FBA-KYTD\",\"enname\":\"DHL_FBA_DE_KYTD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_JT\",\"cnname\":\"DPD德国JT-0180\",\"enname\":\"DPD德国JT-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_JT\",\"cnname\":\"UPS德国_609VR9-JT02\",\"enname\":\"UPS德国_609VR9-JT02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YWHY\",\"cnname\":\"DPD德国YWHY-0180\",\"enname\":\"DPD德国YWHY-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_DM\",\"cnname\":\"DHL德国FBA-MCC\",\"enname\":\"DHL_FBA_DE_MCC\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_JY0\",\"cnname\":\"UPS德国_609VR9-JY02\",\"enname\":\"UPS德国_609VR9-JY02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_JY\",\"cnname\":\"UPS_WLY_JY02\",\"enname\":\"UPS_WLY_JY02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_BetaLo\",\"cnname\":\"DPD德国BetaLogisztika-0180\",\"enname\":\"DPD德国BetaLogisztika-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_zf\",\"cnname\":\"UPS_WLY_zfwl\",\"enname\":\"UPS_WLY_zfwl\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_MCC\",\"cnname\":\"DPD德国MCC-0180\",\"enname\":\"DPD德国MCC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_Be\",\"cnname\":\"DHL德国FBA_BetaLogisztika\",\"enname\":\"DHL_FBA_DE_BetaLogisztika\",\"status\":\"1\",\"ifColl\":\"0\"}]}');
INSERT INTO `eu_express_trans_log` VALUES (30, 'David', '/cancelDelivery', '2025-03-24 14:21:45', 'error', '{\"statusCode\":\"error\",\"message\":\"请检查请求的Json数据格式中是否包含 [Verify] 和 [CorpBillid]字段,注意区分大小写！\"}');
INSERT INTO `eu_express_trans_log` VALUES (31, 'David', '/cancelDelivery', '2025-03-24 14:34:09', 'error', '{\"statusCode\":\"error\",\"corpBillid\":\"EYT5032303309SZ\",\"message\":\"订单号：EYT5032303309SZ，所设置的[DPD德国0180-BetaLogisztika]接口不支持取消发货！\"}');
INSERT INTO `eu_express_trans_log` VALUES (32, 'David', '/printOrderLabel', '2025-03-24 16:23:27', 'success', '{\"statusCode\":\"success\",\"url\":\"https://dtdh.kingtrans.net/upload/eorderlabel/2025-03-23/EYT5032303309SZ//01805114342845_AWB.PDF\",\"perUrl\":[\"https://dtdh.kingtrans.net/upload/eorderlabel/2025-03-23/EYT5032303309SZ//01805114342845_AWB.PDF\"],\"notExistsCorpbillid\":\"\",\"message\":\"\"}');
INSERT INTO `eu_express_trans_log` VALUES (33, 'David', '/printOrderLabel', '2025-03-24 16:38:59', 'success', '{\"statusCode\":\"success\",\"url\":\"https://mall-demo.com/OrderLabel/printLabel.pdf\",\"perUrl\":[\"https://dtdh.kingtrans.net/upload/eorderlabel/2025-03-23/EYT5032303309SZ//01805114342845_AWB.PDF\"],\"notExistsCorpbillid\":\"\",\"message\":\"\"}');
INSERT INTO `eu_express_trans_log` VALUES (34, 'David', '/printOrderLabel', '2025-03-25 14:35:39', 'success', '{\"statusCode\":\"success\",\"url\":\"https://mall-demo.com/OrderLabel/printLabel.pdf\",\"perUrl\":[\"http://dtdh.kingtrans.net/upload/eorderlabel/2025-03-23/EYT5032303309SZ//01805114342845_AWB.PDF\"],\"notExistsCorpbillid\":\"\",\"message\":\"\"}');
INSERT INTO `eu_express_trans_log` VALUES (35, 'David', '/searchStartChannel', '2025-03-25 14:38:19', 'success', '{\"statusCode\":\"success\",\"returnDatas\":[{\"code\":\"UPS_DE\",\"cnname\":\"UPS德国-LCD\",\"enname\":\"UPS德国_609VR9-LCD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_0141\",\"cnname\":\"DPD德国0141仓位-德北\",\"enname\":\"DPD德国0141仓位-德北\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE\",\"cnname\":\"DPD德国0180仓位（德南）\",\"enname\":\"DPD德国0180仓位（德南）\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_NSR\",\"cnname\":\"UPS_NSR\",\"enname\":\"UPS_NSR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_SLHT\",\"cnname\":\"UPS世联互通\",\"enname\":\"UPS德国_SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_DE\",\"cnname\":\"DHL德国FBA-SLHT\",\"enname\":\"DHL_FBA_DE\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY\",\"cnname\":\"UPS_WLY-SLHT\",\"enname\":\"UPS_WLY-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE\",\"cnname\":\"DHL德国非FBA-SLHT\",\"enname\":\"DHL_DE\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU\",\"cnname\":\"DHL欧盟主要国家-SLHT\",\"enname\":\"DHL_EU\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_Jackst\",\"cnname\":\"UPS_Jackstar\",\"enname\":\"UPS_Jackstar\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_GT\",\"cnname\":\"UPS_WLY-GTI\",\"enname\":\"UPS_WLY-GTI\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_ou\",\"cnname\":\"UPS_WLY_ouyuan\",\"enname\":\"UPS_WLY_ouyuan\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_DR\",\"cnname\":\"UPS_WLY_DR\",\"enname\":\"UPS_WLY_DR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_HE\",\"cnname\":\"DHL德国FBA-HELIOCAR\",\"enname\":\"DHL_FBA_DE_HELIOCAR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_HEL\",\"cnname\":\"DHL德国非FBA-HELIOCARGO\",\"enname\":\"DHL_DE_HELIOCARGO\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_HEL\",\"cnname\":\"DHL欧盟主要国家-HELIOCARGO\",\"enname\":\"DHL_EU_HELIOCARGO\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_04\",\"cnname\":\"UPS_WLY_SLHT04\",\"enname\":\"UPS_WLY_SLHT04\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_02\",\"cnname\":\"UPS_WLY_Jackstar\",\"enname\":\"UPS_WLY_Jackstar\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HYC\",\"cnname\":\"DPD德国HYC-0180\",\"enname\":\"DPD德国HYC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_LC\",\"cnname\":\"UPS_WLY_rong\",\"enname\":\"UPS_WLY_rong\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_BS\",\"cnname\":\"UPS_WLY_BSD\",\"enname\":\"UPS_WLY_BSD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_JD\",\"cnname\":\"UPS-JD-FBA\",\"enname\":\"UPS_JD-FBA\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_GTI\",\"cnname\":\"DPD德国GTI-0180\",\"enname\":\"DPD德国GTI-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_HE\",\"cnname\":\"UPS_WLY_HELIOCARGO02\",\"enname\":\"UPS_WLY_HELIOCARGO02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_RO\",\"cnname\":\"DHL德国FBA_RONG\",\"enname\":\"DHL_FBA_DE_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RON\",\"cnname\":\"DHL德国非FBA-RONG\",\"enname\":\"DHL_DE_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_RON\",\"cnname\":\"DHL欧盟主要国家-RONG\",\"enname\":\"DHL_EU_RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_RG\",\"cnname\":\"DHL德国FBA_RGG\",\"enname\":\"DHL_FBA_DE_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RGG\",\"cnname\":\"DHL德国非FBA-RGG\",\"enname\":\"DHL_DE_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_RGG\",\"cnname\":\"DHL欧盟主要国家-RGG\",\"enname\":\"DHL_EU_RGG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_YD\",\"cnname\":\"DHL德国FBA-YDP\",\"enname\":\"DHL_FBA_DE_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_YDP\",\"cnname\":\"DHL德国非FBA-YDP\",\"enname\":\"DHL_DE_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_IN\",\"cnname\":\"DHL德国FBA-INTEL\",\"enname\":\"DHL_FBA_DE_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_05\",\"cnname\":\"UPS_WLY_SLHT05\",\"enname\":\"UPS_WLY_SLHT05\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_YDP\",\"cnname\":\"DHL欧盟主要国家-YDP\",\"enname\":\"DHL_EU_YDP\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_INT\",\"cnname\":\"DHL德国非FBA-INTEL\",\"enname\":\"DHL_DE_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE_INT\",\"cnname\":\"DPD德国INTEL-0180\",\"enname\":\"DPD德国INTEL-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_SH\",\"cnname\":\"DHL德国FBA-SHOJT\",\"enname\":\"DHL_FBA_DE_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_SHO\",\"cnname\":\"DHL德国非FBA-SHOJT\",\"enname\":\"DHL_DE_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_SHO\",\"cnname\":\"DHL欧盟主要国家-SHOJT\",\"enname\":\"DHL_EU_SHOJT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_DE_Ren\",\"cnname\":\"DPD德国0180-Reniox\",\"enname\":\"DPD德国0180-Reniox\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_ron\",\"cnname\":\"UPS德国-rong\",\"enname\":\"UPS德国_609VR9-rong\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_DHL\",\"cnname\":\"DHL-德国20KG及以下非FBA-SLHT\",\"enname\":\"DHL-德国20KG及以下非FBA-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_DH2\",\"cnname\":\"DHL-德国20KG以上非FBA-SLHT\",\"enname\":\"DHL-德国20KG以上非FBA-SLHT\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_EU_INT\",\"cnname\":\"DHL欧盟主要国家-INTEL\",\"enname\":\"DHL_EU_INTEL\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_HE\",\"cnname\":\"DHL-德国20KG及以下非FBA-Heliocargo\",\"enname\":\"DHL-德国20KG及以下非FBA-Heliocargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_r\",\"cnname\":\"DHL-德国20KG以上非FBA-RONG\",\"enname\":\"DHL-德国20KG以上非FBA-RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_XINC\",\"cnname\":\"DPD德国XINC-0180\",\"enname\":\"DPD德国XINC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_ouyuan\",\"cnname\":\"UPS_ouyuan-609\",\"enname\":\"UPS_ouyuan-609\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YWXC\",\"cnname\":\"DPD德国YWXC-0180\",\"enname\":\"DPD德国YWXC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_Ouyee\",\"cnname\":\"DPD_Ouyee\",\"enname\":\"DPD_Ouyee\",\"status\":\"0\",\"ifColl\":\"0\"},{\"code\":\"DPD_Desinn\",\"cnname\":\"DPD德国Desinn-0180\",\"enname\":\"DPD德国Desinn-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_Ca\",\"cnname\":\"DHL德国FBA_Cargo\",\"enname\":\"DHL_FBA_DE_Cargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HUAL\",\"cnname\":\"DPD德国HUAL-0180-17026\",\"enname\":\"DPD德国HUAL-0180-17026\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_JD_B2C\",\"cnname\":\"UPS-JD-B2C\",\"enname\":\"UPS_JD-B2C\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_RGO\",\"cnname\":\"DHL-德国20KG以上非FBA-Heliocargo\",\"enname\":\"DHL-德国20KG以上非FBA-Heliocargo\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_DE_ro\",\"cnname\":\"DHL-德国20KG及以下非FBA-RONG\",\"enname\":\"DHL-德国20KG及以下非FBA-RONG\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_HQBH\",\"cnname\":\"DPD德国HQBH-0180\",\"enname\":\"DPD德国HQBH-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_CDZ\",\"cnname\":\"UPS德国-CDZZ\",\"enname\":\"UPS德国_609VR9-CDZZ\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YIBO\",\"cnname\":\"DPD德国YIBO-0180\",\"enname\":\"DPD德国YIBO-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_JY\",\"cnname\":\"DPD德国JY-0180\",\"enname\":\"DPD德国JY-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_170\",\"cnname\":\"UPS德国-17026U\",\"enname\":\"UPS德国-17026U\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_YT_01\",\"cnname\":\"UPS_宇腾_01\",\"enname\":\"UPS_宇腾_01\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_0150\",\"cnname\":\"DPD德国0150 Bergheim科隆\",\"enname\":\"DPD德国0150 Bergheim\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_Cargo\",\"cnname\":\"UPS_Cargo-609VR\",\"enname\":\"UPS_Cargo-609VR\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_SLHT\",\"cnname\":\"DPD德国SLHT02-0180\",\"enname\":\"DPD德国SLHT02-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_CD\",\"cnname\":\"UPS_WLY_CDZZ02\",\"enname\":\"UPS_WLY_CDZZ02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_rong02\",\"cnname\":\"DPD德国rong02-0180\",\"enname\":\"DPD德国rong02-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_KYTD\",\"cnname\":\"DPD德国KYTD-0180\",\"enname\":\"DPD德国KYTD-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_KYT\",\"cnname\":\"UPS德国_609VR9-KYTD02\",\"enname\":\"UPS德国_609VR9-KYTD02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_zfw\",\"cnname\":\"UPS德国-zfwl\",\"enname\":\"UPS德国_609VR9-zfwl\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_JT\",\"cnname\":\"UPS_WLY_JT02\",\"enname\":\"UPS_WLY_JT02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_SGS\",\"cnname\":\"UPS德国-SGS\",\"enname\":\"UPS德国_609VR9-SGS\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_SG\",\"cnname\":\"UPS_WLY_SGS\",\"enname\":\"UPS_WLY_SGS\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_LB\",\"cnname\":\"DPD德国LB-0180\",\"enname\":\"DPD德国LB-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_KY\",\"cnname\":\"UPS_WLY_KYTD02\",\"enname\":\"UPS_WLY_KYTD02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_KY\",\"cnname\":\"DHL德国FBA-KYTD\",\"enname\":\"DHL_FBA_DE_KYTD\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_JT\",\"cnname\":\"DPD德国JT-0180\",\"enname\":\"DPD德国JT-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_JT\",\"cnname\":\"UPS德国_609VR9-JT02\",\"enname\":\"UPS德国_609VR9-JT02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_YWHY\",\"cnname\":\"DPD德国YWHY-0180\",\"enname\":\"DPD德国YWHY-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_DM\",\"cnname\":\"DHL德国FBA-MCC\",\"enname\":\"DHL_FBA_DE_MCC\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_DE_JY0\",\"cnname\":\"UPS德国_609VR9-JY02\",\"enname\":\"UPS德国_609VR9-JY02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_JY\",\"cnname\":\"UPS_WLY_JY02\",\"enname\":\"UPS_WLY_JY02\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_BetaLo\",\"cnname\":\"DPD德国BetaLogisztika-0180\",\"enname\":\"DPD德国BetaLogisztika-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"UPS_WLY_zf\",\"cnname\":\"UPS_WLY_zfwl\",\"enname\":\"UPS_WLY_zfwl\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DPD_MCC\",\"cnname\":\"DPD德国MCC-0180\",\"enname\":\"DPD德国MCC-0180\",\"status\":\"1\",\"ifColl\":\"0\"},{\"code\":\"DHL_FBA_Be\",\"cnname\":\"DHL德国FBA_BetaLogisztika\",\"enname\":\"DHL_FBA_DE_BetaLogisztika\",\"status\":\"1\",\"ifColl\":\"0\"}]}');

-- ----------------------------
-- Table structure for logistics_records
-- ----------------------------
DROP TABLE IF EXISTS `logistics_records`;
CREATE TABLE `logistics_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `receive_date` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件日期',
  `receive_time` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件时间',
  `waybill_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '运单号',
  `customer_order_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户单号',
  `fw_tracking_number` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转运单号',
  `container_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '柜号',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Pending' COMMENT '状态',
  `logistics_channel` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流渠道名称',
  `loading_port` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '装柜港口',
  `loading_time` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '装柜时间',
  `arrival_port` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卸柜港口',
  `arrival_date` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卸柜时间',
  `target_postcode` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `target_country` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目的地国家',
  `ecommerce_platform` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电商平台',
  `fulfillment_warehouse` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电商仓库',
  `is_remote` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否偏远',
  `ctns` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '箱数',
  `til_pcs` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '件数',
  `net_weight` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实重',
  `gross_weight` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '材重',
  `measurement` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方数',
  `bill_weight` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计费重量',
  `confirmed_bill_weight` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认计费重量',
  `cd_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报关类型',
  `cc_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清关类型',
  `cl_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否整柜',
  `material` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内部备注材料',
  `additional_notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部备注',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `cc_amount` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '总申报货值',
  `problem_item_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题件类型',
  `lading_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提单号',
  `latest_track_notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最新轨迹',
  `track_update_time` timestamp(0) NULL DEFAULT NULL COMMENT '轨迹更新时间',
  `customs_clearance_materials` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清关材料',
  `acceptance_channel_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验收渠道编号',
  `cc_companyno` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '清关公司',
  `fw_logistics_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货运物流单号',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '物流记录主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logistics_records
-- ----------------------------
INSERT INTO `logistics_records` VALUES (2, '2023-05-10', '14:30', 'WH123456789', 'CUST001', 'FW123456789', 'CNTR001', 'In Transit', 'Sea Freight', 'Shanghai', '2023-05-11', 'Los Angeles', '2023-06-20', '90001', 'USA', 'Amazon', 'FBA', 'No', '10', '100', '500', '550', '2.5', '550', '550', 'DDP', 'Commercial', 'LCL', 'Electronics', 'Fragile items', 'Consumer electronics', '5000', NULL, 'BL001', 'Departed Shanghai Port', '2023-05-15 08:00:00', 'Commercial invoice, packing list', 'AC001', 'CC001', 'FWLOG001', '2023-05-10 14:30:00');
INSERT INTO `logistics_records` VALUES (3, NULL, NULL, 'WH987654321', 'CUST002', 'FW987654321', NULL, 'Shipped', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Yes', '5', '25', '120', '130', '1.2', '130', '130', 'DDU', 'Personal', 'FCL', 'Clothing', 'Summer collection', 'Fashion apparel', '1500', NULL, 'BL002', 'Ready for pickup', '2025-03-30 15:47:01', 'Packing list', 'AC002', 'CC002', 'FWLOG002', '2023-05-12 10:15:00');
INSERT INTO `logistics_records` VALUES (4, '2023-05-15', '09:45', 'WH456123789', 'CUST003', 'FW456123789', 'CNTR003', 'Delivered', 'Express', 'Hong Kong', '2023-05-15', 'Sydney', '2023-05-18', '2000', 'Australia', 'Shopify', '3PL Warehouse', 'No', '3', '15', '45', '50', '0.8', '50', '50', 'DAP', 'Commercial', 'LCL', 'Cosmetics', 'Liquid items', 'Beauty products', '800', NULL, 'BL003', 'Delivered to customer', '2023-05-18 14:10:00', 'Commercial invoice, MSDS', 'AC003', 'CC003', 'FWLOG003', '2023-05-15 09:45:00');
INSERT INTO `logistics_records` VALUES (5, '2023-05-18', '16:20', 'WH789123456', 'CUST004', 'FW789123456', 'CNTR004', 'Customs Hold', 'Rail Freight', 'Chengdu', '2023-05-19', 'Hamburg', '2023-06-10', '20095', 'Germany', 'AliExpress', 'Seller Warehouse', 'No', '8', '40', '300', '320', '3.0', '320', '320', 'DDP', 'Commercial', 'FCL', 'Furniture', 'Flat pack', 'Home furniture', '3500', 'Customs Inspection', 'BL004', 'Customs inspection required', '2023-06-11 09:30:00', 'Commercial invoice, packing list, certificate of origin', 'AC004', 'CC004', 'FWLOG004', '2023-05-18 16:20:00');
INSERT INTO `logistics_records` VALUES (8, '2023-05-25', '15:10', 'WH987321654', 'CUST007', 'FW987321654', 'CNTR007', 'Pending', 'Sea Freight', 'Qingdao', '2023-05-26', 'Vancouver', '2023-06-30', 'V6B', 'Canada', 'Shopify', 'Seller Warehouse', 'No', '7', '35', '350', '380', '3.5', '380', '380', 'DAP', 'Personal', 'LCL', 'Sports Equipment', 'Oversized items', 'Fitness gear', '2800', NULL, 'BL007', 'Waiting for customs clearance', '2023-05-25 15:10:00', 'Packing list', 'AC007', 'CC007', 'FWLOG007', '2023-05-25 15:10:00');
INSERT INTO `logistics_records` VALUES (10, '2023-05-30', '14:50', 'WH369258147', 'CUST009', 'FW369258147', 'CNTR009', 'In Transit', 'Rail Freight', 'Chongqing', '2023-05-31', 'Warsaw', '2023-06-15', '00-001', 'Poland', 'Alibaba', '3PL Warehouse', 'Yes', '9', '45', '400', '420', '4.2', '420', '420', 'DDU', 'Commercial', 'LCL', 'Automotive Parts', 'Heavy items', 'Car accessories', '3800', NULL, 'BL009', 'Crossing border', '2023-06-01 12:30:00', 'Commercial invoice, packing list, technical specifications', 'AC009', 'CC009', 'FWLOG009', '2023-05-30 14:50:00');
INSERT INTO `logistics_records` VALUES (11, '2023-06-01', '09:20', 'WH258369147', 'CUST010', 'FW258369147', 'CNTR010', 'At Warehouse', 'Sea Freight', 'Dalian', '2023-06-02', 'Melbourne', '2023-07-10', '3000', 'Australia', 'Amazon', 'FBA', 'No', '15', '150', '700', '750', '5.0', '750', '750', 'DDP', 'Commercial', 'FCL', 'Home Appliances', 'Fragile items', 'Kitchen appliances', '6500', NULL, 'BL010', 'Received at origin warehouse', '2023-06-01 12:45:00', 'Commercial invoice, packing list, warranty cards', 'AC010', 'CC010', 'FWLOG010', '2023-06-01 09:20:00');
INSERT INTO `logistics_records` VALUES (12, '2025-03-29', '2025-03-29 10:00', 'WB123456789', 'ORD12345', 'FW789123', 'CN123456', 'In transit', 'Air Freight', 'Port of Los Angeles', '2025-03-28 14:30', 'Port of Shanghai', '2025-03-30', '100000', 'China', 'Amazon', 'Warehouse A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-30 15:20:14', NULL, NULL, NULL, NULL, '2025-03-30 15:20:14');
INSERT INTO `logistics_records` VALUES (16, NULL, NULL, 'WB123456789', 'CO123456789', 'FW987654321', NULL, 'Shipped', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-30 15:52:39', NULL, NULL, NULL, NULL, '2025-03-30 15:52:39');

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_sku_id` bigint(20) NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '添加到购物车的价格',
  `product_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
INSERT INTO `oms_cart_item` VALUES (12, 26, 90, 1, 1, 3788.00, NULL, '华为 HUAWEI P20', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2018-08-27 16:53:44', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (13, 27, 98, 1, 3, 2699.00, NULL, '小米8', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2018-08-27 17:11:53', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (14, 28, 102, 1, 1, 649.00, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-27 17:18:02', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (15, 28, 103, 1, 1, 699.00, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-28 10:22:45', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (16, 29, 106, 1, 1, 5499.00, NULL, 'Apple iPhone 8 Plus', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2018-08-28 10:50:50', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (19, 36, 163, 1, 3, 100.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 15:51:59', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `oms_cart_item` VALUES (20, 36, 164, 1, 2, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 15:54:23', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_cart_item` VALUES (21, 36, 164, 1, 2, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 16:49:53', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_cart_item` VALUES (22, 26, 110, 1, 3, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 15:34:24', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (23, 27, 98, 1, 7, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 15:35:43', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (24, 26, 110, 1, 4, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 16:58:17', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (25, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 16:58:23', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (26, 28, 102, 1, 4, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2020-05-04 16:58:26', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (27, 29, 106, 1, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2020-05-04 16:58:29', NULL, 1, 19, '苹果', '7437799', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (28, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 17:07:20', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (29, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 17:07:23', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (30, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-04 17:08:14', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (31, 29, 106, 1, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2020-05-04 17:09:56', NULL, 1, 19, '苹果', '7437799', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (32, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 17:13:50', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (33, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-04 17:16:15', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (34, 36, 164, 1, 1, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036002', 'windir', '2020-05-04 17:19:20', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_cart_item` VALUES (35, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 10:41:39', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (36, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-05 10:41:55', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (37, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 10:42:57', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (38, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 14:29:28', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (39, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-05 14:32:52', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (40, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-05 14:33:20', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (41, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-05 14:49:13', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (42, 26, 111, 1, 1, 3999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026002', 'windir', '2020-05-05 15:26:05', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (43, 28, 102, 1, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2020-05-16 15:16:04', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (44, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-16 15:18:00', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (45, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:00:16', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (46, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-17 15:00:22', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (47, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:14:14', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (48, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:20:03', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (49, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 15:21:54', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (50, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 16:07:22', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (51, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-17 16:07:26', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (52, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 19:33:36', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (53, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-17 19:33:39', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (54, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 19:39:07', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (55, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-17 19:41:26', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (56, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-18 16:50:00', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (57, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-18 20:22:04', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (58, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-18 20:22:08', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (59, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-23 16:21:13', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (60, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-05-23 17:01:28', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (61, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-24 09:36:50', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (62, 26, 110, 1, 2, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-05-24 09:44:39', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (63, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-07 17:01:48', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (64, 27, 98, 1, 2, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-14 15:24:40', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (65, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-06-21 14:27:13', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (66, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-21 15:12:14', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (67, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-06-21 15:12:53', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (68, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2020-06-21 15:15:10', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (69, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2020-06-27 10:27:48', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (70, 27, 98, 1, 1, 2699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2022-10-28 14:50:46', NULL, 1, 19, '小米', '7437788', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (71, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 紫色 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-10-28 15:27:32', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (72, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-09 15:14:46', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (73, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-09 15:25:28', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (74, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-09 15:26:04', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (75, 45, 239, 1, 1, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄 3200万前置索尼镜头 5G手机', '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '202211080045001', 'windir', '2022-11-09 16:16:23', NULL, 1, 19, 'OPPO', '10052147850350', '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (76, 45, 239, 1, 1, 2299.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄 3200万前置索尼镜头 5G手机', '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '202211080045001', 'windir', '2022-11-09 16:18:36', NULL, 1, 19, 'OPPO', '10052147850350', '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (77, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量 墨羽 12GB+256GB 5G智能手机 小米 红米', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'windir', '2022-11-10 15:19:36', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (78, 37, 201, 1, 2, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-10 15:19:44', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (79, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-11 15:37:40', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (80, 38, 213, 1, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-11 15:38:12', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (81, 38, 213, 1, 3, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'windir', '2022-11-11 15:38:22', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (82, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-11 16:07:23', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (83, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-11 16:13:11', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (84, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-11 16:15:05', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (85, 28, 102, 1, 1, 649.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2022-11-11 16:21:05', NULL, 1, 19, '小米', '7437789', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (86, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'windir', '2022-11-16 10:22:47', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (87, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'windir', '2022-11-16 10:22:51', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (88, 39, 217, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '202210280039001', 'windir', '2022-11-16 10:22:54', NULL, 1, 54, '小米', '100023207945', '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (89, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'windir', '2022-11-16 10:23:16', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (90, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 15:49:00', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (91, 37, 201, 1, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'test', '2022-12-21 15:49:42', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (92, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'test', '2022-12-21 15:49:53', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (93, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 15:51:03', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (94, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'test', '2022-12-21 15:51:28', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (95, 41, 225, 1, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'test', '2022-12-21 16:45:16', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (96, 40, 221, 1, 2, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 16:46:41', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (97, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-21 16:50:10', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (98, 40, 221, 1, 2, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2022-12-23 09:55:11', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (99, 26, 110, 1, 1, 3788.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'test', '2023-01-10 15:39:03', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (100, 26, 111, 1, 1, 3899.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026002', 'test', '2023-01-10 16:58:08', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_cart_item` VALUES (101, 26, 110, 1, 1, 3699.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20 ', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'test', '2023-01-10 17:10:26', NULL, 1, 19, '华为', '6946605', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_cart_item` VALUES (102, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'member', '2023-05-11 15:24:33', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (103, 41, 225, 11, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'member', '2023-05-11 15:24:37', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (104, 38, 213, 11, 1, 3599.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 'Apple iPad 10.9英寸平板电脑 2022年款', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '202210280038001', 'member', '2023-05-11 15:30:32', NULL, 1, 53, '苹果', '100044025833', '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `oms_cart_item` VALUES (105, 39, 217, 11, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '202210280039001', 'member', '2023-05-11 15:31:38', NULL, 1, 54, '小米', '100023207945', '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (106, 44, 235, 11, 1, 369.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '【满血无缓存！进店抽百元E卡，部分型号白条三期免息】兼具速度与可靠性！读速高达3500MB/s，全功率模式！点击 ', '202211080044001', 'member', '2023-05-11 15:32:16', NULL, 1, 55, '三星', '100018768480', '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `oms_cart_item` VALUES (107, 42, 229, 11, 1, 4999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '【华为Mate50新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！立即抢购！华为新品可持续计划，猛戳》 ', '202211040042001', 'member', '2023-05-11 15:32:44', NULL, 1, 19, '华为', '100035295081', '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (108, 37, 201, 11, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '202210280037001', 'member', '2023-05-11 15:34:32', NULL, 1, 19, '苹果', '100038005189', '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (109, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'member', '2023-05-11 15:35:02', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (110, 41, 225, 11, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'member', '2023-05-11 15:35:21', NULL, 1, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (111, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'member', '2023-05-11 15:36:57', NULL, 1, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (112, 39, 217, 11, 1, 5999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '202210280039001', 'member', '2023-05-11 15:37:04', NULL, 1, 54, '小米', '100023207945', '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `oms_cart_item` VALUES (113, 40, 221, 11, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'member', '2023-05-11 15:37:57', NULL, 0, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (114, 41, 225, 11, 1, 2099.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '202211040041001', 'member', '2023-05-11 15:38:03', NULL, 0, 19, '小米', '100035246702', '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `oms_cart_item` VALUES (115, 40, 221, 1, 1, 2999.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '202211040040001', 'test', '2025-02-14 12:35:36', NULL, 0, 19, '小米', '100027789721', '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址名称',
  `send_status` int(1) NULL DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(1) NULL DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司收发货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
INSERT INTO `oms_company_address` VALUES (1, '深圳发货点', 1, 1, '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (2, '北京发货点', 0, 0, '大梨', '18000000000', '北京市', NULL, '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (3, '南京发货点', 0, 0, '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `order_channel_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单来源',
  `order_type` int(1) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `order_country` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `source_type` int(1) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `sales_channel_id` bigint(20) NULL DEFAULT NULL,
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `payment_time` timestamp(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `delivery_time` timestamp(0) NULL DEFAULT NULL COMMENT '发货时间',
  `bill_type` int(1) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_country` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国家',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_street` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道名称',
  `receiver_street_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '街道号码',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `auto_confirm_day` int(11) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `use_integration` int(11) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `award_integration` int(11) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `award_growth` int(11) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '提交时间',
  `modify_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `confirm_status` int(1) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `receive_time` timestamp(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` timestamp(0) NULL DEFAULT NULL COMMENT '评价时间',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (12, 1, 'test', '201809150101000001', NULL, 0, '', 1, 3742, 18732.00, 16377.75, 20.00, 2344.25, 0.00, 10.00, 10.00, 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '江苏省', '常州市', '天宁区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, 13284, 13284, '2018-09-15 12:24:27', '2019-11-09 16:50:28', 4, 0, 0, NULL, NULL, '111');
INSERT INTO `oms_order` VALUES (13, 1, 'test', '201809150102000002', NULL, 0, '', 1, 3742, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, '2018-10-11 14:04:19', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, 1000, 13284, 13284, '2018-09-15 14:24:29', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (14, 1, 'test', '201809130101000001', NULL, 0, '中国', 1, 2547, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, '2018-10-13 13:44:04', '顺丰快递', '201707196398345', '2018-10-16 13:43:41', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, 13284, 13284, '2018-09-13 16:57:40', NULL, 3, 1, 0, '2022-11-11 16:19:34', NULL, NULL);
INSERT INTO `oms_order` VALUES (15, 1, 'test', '201809130102000002', NULL, 0, '', 1, 2547, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, '2018-10-13 13:44:54', '顺丰快递', '201707196398346', '2018-10-16 13:45:01', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, 13284, 13284, '2018-09-13 17:03:00', NULL, 3, 1, 1, '2018-10-18 14:05:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (16, 1, 'test', '201809140101000001', NULL, 0, '', 1, 3742, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, 13284, 13284, '2018-09-14 16:16:16', NULL, 4, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (17, 1, 'test', '201809150101000003', NULL, 0, '', 1, 1264, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, NULL, '顺丰快递', '201707196398345', '2018-10-12 14:01:28', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, NULL, NULL, '2018-09-15 12:24:27', NULL, 4, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (18, 1, 'test', '201809150102000004', NULL, 0, '', 1, 1264, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, NULL, '圆通快递', 'xx', '2018-10-16 14:42:17', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, 1000, NULL, NULL, '2018-09-15 14:24:29', NULL, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (19, 1, 'test', '201809130101000003', NULL, 0, '', 1, 3742, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, NULL, NULL, '2018-09-13 16:57:40', NULL, 2, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (20, 1, 'test', '201809130102000004', NULL, 0, '', 1, 2547, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, NULL, NULL, '2018-09-13 17:03:00', NULL, 3, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (21, 1, 'test', '201809140101000002', NULL, 0, '', 1, 3742, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, 18682, 18682, '2018-09-14 16:16:16', NULL, 4, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (22, 1, 'test', '201809150101000005', NULL, 0, '', 1, 3742, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, NULL, '顺丰快递', '201707196398345', '2018-10-12 14:01:28', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, 0, 0, '2018-09-15 12:24:27', NULL, 4, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (23, 1, 'test', '201809150102000006', NULL, 0, '', 1, 2547, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, NULL, '顺丰快递', 'xxx', '2018-10-16 14:41:28', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, 1000, 0, 0, '2018-09-15 14:24:29', NULL, 1, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (24, 1, 'test', '201809130101000005', NULL, 0, '', 1, 1264, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, 18682, 18682, '2018-09-13 16:57:40', NULL, 2, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (25, 1, 'test', '201809130102000006', NULL, 0, '', 1, 3742, 18732.00, 16377.75, 10.00, 2344.25, 0.00, 10.00, 5.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨22', '18033441849', '518000', NULL, '北京市', '北京城区', '东城区', NULL, NULL, '东城街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, 18682, 18682, '2018-09-13 17:03:00', '2018-10-30 15:08:31', 4, 0, 1, NULL, NULL, 'xxx');
INSERT INTO `oms_order` VALUES (26, 1, 'test', '201809140101000003', NULL, 0, '', 1, 2547, 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 2, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', 15, NULL, 18682, 18682, '2018-09-14 16:16:16', NULL, 4, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (27, 1, 'test', '202002250100000001', NULL, 0, '', 1, 2547, 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '南山区', NULL, NULL, '科兴科学园', NULL, '无优惠,无优惠', NULL, NULL, 0, 0, '2020-02-25 15:59:20', NULL, 4, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (28, 1, 'test', '202002250100000002', NULL, 0, '', 1, 3742, 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '南山区', NULL, NULL, '科兴科学园', NULL, '无优惠,无优惠', NULL, NULL, 0, 0, '2020-02-25 16:05:47', NULL, 4, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (29, 1, 'test', '202002250100000003', NULL, 0, '', 1, 1264, 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '南山区', NULL, NULL, '科兴科学园', NULL, '无优惠,无优惠', NULL, NULL, 0, 0, '2020-02-25 16:07:58', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (30, 1, 'test', '202002250100000004', NULL, 0, '', 1, 3742, 240.00, 240.00, 20.00, 0.00, 0.00, 0.00, 10.00, 0, '2020-02-25 16:53:29', '顺丰快递', '12333333', '2020-02-25 16:54:03', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '南山区', NULL, NULL, '科兴科学园', NULL, '无优惠', NULL, NULL, 0, 0, '2020-02-25 16:50:13', '2020-02-25 16:52:51', 3, 1, 0, '2020-05-17 19:38:15', NULL, NULL);
INSERT INTO `oms_order` VALUES (31, 1, 'test', '202005160100000001', NULL, 0, '', 1, 2547, 13623.00, 11842.40, 0.00, 1629.60, 1.00, 150.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 26, '满减优惠：满5000.00元，减500.00元;打折优惠：满2件，打8.00折;满减优惠：满500.00元，减50.00元', 15, NULL, 13623, 13623, '2020-05-16 15:16:54', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (32, 1, 'test', '202005170100000001', NULL, 0, '', 1, 3742, 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, '2020-05-17 15:33:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满3000.00元，减300.00元;无优惠', 15, NULL, 6487, 6487, '2020-05-17 15:00:38', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (33, 1, 'test', '202005170100000002', NULL, 0, '', 1, 1264, 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满3000.00元，减300.00元', 15, NULL, 3788, 3788, '2020-05-17 15:14:18', NULL, 4, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (34, 1, 'test', '202005170100000003', NULL, 0, '', 1, 1264, 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满3000.00元，减300.00元', 15, NULL, 3788, 3788, '2020-05-17 15:20:10', NULL, 4, 0, 1, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (35, 1, 'test', '202005170100000004', NULL, 0, '', 1, 2547, 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, '2020-05-17 15:29:07', '顺丰快递', '123', '2020-05-17 15:30:24', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满3000.00元，减300.00元', 15, NULL, 3788, 3788, '2020-05-17 15:22:03', NULL, 3, 1, 0, '2020-05-17 15:41:45', NULL, NULL);
INSERT INTO `oms_order` VALUES (36, 1, 'test', '202005170100000005', NULL, 0, '', 1, 2547, 10275.00, 9775.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满5000.00元，减500.00元;无优惠', 15, NULL, 10275, 10275, '2020-05-17 16:59:26', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (37, 1, 'test', '202005170100000006', NULL, 0, '', 1, 3742, 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, '2020-05-17 19:33:59', '顺丰快递', 'aadd', '2020-05-17 19:34:59', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满3000.00元，减300.00元;无优惠', 15, NULL, 6487, 6487, '2020-05-17 19:33:48', NULL, 3, 1, 0, '2020-05-17 19:35:50', NULL, NULL);
INSERT INTO `oms_order` VALUES (38, 1, 'test', '202005170100000007', NULL, 0, '', 1, 3742, 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满3000.00元，减300.00元', 15, NULL, 3788, 3788, '2020-05-17 19:39:10', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (39, 1, 'test', '202005170100000008', NULL, 0, '', 1, 2547, 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, '2020-05-17 19:41:41', '顺丰快递', 'sdf', '2020-05-17 19:42:07', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满3000.00元，减300.00元', 15, NULL, 3788, 3788, '2020-05-17 19:41:30', NULL, 3, 1, 1, '2020-05-17 19:42:36', NULL, NULL);
INSERT INTO `oms_order` VALUES (40, 1, 'test', '202005180100000001', NULL, 0, '', 1, 2547, 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, '2020-05-18 16:50:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满3000.00元，减300.00元', 15, NULL, 3788, 3788, '2020-05-18 16:50:03', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (41, 1, 'test', '202005180100000002', NULL, 0, '', 1, 3742, 6487.00, 6037.00, 0.00, 300.00, 0.00, 150.00, 0.00, 1, '2020-05-18 20:22:29', '顺丰快递', '12313', '2020-05-18 20:23:03', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '清水河街道', 26, '满减优惠：满3000.00元，减300.00元;无优惠', 15, NULL, 6487, 6487, '2020-05-18 20:22:24', NULL, 3, 1, 0, '2020-05-18 20:23:20', NULL, NULL);
INSERT INTO `oms_order` VALUES (42, 1, 'test', '202005230100000001', NULL, 0, '', 1, 2547, 5398.00, 4318.40, 0.00, 1079.60, 0.00, 0.00, 0.00, 2, '2020-05-23 16:21:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '清水河街道', NULL, '打折优惠：满2件，打8.00折', 15, NULL, 5398, 5398, '2020-05-23 16:21:27', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (43, 1, 'test', '202005230100000002', NULL, 0, '', 1, 3742, 5398.00, 4318.40, 0.00, 1079.60, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '打折优惠：满2件，打8.00折', 15, NULL, 5398, 5398, '2020-05-23 17:01:33', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (44, 1, 'test', '202005240100000001', NULL, 0, '', 1, 2547, 7576.00, 7076.00, 0.00, 500.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满5000.00元，减500.00元', 15, NULL, 7576, 7576, '2020-05-24 09:37:07', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (45, 1, 'test', '202006070100000001', NULL, 0, '', 1, 1264, 10275.00, 9674.90, 0.00, 500.00, 0.00, 100.10, 0.00, 1, '2020-06-07 17:02:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '清水河街道', 25, '满减优惠：满5000.00元，减500.00元;无优惠', 15, NULL, 10275, 10275, '2020-06-07 17:02:04', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (46, 1, 'test', '202006210100000001', NULL, 0, '', 1, 1264, 9186.00, 7796.40, 0.00, 1379.60, 0.00, 10.00, 0.00, 2, '2020-06-21 14:27:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 24, '满减优惠：满3000.00元，减300.00元;打折优惠：满2件，打8.00折', 15, NULL, 9186, 9186, '2020-06-21 14:27:34', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (47, 1, 'test', '202006210100000002', NULL, 0, '', 1, 3742, 6487.00, 6187.00, 0.00, 300.00, 0.00, 0.00, 0.00, 1, '2020-06-21 15:13:12', '顺丰快递', '123131', '2020-06-21 15:13:44', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '清水河街道', NULL, '满减优惠：满3000.00元，减300.00元;无优惠', 15, NULL, 6487, 6487, '2020-06-21 15:13:06', NULL, 3, 1, 0, '2020-06-21 15:13:58', NULL, NULL);
INSERT INTO `oms_order` VALUES (48, 1, 'test', '202006210100000003', NULL, 0, '', 1, 3742, 3788.00, 3338.00, 0.00, 300.00, 0.00, 150.00, 0.00, 2, '2020-06-21 15:15:20', '圆通快递', '12313', '2020-06-21 15:15:48', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 26, '满减优惠：满3000.00元，减300.00元', 15, NULL, 3788, 3788, '2020-06-21 15:15:18', NULL, 3, 1, 0, '2020-06-21 15:15:58', NULL, NULL);
INSERT INTO `oms_order` VALUES (49, 1, 'test', '202006270100000001', NULL, 0, '', 1, 1264, 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2020-06-27 10:27:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '清水河街道', NULL, '无优惠', 15, NULL, 2699, 2699, '2020-06-27 10:27:56', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (50, 1, 'test', '202210280100000001', NULL, 0, '', 1, 2547, 2699.00, 2699.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2022-10-28 14:51:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '清水河街道', NULL, '无优惠', 15, NULL, 2699, 2699, '2022-10-28 14:50:58', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (51, 1, 'test', '202210280100000002', NULL, 0, '', 1, 3742, 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2022-10-28 15:27:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2022-10-28 15:27:41', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (52, 1, 'test', '202211090100000001', NULL, 0, '', 1, 1264, 2999.00, 2799.00, 0.00, 0.00, 0.00, 200.00, 0.00, 2, '2022-11-09 15:15:00', '顺丰快递', '1233', '2022-11-09 15:16:12', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 30, '无优惠', 15, NULL, 0, 0, '2022-11-09 15:14:58', NULL, 3, 1, 0, '2022-11-09 15:16:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (53, 1, 'test', '202211090100000002', NULL, 0, '', 1, 3742, 3599.00, 3589.00, 0.00, 0.00, 0.00, 10.00, 0.00, 2, '2022-11-09 15:25:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 27, '无优惠', 15, NULL, 0, 0, '2022-11-09 15:25:38', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (54, 1, 'test', '202211090100000003', NULL, 0, '', 1, 1264, 5999.00, 5399.00, 0.00, 0.00, 0.00, 600.00, 0.00, 2, '2022-11-09 15:26:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 29, '无优惠', 15, NULL, 0, 0, '2022-11-09 15:26:11', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (55, 1, 'test', '202211100100000001', NULL, 0, '', 1, 1264, 11998.00, 11998.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2022-11-10 16:57:59', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (56, 1, 'test', '202211110100000001', NULL, 0, '', 1, 3742, 2999.00, 2899.00, 0.00, 0.00, 0.00, 100.00, 0.00, 2, '2022-11-11 16:12:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 28, '无优惠', 15, NULL, 0, 0, '2022-11-11 16:12:42', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (57, 1, 'test', '202211110100000002', NULL, 0, '', 1, 2547, 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2022-11-11 16:13:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2022-11-11 16:13:14', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (58, 1, 'test', '202211110100000003', NULL, 0, '', 1, 3742, 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2022-11-11 16:17:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2022-11-11 16:15:08', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (59, 1, 'test', '202211110100000004', NULL, 0, '', 1, 2547, 649.00, 599.00, 0.00, 50.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满500.00元，减50.00元', 15, NULL, 649, 649, '2022-11-11 16:21:12', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (60, 1, 'test', '202211160100000001', NULL, 0, '', 1, 3742, 11097.00, 11097.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2022-11-16 10:37:25', '顺丰快递', '1234555', '2022-11-16 10:42:50', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠;无优惠;无优惠', 15, NULL, 0, 0, '2022-11-16 10:36:08', NULL, 3, 1, 0, '2022-11-16 10:44:40', NULL, NULL);
INSERT INTO `oms_order` VALUES (61, 1, 'test', '202212210100000001', NULL, 0, '', 1, 3742, 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2022-12-21 15:49:08', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (62, 1, 'test', '202212210100000002', NULL, 0, '', 1, 1264, 8098.00, 8098.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2022-12-21 15:50:00', '顺丰快递', 'SDFERR7845', '2022-12-21 15:50:23', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠;无优惠', 15, NULL, 0, 0, '2022-12-21 15:49:57', NULL, 3, 1, 0, '2022-12-21 15:50:33', NULL, NULL);
INSERT INTO `oms_order` VALUES (63, 1, 'test', '202212210100000003', NULL, 0, '', 1, 3742, 2999.00, 2999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2022-12-21 15:51:11', '顺丰快递', '112', '2023-01-10 10:14:12', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2022-12-21 15:51:09', NULL, 2, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (64, 1, 'test', '202212210100000004', NULL, 0, '', 1, 2547, 2099.00, 2099.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2022-12-21 15:51:35', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (65, 1, 'test', '202212210100000005', NULL, 0, '', 1, 1264, 5098.00, 4788.00, 0.00, 200.00, 10.00, 100.00, 0.00, 2, '2022-12-21 16:53:58', '圆通快递', '115', '2023-01-10 10:14:12', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 28, '满减优惠：满2000.00元，减200.00元;无优惠', 15, NULL, 0, 0, '2022-12-21 16:53:07', NULL, 2, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (66, 1, 'test', '202301100100000001', NULL, 0, '', 1, 3742, 5998.00, 5798.00, 0.00, 200.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满2000.00元，减200.00元', 15, NULL, 0, 0, '2023-01-10 15:34:59', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (67, 1, 'test', '202301100100000002', NULL, 0, '', 1, 3742, 3788.00, 3488.00, 0.00, 300.00, 0.00, 0.00, 0.00, 2, '2023-01-10 15:39:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满3000.00元，减300.00元', 15, NULL, 3788, 3788, '2023-01-10 15:39:07', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (68, 1, 'test', '202301100100000003', NULL, 0, '', 1, 1264, 3999.00, 3899.00, 0.00, 100.00, 0.00, 0.00, 0.00, 2, '2023-01-10 16:58:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '单品促销', 15, NULL, 3788, 3788, '2023-01-10 16:58:19', NULL, 1, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (69, 11, 'member', '202305110100000001', NULL, 0, '', 1, 3742, 5098.00, 4698.00, 0.00, 200.00, 0.00, 200.00, 0.00, 2, '2023-05-11 15:28:59', '顺丰快递', '1231313', '2023-05-11 15:30:08', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 30, '满减优惠：满2000.00元，减200.00元;无优惠', 15, NULL, 0, 0, '2023-05-11 15:28:56', NULL, 3, 1, 0, '2023-05-11 15:30:16', NULL, NULL);
INSERT INTO `oms_order` VALUES (70, 11, 'member', '202305110100000002', NULL, 0, '', 1, 2547, 3599.00, 3599.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2023-05-11 15:30:40', '顺丰快递', '232342', '2023-05-11 15:31:22', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2023-05-11 15:30:36', NULL, 3, 1, 0, '2023-05-11 15:31:30', NULL, NULL);
INSERT INTO `oms_order` VALUES (71, 11, 'member', '202305110100000003', NULL, 0, '', 1, 3742, 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2023-05-11 15:31:55', NULL, 4, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (72, 11, 'member', '202305110100000004', NULL, 0, '', 1, 3742, 5368.00, 5368.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2023-05-11 15:33:21', '圆通快递', '1231434', '2023-05-11 15:33:43', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠;无优惠', 15, NULL, 0, 0, '2023-05-11 15:33:13', NULL, 2, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (73, 11, 'member', '202305110100000005', NULL, 0, '', 1, 3742, 5999.00, 5999.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2023-05-11 15:34:39', NULL, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (74, 11, 'member', '202305110100000006', NULL, 0, '', 1, 3742, 2999.00, 2799.00, 0.00, 200.00, 0.00, 0.00, 0.00, 2, '2023-05-11 15:35:08', '顺丰快递', '123131', '2023-05-11 15:36:00', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '满减优惠：满2000.00元，减200.00元', 15, NULL, 0, 0, '2023-05-11 15:35:05', NULL, 2, 0, 0, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (75, 11, 'member', '202305110100000007', NULL, 0, '', 1, 1264, 2099.00, 2099.00, 0.00, 0.00, 0.00, 0.00, 0.00, 2, '2023-05-11 15:35:26', '顺丰快递', '123131311', '2023-05-11 15:36:11', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', NULL, '无优惠', 15, NULL, 0, 0, '2023-05-11 15:35:24', NULL, 3, 1, 0, '2023-05-11 15:36:34', NULL, NULL);
INSERT INTO `oms_order` VALUES (76, 11, 'member', '202305110100000008', NULL, 0, '', 1, 1264, 8998.00, 8698.00, 0.00, 200.00, 0.00, 100.00, 0.00, 2, '2023-05-11 15:37:18', '顺丰快递', '1231313', '2023-05-11 15:37:33', NULL, NULL, NULL, NULL, NULL, '小李', '18961511111', '518000', NULL, '广东省', '深圳市', '福田区', NULL, NULL, '东晓街道', 28, '无优惠;满减优惠：满2000.00元，减200.00元', 15, NULL, 0, 0, '2023-05-11 15:37:16', NULL, 3, 1, 0, '2023-05-11 15:37:48', NULL, NULL);
INSERT INTO `oms_order` VALUES (77, 1, 'test_user', '202502180001', NULL, NULL, NULL, NULL, NULL, NULL, 199.99, 10.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '张三', '13800138000', '100000', NULL, '北京市', '北京市', NULL, NULL, NULL, '朝阳区建国路1号', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 15:03:22', '2025-02-18 15:03:22', 0, 0, 0, NULL, NULL, '尽快发货');
INSERT INTO `oms_order` VALUES (82, 1, 'test_user', '202502180002', NULL, NULL, NULL, NULL, 3742, NULL, 199.99, 10.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '张三', '13800138000', '100000', NULL, '北京市', '北京市', NULL, NULL, NULL, '朝阳区建国路1号', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 15:48:44', '2025-02-18 15:48:44', 0, 0, 0, NULL, NULL, '尽快发货');
INSERT INTO `oms_order` VALUES (83, 1, 'test_user', '202502180003', NULL, NULL, NULL, NULL, 3742, NULL, 349.97, 15.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李四', '13900139000', '200000', NULL, '上海市', '北京市', NULL, NULL, NULL, '浦东新区张杨路123号', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 16:39:12', '2025-02-19 11:56:50', 6, 0, 0, NULL, NULL, '请尽快发货，谢谢！');
INSERT INTO `oms_order` VALUES (84, 1, 'test_user', '202502180004', NULL, NULL, NULL, NULL, 3742, NULL, 349.97, 15.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李四', '13900139000', '200000', NULL, '上海市', '北京市', NULL, NULL, NULL, '浦东新区张杨路123号', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-18 17:00:13', '2025-02-19 11:56:50', 5, 0, 0, NULL, NULL, '请尽快发货，谢谢！');
INSERT INTO `oms_order` VALUES (85, 1, 'test_user', '202502180002', NULL, NULL, NULL, NULL, 3742, NULL, 349.97, 15.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李四', '13900139000', '200000', NULL, '上海市', '上海市', NULL, NULL, NULL, '浦东新区张杨路123号', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-25 16:54:08', '2025-02-25 16:54:08', 0, 0, 0, NULL, NULL, '请尽快发货，谢谢！');
INSERT INTO `oms_order` VALUES (96, 1, 'test_user', '202502180002', NULL, NULL, NULL, NULL, 3367, NULL, 349.97, 15.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李四', '13900139000', '200000', NULL, '上海市', '上海市', NULL, NULL, NULL, '浦东新区张杨路123号', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 09:39:54', '2025-02-26 09:39:54', 0, 0, 0, NULL, NULL, '请尽快发货，谢谢！');
INSERT INTO `oms_order` VALUES (97, 1, 'test_user', '202502180002', NULL, NULL, NULL, NULL, 3367, NULL, 349.97, 15.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李四', '13900139000', '200000', 'GB', '上海市', '上海市', NULL, NULL, NULL, '浦东新区张杨路123号', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 09:59:17', '2025-02-26 09:59:17', 0, 0, 0, NULL, NULL, '请尽快发货，谢谢！');
INSERT INTO `oms_order` VALUES (100, 1, 'test_user', '202502180002', NULL, NULL, NULL, NULL, NULL, NULL, 349.97, 15.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李四', '13900139000', '200000', 'FR', '上海市', '上海市', NULL, NULL, NULL, '浦东新区张杨路123号', NULL, NULL, NULL, NULL, NULL, NULL, '2025-02-26 10:49:05', '2025-02-26 10:49:05', 0, 0, 0, NULL, NULL, '请尽快发货，谢谢！');
INSERT INTO `oms_order` VALUES (125, NULL, 'john_doe_2024', '202403010001', NULL, NULL, '英国', NULL, NULL, NULL, 3009.00, 10.00, NULL, NULL, NULL, NULL, NULL, '2024-03-01 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '张三', '13800138000', '518000', 'GB', NULL, '深圳市', NULL, NULL, NULL, '腾讯大厦15层1502室', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-05 16:59:21', '2025-03-05 16:59:21', 0, 0, 0, NULL, NULL, '请尽快发货，谢谢！');
INSERT INTO `oms_order` VALUES (127, NULL, 'john_doe_2024', '202403010001', NULL, NULL, '法国', NULL, NULL, NULL, 3009.00, 10.00, NULL, NULL, NULL, NULL, NULL, '2024-03-01 18:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '张三', '13800138000', '518000', 'FR', NULL, '深圳市', NULL, NULL, NULL, '腾讯大厦15层1502室', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-07 14:06:08', '2025-03-07 14:06:08', 0, 0, 0, NULL, NULL, '请尽快发货，谢谢！');
INSERT INTO `oms_order` VALUES (130, NULL, 'john_doe_2024', '202403010031', 'Tmall', NULL, NULL, NULL, NULL, NULL, 3009.00, 10.00, NULL, NULL, NULL, NULL, NULL, '2024-03-01 10:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '张三', '13800138000', '518000', '中国', NULL, '深圳市', NULL, '科技园路', '123号', '腾讯大厦15层1502室', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-19 13:50:34', '2025-03-19 13:50:34', 0, 0, 0, NULL, NULL, '请尽快发货，谢谢！');
INSERT INTO `oms_order` VALUES (145, NULL, 'john_doe_2024', '202403010831', 'Tmall', NULL, NULL, NULL, NULL, NULL, 3009.00, 10.00, NULL, NULL, NULL, NULL, NULL, '2024-03-01 10:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '张三', '13800138000', '518000', '中国', NULL, '深圳市', NULL, '科技园路', '123号', '腾讯大厦15层1502室', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-19 15:34:04', '2025-03-19 15:34:04', 0, 0, 0, NULL, NULL, '请尽快发货，谢谢！');
INSERT INTO `oms_order` VALUES (148, NULL, 'john_doe_2024', '202403010031', 'Tmall', NULL, NULL, NULL, NULL, NULL, 3009.00, 10.00, NULL, NULL, NULL, NULL, NULL, '2024-03-01 10:30:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '张三', '13800138000', '518000', '中国', NULL, '深圳市', NULL, '科技园路', '123号', '腾讯大厦15层1502室', NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-19 15:55:57', '2025-03-19 15:55:57', 0, 0, 0, NULL, NULL, '请尽快发货，谢谢！');

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parcel_id` bigint(11) NULL DEFAULT NULL COMMENT '包裹ID',
  `item_status` int(1) NULL DEFAULT NULL COMMENT '订单项状态',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库ID',
  `location` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  `product_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品备注',
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) NULL DEFAULT 0,
  `gift_growth` int(11) NULL DEFAULT 0,
  `delete_status` int(1) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单中所包含的商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES (21, 5050, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 90, '华为 HUAWEI P20', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, 0);
INSERT INTO `oms_order_item` VALUES (22, 2440, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8', '7437788', NULL, 2699.00, 3, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, 0);
INSERT INTO `oms_order_item` VALUES (23, 7046, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 102, '红米5A', '7437789', NULL, 649.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, 0);
INSERT INTO `oms_order_item` VALUES (24, 7046, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 103, '红米5A', '7437789', NULL, 699.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, 0);
INSERT INTO `oms_order_item` VALUES (25, 2440, NULL, 3, '英国', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 106, 'Apple iPhone 8 Plus', '7437799', NULL, 5499.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, 0);
INSERT INTO `oms_order_item` VALUES (26, 8321, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 90, '华为 HUAWEI P20', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, 0);
INSERT INTO `oms_order_item` VALUES (27, 6377, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8', '7437788', NULL, 2699.00, 3, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, 0);
INSERT INTO `oms_order_item` VALUES (28, 6918, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 102, '红米5A', '7437789', NULL, 649.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, 0);
INSERT INTO `oms_order_item` VALUES (29, 6918, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 103, '红米5A', '7437789', NULL, 699.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, 0);
INSERT INTO `oms_order_item` VALUES (30, 6377, NULL, 3, '英国', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 106, 'Apple iPhone 8 Plus', '7437799', NULL, 5499.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, 0);
INSERT INTO `oms_order_item` VALUES (31, 6316, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 90, '华为 HUAWEI P20', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, 0);
INSERT INTO `oms_order_item` VALUES (32, 1966, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8', '7437788', NULL, 2699.00, 3, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, 0);
INSERT INTO `oms_order_item` VALUES (33, 882, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 102, '红米5A', '7437789', NULL, 649.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, 0);
INSERT INTO `oms_order_item` VALUES (34, 882, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 103, '红米5A', '7437789', NULL, 699.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, 0);
INSERT INTO `oms_order_item` VALUES (35, 1966, NULL, 3, '英国', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 106, 'Apple iPhone 8 Plus', '7437799', NULL, 5499.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, 0);
INSERT INTO `oms_order_item` VALUES (36, 3967, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 90, '华为 HUAWEI P20', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, 0);
INSERT INTO `oms_order_item` VALUES (37, 137, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8', '7437788', NULL, 2699.00, 3, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, 0);
INSERT INTO `oms_order_item` VALUES (38, 8786, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 102, '红米5A', '7437789', NULL, 649.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, 0);
INSERT INTO `oms_order_item` VALUES (39, 8786, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 103, '红米5A', '7437789', NULL, 699.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, 0);
INSERT INTO `oms_order_item` VALUES (40, 137, NULL, 3, '英国', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 106, 'Apple iPhone 8 Plus', '7437799', NULL, 5499.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, 0);
INSERT INTO `oms_order_item` VALUES (41, 5593, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 90, '华为 HUAWEI P20', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, 0);
INSERT INTO `oms_order_item` VALUES (42, 4278, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8', '7437788', NULL, 2699.00, 3, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, 0);
INSERT INTO `oms_order_item` VALUES (43, 4609, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 102, '红米5A', '7437789', NULL, 649.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, 0);
INSERT INTO `oms_order_item` VALUES (44, 4609, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 103, '红米5A', '7437789', NULL, 699.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, 0);
INSERT INTO `oms_order_item` VALUES (45, 4278, NULL, 3, '英国', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 106, 'Apple iPhone 8 Plus', '7437799', NULL, 5499.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, 0);
INSERT INTO `oms_order_item` VALUES (46, 5515, NULL, 1, '中国', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 163, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '6799345', NULL, 100.00, 3, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (47, 5515, NULL, 1, '中国', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 164, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '6799345', NULL, 120.00, 2, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (48, 2872, NULL, 1, '中国', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 163, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '6799345', NULL, 100.00, 3, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (49, 2872, NULL, 1, '中国', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 164, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '6799345', NULL, 120.00, 2, NULL, NULL, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (50, 4929, NULL, 1, '中国', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 163, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '6799345', NULL, 100.00, 3, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (51, 4929, NULL, 1, '中国', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 164, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '6799345', NULL, 120.00, 2, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (52, 7804, NULL, 1, '中国', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', 164, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '6799345', NULL, 120.00, 2, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (53, 5462, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 2, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满5000.00元，减500.00元', 250.00, 75.00, 0.28, 3462.72, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (54, 3901, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 2, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.20, 2159.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (55, 3117, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 102, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '7437789', NULL, 649.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.05, 598.95, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (56, 3883, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (57, 64, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (58, 8668, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (59, 3149, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (60, 9741, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (61, 9256, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 2, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满5000.00元，减500.00元', 250.00, 0.00, 0.00, 3538.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (62, 7059, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (63, 7526, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (64, 6452, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (65, 9683, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (66, 9057, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (67, 6238, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (68, 4017, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 150.00, 0.00, 3338.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (69, 1369, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (70, 4793, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 2, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2159.20, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (71, 9857, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 2, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '打折优惠：满2件，打8.00折', 539.80, 0.00, 0.00, 2159.20, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (72, 4908, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 2, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满5000.00元，减500.00元', 250.00, 0.00, 0.00, 3538.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (73, 4969, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 2, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满5000.00元，减500.00元', 250.00, 36.90, 0.00, 3501.10, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (74, 121, 4, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 26.30, 0.00, 2672.70, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (75, 5695, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 4.12, 0.00, 3483.88, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (76, 8112, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 2, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '打折优惠：满2件，打8.00折', 539.80, 2.94, 0.00, 2156.26, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (77, 3477, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (78, 3047, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (79, 4803, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 150.00, 0.00, 3338.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (80, 4873, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (81, 9955, NULL, 3, '英国', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', 98, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788', NULL, 2699.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2699.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (82, 5158, NULL, 4, '法国', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 201, 'Apple iPhone 14 (A2884) 128GB 紫色 支持移动联通电信5G 双卡双待手机', '100038005189', NULL, 5999.00, 1, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (83, 5921, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '100027789721', NULL, 2999.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 200.00, 0.00, 2799.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (84, 4133, NULL, 1, '中国', 38, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 213, 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', '100044025833', NULL, 3599.00, 1, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]', NULL, '无优惠', 0.00, 10.00, 0.00, 3589.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (85, 2900, NULL, 4, '法国', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 201, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '100038005189', NULL, 5999.00, 1, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 600.00, 0.00, 5399.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (86, 2102, NULL, 4, '法国', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 201, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '100038005189', NULL, 5999.00, 2, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (87, 1810, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '100027789721', NULL, 2999.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 100.00, 0.00, 2899.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (88, 2741, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '100027789721', NULL, 2999.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (89, 8277, NULL, 4, '法国', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 201, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '100038005189', NULL, 5999.00, 1, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (90, 3161, NULL, 4, '法国', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', 102, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '7437789', NULL, 649.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满500.00元，减50.00元', 50.00, 0.00, 0.00, 599.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (91, 975, NULL, 4, '法国', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 201, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '100038005189', NULL, 5999.00, 1, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (92, 5391, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '100027789721', NULL, 2999.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (93, 4030, NULL, 2, '中国', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 225, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '100035246702', NULL, 2099.00, 1, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (94, 3976, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '100027789721', NULL, 2999.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (95, 7790, NULL, 4, '法国', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 201, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '100038005189', NULL, 5999.00, 1, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (96, 7021, NULL, 2, '中国', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 225, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '100035246702', NULL, 2099.00, 1, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (97, 1736, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '100027789721', NULL, 2999.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (98, 7615, NULL, 2, '中国', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 225, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '100035246702', NULL, 2099.00, 1, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (99, 2869, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '100027789721', NULL, 2999.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '满减优惠：满2000.00元，减200.00元', 200.00, 58.80, 5.88, 2734.32, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (100, 1496, NULL, 2, '中国', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 225, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '100035246702', NULL, 2099.00, 1, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 41.20, 4.12, 2053.68, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (101, 8874, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '100027789721', NULL, 2999.00, 2, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '满减优惠：满2000.00元，减200.00元', 100.00, 0.00, 0.00, 2899.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (102, 9883, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 110, '华为 HUAWEI P20 ', '6946605', NULL, 3788.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]', NULL, '满减优惠：满3000.00元，减300.00元', 300.00, 0.00, 0.00, 3488.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (103, 2792, NULL, 1, '中国', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 111, '华为 HUAWEI P20 ', '6946605', NULL, 3999.00, 1, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]', NULL, '单品促销', 100.00, 0.00, 0.00, 3899.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (104, 4310, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '100027789721', NULL, 2999.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '满减优惠：满2000.00元，减200.00元', 200.00, 117.60, 0.00, 2681.40, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (105, 3172, NULL, 2, '中国', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 225, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '100035246702', NULL, 2099.00, 1, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 82.40, 0.00, 2016.60, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (106, 2929, NULL, 1, '中国', 38, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', 213, 'Apple iPad 10.9英寸平板电脑 2022年款', '100044025833', NULL, 3599.00, 1, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 3599.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (107, 5129, NULL, 5, '德国', 39, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', 217, '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '100023207945', NULL, 5999.00, 1, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (108, 6858, NULL, 4, '法国', 42, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', 229, 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', '100035295081', NULL, 4999.00, 1, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 4999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (109, 6858, NULL, 4, '法国', 44, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', 235, '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', '100018768480', NULL, 369.00, 1, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 369.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (110, 3939, NULL, 4, '法国', 37, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', 201, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '100038005189', NULL, 5999.00, 1, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (111, 2987, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '100027789721', NULL, 2999.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '满减优惠：满2000.00元，减200.00元', 200.00, 0.00, 0.00, 2799.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (112, 3118, NULL, 2, '中国', 41, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', 225, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', '100035246702', NULL, 2099.00, 1, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 2099.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (113, 6628, NULL, 5, '德国', 39, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', 217, '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', '100023207945', NULL, 5999.00, 1, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]', NULL, '无优惠', 0.00, 0.00, 0.00, 5999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (114, 3786, NULL, 3, '英国', 40, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', 221, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', '100027789721', NULL, 2999.00, 1, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]', NULL, '满减优惠：满2000.00元，减200.00元', 200.00, 100.00, 0.00, 2699.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '智能手表', 'PROD987654', NULL, 79.99, 2, NULL, NULL, NULL, NULL, NULL, NULL, 159.98, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '蓝牙耳机', 'PROD123789', NULL, 169.99, 1, NULL, NULL, NULL, NULL, NULL, NULL, 169.99, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PROD987654', NULL, 79.99, 2, NULL, NULL, NULL, NULL, NULL, NULL, 159.98, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PROD123789', NULL, 169.99, 1, NULL, NULL, NULL, NULL, NULL, NULL, 169.99, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PROD987654', NULL, 79.99, 2, NULL, NULL, NULL, NULL, NULL, NULL, 159.98, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PROD123789', NULL, 169.99, 1, NULL, NULL, NULL, NULL, NULL, NULL, 169.99, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7437788', NULL, 79.99, 2, NULL, NULL, NULL, NULL, NULL, NULL, 159.98, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6946605', NULL, 169.99, 1, NULL, NULL, NULL, NULL, NULL, NULL, 169.99, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6946605', NULL, 169.99, 1, NULL, NULL, NULL, NULL, NULL, NULL, 169.99, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7437788', NULL, 79.99, 2, NULL, NULL, NULL, NULL, NULL, NULL, 159.98, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6946605', NULL, 169.99, 1, NULL, NULL, NULL, NULL, NULL, NULL, 169.99, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7437788', NULL, 79.99, 2, NULL, NULL, NULL, NULL, NULL, NULL, 159.98, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, 398.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, 398.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (132, 106, 4, NULL, NULL, NULL, NULL, NULL, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, 398.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (133, 107, 4, NULL, NULL, NULL, NULL, NULL, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (134, 108, 4, NULL, NULL, NULL, NULL, NULL, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, 398.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (135, 109, 4, NULL, NULL, NULL, NULL, NULL, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, NULL, NULL, NULL, NULL, NULL, NULL, 2999.00, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (136, 116, 4, NULL, NULL, NULL, NULL, 2002, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, '颜色：白色；版本：标准版', '支持7天无理由退货', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (137, 117, 4, NULL, NULL, NULL, NULL, 1001, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, '颜色：蓝色；存储容量：256GB', '赠品：原装手机壳', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (138, 118, 4, NULL, NULL, NULL, NULL, 2002, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, '颜色：白色；版本：标准版', '支持7天无理由退货', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (139, 119, 4, NULL, NULL, NULL, NULL, 1001, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, '颜色：蓝色；存储容量：256GB', '赠品：原装手机壳', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (140, 120, 4, NULL, NULL, NULL, NULL, 2002, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, '颜色：白色；版本：标准版', '支持7天无理由退货', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (141, 121, 4, NULL, NULL, NULL, NULL, 1001, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, '颜色：蓝色；存储容量：256GB', '赠品：原装手机壳', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (142, 122, 4, NULL, NULL, NULL, NULL, 2002, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, '颜色：白色；版本：标准版', '支持7天无理由退货', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (143, 123, 4, NULL, NULL, NULL, NULL, 1001, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, '颜色：蓝色；存储容量：256GB', '赠品：原装手机壳', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (144, 124, 4, NULL, NULL, NULL, NULL, 2002, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, '颜色：白色；版本：标准版', '支持7天无理由退货', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (145, 125, 4, NULL, NULL, NULL, NULL, 1001, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, '颜色：蓝色；存储容量：256GB', '赠品：原装手机壳', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (146, 126, 4, NULL, NULL, NULL, NULL, NULL, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, NULL, '黑色', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (147, 127, 4, NULL, NULL, NULL, NULL, NULL, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, NULL, '红色', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (148, 149, NULL, NULL, NULL, NULL, NULL, NULL, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, NULL, '黑色', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (149, 150, NULL, NULL, NULL, NULL, NULL, NULL, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, NULL, '红色', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (150, 151, NULL, NULL, NULL, NULL, NULL, NULL, '小米手机 Redmi Note 12 Pro', '7437788', NULL, 2999.00, 1, NULL, '红色', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (151, 152, NULL, NULL, NULL, NULL, NULL, NULL, '无线蓝牙耳机', '7437789', NULL, 199.00, 2, NULL, '黑色', NULL, NULL, NULL, NULL, NULL, 0, 0, 0);
INSERT INTO `oms_order_item` VALUES (152, 157, 4, 4, '法国', 48, NULL, NULL, '小米手机 Redmi Note 12 Pro', '7437788', 'REDMI-NOTE12-PRO-BLUE-256G', 2999.00, 1, NULL, '红色', NULL, NULL, NULL, NULL, 2999.00, NULL, NULL, 0);
INSERT INTO `oms_order_item` VALUES (153, 158, 4, 2, '中国', 49, NULL, NULL, '无线蓝牙耳机', '7437789', 'TWS-X3-WHITE', 199.00, 2, NULL, '黑色', NULL, NULL, NULL, NULL, 398.00, NULL, NULL, 0);

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作历史记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
INSERT INTO `oms_order_operate_history` VALUES (5, 12, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (6, 13, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (7, 12, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (8, 13, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (9, 22, '后台管理员', '2018-10-15 16:31:48', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (10, 22, '后台管理员', '2018-10-15 16:35:08', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (11, 22, '后台管理员', '2018-10-15 16:35:59', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (12, 17, '后台管理员', '2018-10-15 16:43:40', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (13, 25, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (14, 26, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (15, 23, '后台管理员', '2018-10-16 14:41:28', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (16, 13, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (17, 18, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (18, 26, '后台管理员', '2018-10-30 14:37:44', 4, '订单关闭:关闭订单');
INSERT INTO `oms_order_operate_history` VALUES (19, 25, '后台管理员', '2018-10-30 15:07:01', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (20, 25, '后台管理员', '2018-10-30 15:08:13', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (21, 25, '后台管理员', '2018-10-30 15:08:31', 0, '修改备注信息：xxx');
INSERT INTO `oms_order_operate_history` VALUES (22, 25, '后台管理员', '2018-10-30 15:08:39', 4, '订单关闭:2222');
INSERT INTO `oms_order_operate_history` VALUES (23, 12, '后台管理员', '2019-11-09 16:50:28', 4, '修改备注信息：111');
INSERT INTO `oms_order_operate_history` VALUES (24, 30, '后台管理员', '2020-02-25 16:52:37', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (25, 30, '后台管理员', '2020-02-25 16:52:51', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (26, 30, '后台管理员', '2020-02-25 16:54:03', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (27, 35, '后台管理员', '2020-05-17 15:30:24', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (28, 37, '后台管理员', '2020-05-17 19:35:00', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (29, 39, '后台管理员', '2020-05-17 19:42:08', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (30, 41, '后台管理员', '2020-05-18 20:23:04', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (31, 47, '后台管理员', '2020-06-21 15:13:44', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (32, 48, '后台管理员', '2020-06-21 15:15:49', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (33, 52, '后台管理员', '2022-11-09 15:16:13', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (34, 60, '后台管理员', '2022-11-16 10:42:50', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (35, 62, '后台管理员', '2022-12-21 15:50:24', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (36, 63, '后台管理员', '2023-01-10 10:08:34', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (37, 65, '后台管理员', '2023-01-10 10:08:34', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (38, 69, '后台管理员', '2023-05-11 15:30:08', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (39, 70, '后台管理员', '2023-05-11 15:31:22', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (40, 72, '后台管理员', '2023-05-11 15:33:43', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (41, 74, '后台管理员', '2023-05-11 15:36:00', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (42, 75, '后台管理员', '2023-05-11 15:36:11', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (43, 76, '后台管理员', '2023-05-11 15:37:34', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (44, 83, '后台管理员', '2025-02-19 11:11:33', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (45, NULL, '后台管理员', '2025-02-19 11:46:23', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (46, NULL, '后台管理员', '2025-02-19 11:56:50', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (47, NULL, '后台管理员', '2025-03-02 17:43:12', NULL, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (48, NULL, '后台管理员', '2025-03-02 17:51:02', NULL, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (49, NULL, '后台管理员', '2025-03-02 18:12:32', NULL, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (50, NULL, '后台管理员', '2025-03-02 18:19:37', NULL, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (51, NULL, '后台管理员', '2025-03-02 18:20:42', NULL, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (52, NULL, '后台管理员', '2025-03-02 18:22:12', NULL, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (53, NULL, '后台管理员', '2025-03-02 18:29:27', NULL, '修改收货人信息');

-- ----------------------------
-- Table structure for oms_order_parcel
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_parcel`;
CREATE TABLE `oms_order_parcel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单ID',
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '发货仓库ID',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单国家代码',
  `parcel_company` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '物流公司',
  `parcel_sn` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '包裹编号',
  `parcel_status` int(1) NULL DEFAULT 0 COMMENT '0-待出库 1-运输中 2-已签收',
  `shipping_time` timestamp(0) NULL DEFAULT NULL COMMENT '发货时间',
  `received_time` timestamp(0) NULL DEFAULT NULL COMMENT '签收时间',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 159 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '包裹表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_parcel
-- ----------------------------
INSERT INTO `oms_order_parcel` VALUES (2, 12, 1, NULL, 'GLS', NULL, 0, NULL, NULL, '2025-02-16 10:36:26', NULL);
INSERT INTO `oms_order_parcel` VALUES (3, 12, 3, NULL, 'GLS', NULL, 0, NULL, NULL, '2025-02-17 10:36:36', NULL);
INSERT INTO `oms_order_parcel` VALUES (4, 12, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (5, 13, 1, NULL, 'GLS', NULL, 0, NULL, NULL, '2025-02-18 10:36:42', NULL);
INSERT INTO `oms_order_parcel` VALUES (6, 13, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (7, 13, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (8, 14, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (9, 14, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (10, 14, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (11, 15, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (12, 15, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (13, 15, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (14, 16, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (15, 16, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (16, 16, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (17, 27, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (18, 28, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (19, 29, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (20, 30, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (21, 31, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (22, 31, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (23, 31, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (24, 32, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (25, 32, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (26, 33, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (27, 34, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (28, 35, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (29, 36, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (30, 36, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (31, 37, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (32, 37, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (33, 38, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (34, 39, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (35, 40, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (36, 41, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (37, 41, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (38, 42, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (39, 43, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (40, 44, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (41, 45, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (42, 45, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (43, 46, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (44, 46, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (45, 47, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (46, 47, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (47, 48, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (48, 49, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (49, 50, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (50, 51, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (51, 52, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (52, 53, 1, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (53, 54, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (54, 55, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (55, 56, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (56, 57, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (57, 58, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (58, 59, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (59, 60, 2, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (60, 60, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (61, 60, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (62, 61, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (63, 62, 2, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (64, 62, 4, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (65, 63, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (66, 64, 2, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (67, 65, 2, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (68, 65, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (69, 66, 3, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_parcel` VALUES (70, 67, 1, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (71, 68, 1, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (72, 69, 2, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (73, 69, 3, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (74, 70, 1, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (75, 71, 5, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (76, 72, 4, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (77, 73, 4, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (78, 74, 3, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (79, 75, 2, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (80, 76, 3, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (81, 76, 5, NULL, 'GLS', NULL, 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (82, 83, NULL, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (83, 84, NULL, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (85, 96, NULL, NULL, 'GLS', NULL, 0, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (86, 97, 3, 'GB', 'GLS', 'GBGB', 5, NULL, NULL, NULL, 0);
INSERT INTO `oms_order_parcel` VALUES (88, 100, 1, 'CN', 'GLS', 'FRCN', 5, NULL, NULL, '2025-02-26 10:49:05', 0);
INSERT INTO `oms_order_parcel` VALUES (102, 115, 4, '法国', 'GLS', NULL, 5, NULL, NULL, '2025-03-02 15:19:32', 0);
INSERT INTO `oms_order_parcel` VALUES (103, 115, 3, '英国', 'GLS', NULL, 5, NULL, NULL, '2025-03-02 15:19:32', 0);
INSERT INTO `oms_order_parcel` VALUES (104, 116, 4, '法国', 'GLS', NULL, 5, NULL, NULL, '2025-03-02 15:22:57', 0);
INSERT INTO `oms_order_parcel` VALUES (105, 116, 3, '英国', 'GLS', NULL, 5, NULL, NULL, '2025-03-02 15:22:57', 0);
INSERT INTO `oms_order_parcel` VALUES (106, 117, 4, '法国', 'GLS', NULL, 5, NULL, NULL, '2025-03-02 15:27:26', 0);
INSERT INTO `oms_order_parcel` VALUES (107, 117, 3, '英国', 'GLS', NULL, 5, NULL, NULL, '2025-03-02 15:27:26', 0);
INSERT INTO `oms_order_parcel` VALUES (108, 118, 4, '法国', 'GLS', NULL, 5, NULL, NULL, '2025-03-02 15:47:46', 0);
INSERT INTO `oms_order_parcel` VALUES (109, 118, 3, '英国', 'GLS', NULL, 5, NULL, NULL, '2025-03-02 15:47:46', 0);
INSERT INTO `oms_order_parcel` VALUES (116, 122, 4, '法国', 'GLS', NULL, 5, NULL, NULL, '2025-03-02 16:00:07', 0);
INSERT INTO `oms_order_parcel` VALUES (117, 122, 3, '英国', 'GLS', '2352', 5, NULL, NULL, '2025-03-02 16:00:07', 0);
INSERT INTO `oms_order_parcel` VALUES (118, 123, 4, '法国', 'GLS', NULL, 5, NULL, NULL, '2025-03-05 16:51:47', 0);
INSERT INTO `oms_order_parcel` VALUES (119, 123, 3, '英国', 'GLS', NULL, 5, NULL, NULL, '2025-03-05 16:51:47', 0);
INSERT INTO `oms_order_parcel` VALUES (120, 124, 4, '法国', 'GLS', NULL, 5, NULL, NULL, '2025-03-05 16:55:04', 0);
INSERT INTO `oms_order_parcel` VALUES (121, 124, 3, '英国', 'GLS', NULL, 5, NULL, NULL, '2025-03-05 16:55:04', 0);
INSERT INTO `oms_order_parcel` VALUES (122, 125, 4, 'FR', 'GLS', 'GBFR', 5, NULL, NULL, '2025-03-05 16:59:21', 0);
INSERT INTO `oms_order_parcel` VALUES (123, 125, 3, 'GB', 'GLS', 'GBGB', 5, NULL, NULL, '2025-03-05 16:59:21', 0);
INSERT INTO `oms_order_parcel` VALUES (124, 126, 4, 'FR', 'GLS', NULL, 5, NULL, NULL, '2025-03-05 17:03:07', 0);
INSERT INTO `oms_order_parcel` VALUES (125, 126, 3, 'GB', 'GLS', NULL, 5, NULL, NULL, '2025-03-05 17:03:07', 0);
INSERT INTO `oms_order_parcel` VALUES (126, 127, 4, 'FR', NULL, 'FRFR', 5, NULL, NULL, '2025-03-07 14:06:08', 0);
INSERT INTO `oms_order_parcel` VALUES (127, 127, 3, 'GB', NULL, 'FRGB', 5, NULL, NULL, '2025-03-07 14:06:08', 0);
INSERT INTO `oms_order_parcel` VALUES (142, 125, 4, 'GB', NULL, 'GBGB', 5, NULL, NULL, '2025-03-12 15:38:21', 0);
INSERT INTO `oms_order_parcel` VALUES (143, 127, 3, 'FR', NULL, 'FRFR', 5, NULL, NULL, '2025-03-12 15:38:21', 0);
INSERT INTO `oms_order_parcel` VALUES (144, 100, 1, 'FR', NULL, 'FRFR', 5, NULL, NULL, '2025-03-12 16:28:42', 0);
INSERT INTO `oms_order_parcel` VALUES (149, 130, 4, '法国', NULL, NULL, 0, NULL, NULL, '2025-03-19 13:50:34', NULL);
INSERT INTO `oms_order_parcel` VALUES (150, 130, 3, '英国', NULL, NULL, 0, NULL, NULL, '2025-03-19 13:50:34', NULL);
INSERT INTO `oms_order_parcel` VALUES (151, 145, 4, '法国', NULL, NULL, 0, NULL, NULL, '2025-03-19 15:34:04', NULL);
INSERT INTO `oms_order_parcel` VALUES (152, 145, 2, '中国', NULL, NULL, 0, NULL, NULL, '2025-03-19 15:34:04', NULL);
INSERT INTO `oms_order_parcel` VALUES (157, 148, 4, '法国', NULL, NULL, 0, NULL, NULL, '2025-03-19 15:55:57', 0);
INSERT INTO `oms_order_parcel` VALUES (158, 148, 2, '中国', NULL, NULL, 0, NULL, NULL, '2025-03-19 15:55:57', 0);

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(20) NULL DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) NULL DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单退货申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
INSERT INTO `oms_order_return_apply` VALUES (3, 12, 1, 26, '201809150101000001', '2018-10-17 14:34:57', 'test', 0.00, '大梨', '18000000000', 2, '2022-11-11 10:16:18', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '111', 'admin', 'admin', '2022-11-11 10:16:26', NULL);
INSERT INTO `oms_order_return_apply` VALUES (4, 12, 2, 27, '201809150101000001', '2018-10-17 14:40:21', 'test', 3585.98, '大梨', '18000000000', 1, '2018-10-18 13:54:10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '已经处理了', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (5, 12, 3, 28, '201809150101000001', '2018-10-17 14:44:18', 'test', 3585.98, '大梨', '18000000000', 2, '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '已经处理了', 'admin', 'admin', '2018-10-18 13:55:58', '已经处理了');
INSERT INTO `oms_order_return_apply` VALUES (8, 13, NULL, 28, '201809150102000002', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 3, '2018-10-18 13:57:12', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '理由不够充分', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (9, 14, 2, 26, '201809130101000001', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '呵呵', 'admin', 'admin', '2018-10-24 15:46:35', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (10, 14, NULL, 27, '201809130101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '就是不退', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (11, 14, 2, 28, '201809130101000001', '2018-10-17 14:44:18', 'test', 591.05, '大梨', '18000000000', 1, '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '可以退款', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (12, 15, 3, 26, '201809130102000002', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '退货了', 'admin', 'admin', '2018-10-24 17:23:06', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (13, 15, NULL, 27, '201809130102000002', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '无法退货', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (15, 16, NULL, 26, '201809140101000001', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (16, 16, NULL, 27, '201809140101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (17, 16, NULL, 28, '201809140101000001', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (18, 17, NULL, 26, '201809150101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (19, 17, NULL, 27, '201809150101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (20, 17, NULL, 28, '201809150101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (21, 18, NULL, 26, '201809150102000004', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (22, 18, NULL, 27, '201809150102000004', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (23, 18, NULL, 28, '201809150102000004', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (24, 19, NULL, 26, '201809130101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (25, 19, NULL, 27, '201809130101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (26, 19, NULL, 28, '201809130101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货原因表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
INSERT INTO `oms_order_return_reason` VALUES (1, '质量问题', 1, 1, '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` VALUES (2, '尺码太大', 1, 1, '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` VALUES (3, '颜色不喜欢', 1, 1, '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` VALUES (4, '7天无理由退货', 1, 1, '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` VALUES (5, '价格问题', 1, 0, '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` VALUES (12, '发票问题', 0, 1, '2018-10-19 16:28:36');
INSERT INTO `oms_order_return_reason` VALUES (13, '其他问题', 0, 1, '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` VALUES (14, '物流问题', 0, 1, '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` VALUES (15, '售后问题', 0, 1, '2018-10-19 16:29:11');

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) NULL DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) NULL DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) NULL DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) NULL DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) NULL DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES (1, 60, 120, 15, 7, 7);

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_count` int(11) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '相册表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_album
-- ----------------------------

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NULL DEFAULT NULL,
  `pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '画册图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `sort` int(11) NULL DEFAULT NULL,
  `factory_status` int(1) NULL DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) NULL DEFAULT NULL,
  `product_count` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) NULL DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '品牌故事',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1, '万和', 'W', 0, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5b07ca8aN4e127d2f.jpg', 'http://img13.360buyimg.com/cms/jfs/t1/121860/35/2430/187800/5ec4e294E22f3ffcc/1e233b65b94ba192.jpg', '万和成立于1993年8月，总部位于广东顺德国家级高新技术开发区内，是国内生产规模最大的燃气具专业制造企业，也是中国燃气具发展战略的首倡者和推动者、中国五金制品协会燃气用具分会第三届理事长单位。');
INSERT INTO `pms_brand` VALUES (2, '三星', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/57201b47N7bf15715.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_banner_01.png', '三星集团（英文：SAMSUNG、韩文：삼성）是韩国最大的跨国企业集团，三星集团包括众多的国际下属企业，旗下子公司有：三星电子、三星物产、三星人寿保险等，业务涉及电子、金融、机械、化学等众多领域。');
INSERT INTO `pms_brand` VALUES (3, '华为', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5abf6f26N31658aa2.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/huawei_banner_01.png', '荣耀品牌成立于2013年,是华为旗下手机双品牌之一。荣耀以“创新、品质、服务”为核心战略,为全球年轻人提供潮酷的全场景智能化体验,打造年轻人向往的先锋文化和潮流生活方式');
INSERT INTO `pms_brand` VALUES (4, '格力', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (3).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (5, '方太', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (6, '小米', 'M', 500, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5565f5a2N0b8169ae.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/xiaomi_banner_01.png', '小米公司正式成立于2010年4月，是一家专注于高端智能手机、互联网电视自主研发的创新型科技企业。主要由前谷歌、微软、摩托、金山等知名公司的顶尖人才组建。');
INSERT INTO `pms_brand` VALUES (21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_banner_01.png', 'OPPO于2008年推出第一款“笑脸手机”，由此开启探索和引领至美科技之旅。今天，OPPO凭借以Find和R系列手机为核心的智能终端产品，以及OPPO+等互联网服务，让全球消费者尽享至美科技。');
INSERT INTO `pms_brand` VALUES (49, '七匹狼', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/qipilang.png', NULL, 'BOOB的故事');
INSERT INTO `pms_brand` VALUES (50, '海澜之家', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a5c69b9N5d6c5696.jpg', 'http://img10.360buyimg.com/cms/jfs/t1/133148/4/1605/470028/5edaf5ccEd7a687a9/e0a007631361ff75.jpg', '“海澜之家”（英文缩写：HLA）是海澜之家股份有限公司旗下的服装品牌，总部位于中国江苏省无锡市江阴市，主要采用连锁零售的模式，销售男性服装、配饰与相关产品。');
INSERT INTO `pms_brand` VALUES (51, '苹果', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/49b30bb0377030d1.jpg', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/apple_banner_01.png', '苹果公司(Apple Inc. )是美国的一家高科技公司。 由史蒂夫·乔布斯、斯蒂夫·沃兹尼亚克和罗·韦恩(Ron Wayne)等人于1976年4月1日创立,并命名为美国苹果电脑公司(Apple Computer Inc. ),2007年1月9日更名为苹果公司,总部位于加利福尼亚州的...');
INSERT INTO `pms_brand` VALUES (58, 'NIKE', 'N', 0, 1, 0, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE的故事');
INSERT INTO `pms_brand` VALUES (59, '测试品牌', 'C', 0, 0, 0, NULL, NULL, 'http://localhost:9000/mall/20220609/Snipaste_2022-06-08_14-35-53.png', 'http://localhost:9000/mall/20220609/biji_05.jpg', '12345');

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `star` int(3) NULL DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  `product_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_couont` int(11) NULL DEFAULT NULL,
  `read_count` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) NULL DEFAULT NULL,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品评价回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `charge_type` int(1) NULL DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10, 2) NULL DEFAULT NULL,
  `continme_fee` decimal(10, 2) NULL DEFAULT NULL,
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运费模版' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_level_id` bigint(20) NULL DEFAULT NULL,
  `member_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 432 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品会员价格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
INSERT INTO `pms_member_price` VALUES (26, 7, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (27, 8, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (28, 9, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (29, 10, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (30, 11, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (31, 12, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (32, 13, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (33, 14, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (37, 18, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (44, 7, 2, 480.00, NULL);
INSERT INTO `pms_member_price` VALUES (45, 7, 3, 450.00, NULL);
INSERT INTO `pms_member_price` VALUES (52, 22, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (53, 22, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (54, 22, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (58, 24, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (59, 24, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (60, 24, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (112, 23, 1, 88.00, '黄金会员');
INSERT INTO `pms_member_price` VALUES (113, 23, 2, 88.00, '白金会员');
INSERT INTO `pms_member_price` VALUES (114, 23, 3, 66.00, '钻石会员');
INSERT INTO `pms_member_price` VALUES (246, 36, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (247, 36, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (248, 36, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (249, 35, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (250, 35, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (251, 35, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (258, 30, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (259, 30, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (260, 30, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (261, 31, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (262, 31, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (263, 31, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (264, 32, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (265, 32, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (266, 32, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (270, 33, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (271, 33, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (272, 33, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (273, 34, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (274, 34, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (275, 34, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (285, 27, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (286, 27, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (287, 27, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (294, 28, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (295, 28, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (296, 28, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (297, 29, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (298, 29, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (299, 29, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (315, 37, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (316, 37, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (317, 37, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (381, 38, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (382, 38, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (383, 38, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (384, 39, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (385, 39, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (386, 39, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (387, 41, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (388, 41, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (389, 41, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (390, 42, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (391, 42, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (392, 42, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (393, 43, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (394, 43, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (395, 43, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (396, 44, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (397, 44, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (398, 44, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (399, 45, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (400, 45, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (401, 45, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (402, 40, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (403, 40, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (404, 40, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (423, 26, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (424, 26, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (425, 26, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (426, 46, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (427, 46, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (428, 46, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (429, 47, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (430, 47, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (431, 47, 3, NULL, '钻石会员');

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `detail_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情网页内容',
  `detail_mobile_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端网页详情',
  `brand_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_category_id` bigint(20) NULL DEFAULT NULL,
  `warehouse_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库ID',
  `feight_template_id` bigint(20) NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) NULL DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品重量，默认为克',
  `product_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `album_pics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `publish_status` int(1) NULL DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `verify_status` int(1) NULL DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `new_status` int(1) NULL DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `preview_status` int(1) NULL DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `promotion_type` int(1) NULL DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `promotion_start_time` datetime(0) NULL DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime(0) NULL DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(11) NULL DEFAULT NULL COMMENT '活动限购数量',
  `gift_point` int(11) NULL DEFAULT 0 COMMENT '赠送的积分',
  `gift_growth` int(11) NULL DEFAULT 0 COMMENT '赠送的成长值',
  `use_point_limit` int(11) NULL DEFAULT NULL COMMENT '限制使用的积分数',
  `shelf_time` datetime(0) NULL DEFAULT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `warehouse_id`(`warehouse_id`) USING BTREE,
  CONSTRAINT `pms_product_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `wms_warehouse` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (1, 'No86577', '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '111', '111', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', 49, 7, 0, 2, 0, '中国', 100, 0, 100.00, 120.00, NULL, 100, 20, '件', 1000.00, '35345', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, 1, 1, 1, 1, 1, 0, 0, NULL, NULL, NULL, 100, 0, NULL, '2025-02-20 19:05:28', NULL, NULL);
INSERT INTO `pms_product` VALUES (2, 'No86578', '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '111', '111', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', 49, 7, 0, 5, 0, '德国', 1, 0, 100.00, 120.00, NULL, 100, 20, '件', 1000.00, '34544', NULL, '银色星芒刺绣网纱底裤2', '银色星芒刺绣网纱底裤', NULL, 1, 1, 1, 1, 1, 0, 0, NULL, NULL, NULL, 100, 0, NULL, '2025-02-21 19:05:33', NULL, NULL);
INSERT INTO `pms_product` VALUES (3, 'No86579', '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '111', '111', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', 1, 7, 0, 5, 0, '德国', 1, 0, 100.00, 120.00, NULL, 100, 20, '件', 1000.00, '34534', NULL, '银色星芒刺绣网纱底裤3', '银色星芒刺绣网纱底裤', NULL, 1, 1, 1, 1, 1, 0, 0, NULL, NULL, NULL, 100, 0, NULL, '2025-02-26 19:05:44', NULL, NULL);
INSERT INTO `pms_product` VALUES (4, 'No86580', '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '111', '111', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', 1, 7, 0, 5, 0, '德国', 1, 0, 100.00, 120.00, NULL, 100, 20, '件', 1000.00, '54345', NULL, '银色星芒刺绣网纱底裤4', '银色星芒刺绣网纱底裤', NULL, 1, 1, 1, 1, 1, 0, 0, NULL, NULL, NULL, 100, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (5, 'No86581', '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '111', '111', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', 1, 7, 0, 5, 0, '德国', 1, 0, 100.00, 120.00, NULL, 100, 20, '件', 1000.00, '34534', NULL, '银色星芒刺绣网纱底裤5', '银色星芒刺绣网纱底裤', NULL, 0, 1, 1, 1, 1, 0, 0, NULL, NULL, NULL, 100, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (6, 'No86582', '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '111', '111', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', 1, 7, 0, 5, 0, '德国', 1, 0, 100.00, 120.00, NULL, 100, 20, '件', 1000.00, '34535', NULL, '银色星芒刺绣网纱底裤6', '银色星芒刺绣网纱底裤', NULL, 1, 1, 1, 1, 1, 0, 0, NULL, NULL, NULL, 100, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (7, 'No86577', '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 'string', 'string', 'string', 'string', 1, 7, 1, 4, 0, '法国', 0, 0, 249.00, 299.00, 0.00, 100, 0, '件', 0.00, '21356', 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 0, 0, 1, 0, 0, 0, 0, '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (8, 'No86577', '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 'string', 'string', 'string', 'string', 1, 7, 1, 2, 0, '中国', 0, 0, 249.00, 299.00, 0.00, 100, 0, '件', 0.00, '23457', 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 0, 0, 1, 0, 0, 0, 0, '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (9, 'No86577', '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 'string', 'string', 'string', 'string', 1, 7, 1, 1, 0, '中国', 0, 0, 249.00, 299.00, 0.00, 100, 0, '件', 0.00, '26546', 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 0, 0, 1, 0, 0, 0, 0, '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (10, 'No86577', '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 'string', 'string', 'string', 'string', 1, 7, 1, 3, 0, '英国', 0, 0, 249.00, 299.00, 0.00, 100, 0, '件', 0.00, '76854', 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 0, 0, 1, 0, 0, 0, 0, '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (11, 'No86577', '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 'string', 'string', 'string', 'string', 1, 7, 1, 1, 0, '中国', 0, 0, 249.00, 299.00, 0.00, 100, 0, '件', 0.00, '45674', 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 1, 0, 1, 0, 1, 0, 0, '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (12, 'No86577', '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 'string', 'string', 'string', 'string', 1, 7, 1, 3, 0, '英国', 0, 0, 249.00, 299.00, 0.00, 100, 0, '件', 0.00, '45672', 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 1, 0, 1, 0, 1, 0, 0, '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (13, 'No86577', '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 'string', 'string', 'string', 'string', 1, 7, 1, 4, 0, '法国', 0, 0, 249.00, 299.00, 0.00, 100, 0, '件', 0.00, '26547', 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 1, 0, 1, 0, 1, 0, 0, '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (14, 'No86577', '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 'string', 'string', 'string', 'string', 1, 7, 1, 4, 0, '法国', 0, 0, 249.00, 299.00, 0.00, 100, 0, '件', 0.00, '26575', 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 0, 0, 1, 0, 1, 0, 0, '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (18, 'No86577', '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 'string', 'string', 'string', 'string', 1, 7, 1, 2, 0, '中国', 0, 0, 249.00, 299.00, 0.00, 100, 0, '件', 0.00, '45687', 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 0, 0, 1, 0, 1, 0, 0, '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (22, '', 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'test', '', '', '', '', '', 6, 7, 1, 4, 0, '法国', 0, 0, 0.00, 0.00, NULL, 100, 0, '', 0.00, '32546', '1,2', '', '', '', 1, 0, 1, 0, 0, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (23, 'NO.1098', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '毛衫测试11', 'xxx', '毛衫测试', '毛衫测试', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>', '', 6, 19, 1, 3, 0, '英国', 0, 0, 99.00, 109.00, NULL, 100, 0, '件', 1000.00, '26554', '1,2,3', '毛衫测试', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 1, 0, 1, 1, 1, 1, 2, NULL, NULL, 0, 99, 99, 1000, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (24, '', 'xxx', '', 'xxx', '', '', '', '', '', 6, 7, NULL, 3, 0, '英国', 0, 0, 0.00, 0.00, NULL, 100, 0, '', 0.00, '37557', '', '', '', '', 0, 0, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (26, '6946605', '华为 HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '<p><img src=\"//img20.360buyimg.com/vc/jfs/t1/81293/35/5822/369414/5d3fe77cE619c5487/6e775a52850feea5.jpg!q70.dpg.webp\" alt=\"\" width=\"750\" height=\"776\" /></p>\n<p><img src=\"//img20.360buyimg.com/vc/jfs/t1/45300/25/11592/3658871/5d85ef66E92a8a911/083e47d8f662c582.jpg!q70.dpg.webp\" alt=\"\" width=\"596\" height=\"16383\" /></p>', 3, 19, 3, 1, 0, '中国', 100, 100, 3788.00, 4288.00, 3659.00, 1000, 0, '件', 0.00, '25685', '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', 1, 0, 0, 1, 1, 1, 1, '2023-01-10 15:49:38', '2023-01-31 00:00:00', 0, 3788, 3788, 0, '2025-02-01 14:50:36', NULL, NULL);
INSERT INTO `pms_product` VALUES (27, '7437788', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '', '', '<p style=\"text-align: center;\"><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/95935/9/19330/159477/5e9ecc13E5b8db8ae/8e954021a0835fb7.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99224/22/19596/137593/5e9ecc13E34ef2113/2b362b90d8378ee1.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/93131/25/19321/107691/5e9ecc13E41e8addf/202a5f84d9129878.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/101843/19/19533/66831/5e9ecc13Ecb7f9d53/4fdd807266583c1e.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99629/36/19016/59882/5e9ecc13E1f5beef5/1e5af3528f366e70.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/72343/29/8945/84548/5d6e5c67Ea07b1125/702791816b90eb3d.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/65403/35/9017/129532/5d6e5c68E3f2d0546/9ec771eb6e04a75a.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/58261/33/9380/106603/5d6e5c68E05a99177/2b5b9e29eed05b08.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51968/40/9688/113552/5d6e5c68E5052b312/8969d83124cb78a4.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75491/9/9101/146883/5d6e5c68E3db89775/c1aa57e78ded4e44.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75063/11/9107/127874/5d6e5c68E0b1dfc61/10dd6000ce213375.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/47452/25/9579/108279/5d6e5c68Ea9002f3b/865b5d32ffd9da75.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82146/26/9077/87075/5d6e5c68Ef63bccc8/556de5665a35a3f2.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82804/21/9019/124404/5d6e5c69E06a8f575/0f861f8c4636c546.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/46044/10/9734/107686/5d6e5c69Edd5e66c7/a8c7b9324e271dbd.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/40729/32/13755/45997/5d6e5c69Eafee3664/6a3457a4efdb79c5.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/76254/34/9039/96195/5d6e5c69E3c71c809/49033c0b7024c208.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/79825/20/9065/90864/5d6e5c69E1e62ef89/a4d3ce383425a666.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/49939/21/9618/106207/5d6e5c6aEf7b1d4fd/0f5e963c66be3d0c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/64035/7/9001/115159/5d6e5c6aE6919dfdf/39dfe4840157ad81.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/53389/3/9616/99637/5d6e5c6aEa33b9f35/b8f6aa26e72616a3.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/63219/6/9026/81576/5d6e5c6aEa9c74b49/b4fa364437531012.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/42146/27/13902/80437/5d6e5c6bE30c31ce9/475d4d54c7334313.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/45317/28/9596/78175/5d6e5c6bEce31e4b7/5675858b6933565c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/60080/1/9112/138722/5d6e5c6bEefd9fc62/7ece7460a36d2fcc.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51525/13/9549/36018/5d6e5c73Ebbccae6c/99bc2770dccc042b.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/61948/20/9088/72918/5d6e5c73Eab7aef5c/6f21e2f85cf478fa.jpg!q70.dpg.webp\" /></p>', '<p style=\"text-align: center;\"><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/95935/9/19330/159477/5e9ecc13E5b8db8ae/8e954021a0835fb7.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99224/22/19596/137593/5e9ecc13E34ef2113/2b362b90d8378ee1.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/93131/25/19321/107691/5e9ecc13E41e8addf/202a5f84d9129878.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/101843/19/19533/66831/5e9ecc13Ecb7f9d53/4fdd807266583c1e.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t1/99629/36/19016/59882/5e9ecc13E1f5beef5/1e5af3528f366e70.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/72343/29/8945/84548/5d6e5c67Ea07b1125/702791816b90eb3d.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/65403/35/9017/129532/5d6e5c68E3f2d0546/9ec771eb6e04a75a.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/58261/33/9380/106603/5d6e5c68E05a99177/2b5b9e29eed05b08.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51968/40/9688/113552/5d6e5c68E5052b312/8969d83124cb78a4.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75491/9/9101/146883/5d6e5c68E3db89775/c1aa57e78ded4e44.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/75063/11/9107/127874/5d6e5c68E0b1dfc61/10dd6000ce213375.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/47452/25/9579/108279/5d6e5c68Ea9002f3b/865b5d32ffd9da75.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82146/26/9077/87075/5d6e5c68Ef63bccc8/556de5665a35a3f2.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/82804/21/9019/124404/5d6e5c69E06a8f575/0f861f8c4636c546.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/46044/10/9734/107686/5d6e5c69Edd5e66c7/a8c7b9324e271dbd.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/40729/32/13755/45997/5d6e5c69Eafee3664/6a3457a4efdb79c5.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/76254/34/9039/96195/5d6e5c69E3c71c809/49033c0b7024c208.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/79825/20/9065/90864/5d6e5c69E1e62ef89/a4d3ce383425a666.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/49939/21/9618/106207/5d6e5c6aEf7b1d4fd/0f5e963c66be3d0c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/64035/7/9001/115159/5d6e5c6aE6919dfdf/39dfe4840157ad81.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/53389/3/9616/99637/5d6e5c6aEa33b9f35/b8f6aa26e72616a3.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/63219/6/9026/81576/5d6e5c6aEa9c74b49/b4fa364437531012.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/42146/27/13902/80437/5d6e5c6bE30c31ce9/475d4d54c7334313.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/45317/28/9596/78175/5d6e5c6bEce31e4b7/5675858b6933565c.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/60080/1/9112/138722/5d6e5c6bEefd9fc62/7ece7460a36d2fcc.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/51525/13/9549/36018/5d6e5c73Ebbccae6c/99bc2770dccc042b.jpg!q70.dpg.webp\" /><img src=\"//img30.360buyimg.com/popWaterMark/jfs/t1/61948/20/9088/72918/5d6e5c73Eab7aef5c/6f21e2f85cf478fa.jpg!q70.dpg.webp\" /></p>', 6, 19, 3, 3, 0, '英国', 0, 99, 2699.00, 2699.00, NULL, 100, 0, '', 0.00, '46873', '1', '', '', '', 1, 0, 0, 1, 1, 0, 3, NULL, NULL, 0, 2699, 2699, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (28, '7437789', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', '', '', '', '<div><img src=\"//img12.360buyimg.com/imgzone/jfs/t1/67362/12/14546/708984/5dc28512Eefdd817d/c82503af0da6c038.gif\" /><img src=\"//img13.360buyimg.com/imgzone/jfs/t1/61488/17/14551/995918/5dc28512E821c228d/41e52005ea5b1f36.gif\" /><img src=\"//img14.360buyimg.com/imgzone/jfs/t1/72961/36/14769/305883/5dc28512E65d77261/3df6be29e3d489d1.gif\" />\n<p>&nbsp;</p>\n</div>', 6, 19, 3, 4, 0, '法国', 0, 98, 649.00, 649.00, NULL, 100, 0, '', 0.00, '23564', '', '', '', '', 1, 0, 0, 1, 1, 0, 4, NULL, NULL, 0, 649, 649, 0, '2025-01-07 21:44:34', NULL, NULL);
INSERT INTO `pms_product` VALUES (29, '7437799', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', '', '', '', '<div><img src=\"//img10.360buyimg.com/cms/jfs/t1/20020/38/9725/228440/5c7f9208Eeaf4bf87/13a713066f71791d.jpg!q70.dpg.webp\" /> <img src=\"//img12.360buyimg.com/cms/jfs/t1/12128/39/9607/265349/5c7f9209Ecff29b88/08620ba570705634.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/22731/40/9578/345163/5c7f9209E9ba056e5/a8a557060b84447e.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/29506/38/9439/299492/5c7f9209E0e51eb29/15dedd95416f3c68.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/26766/28/9574/257101/5c7f9209Eaca1b317/c7caa047b1566cf1.jpg!q70.dpg.webp\" /> <img src=\"//img13.360buyimg.com/cms/jfs/t1/11059/8/10473/286531/5c7f9208E05da0120/9034ad8799ad9553.jpg!q70.dpg.webp\" /> <img src=\"//img14.360buyimg.com/cms/jfs/t1/25641/2/9557/268826/5c7f9208Efbf0dc50/399580629e05e733.jpg!q70.dpg.webp\" /> <img src=\"//img13.360buyimg.com/cms/jfs/t1/28964/25/9527/305902/5c7f9208E275ffb9c/8464934d67e69b7a.jpg!q70.dpg.webp\" /></div>', 51, 19, 3, 3, 0, '英国', 0, 97, 5499.00, 5499.00, 4799.00, 100, 0, '', 0.00, '86545', '1,2,3', '', '', '', 1, 0, 0, 1, 1, 0, 1, '2020-05-04 15:12:54', '2020-05-30 00:00:00', 0, 5499, 5499, 0, '2024-12-07 15:36:31', NULL, NULL);
INSERT INTO `pms_product` VALUES (30, 'HNTBJ2E042A', 'HLA海澜之家简约动物印花短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '', '', '', '', '', 50, 8, 1, 2, 0, '中国', 0, 0, 98.00, 98.00, NULL, 100, 0, '', 0.00, '35673', '', '', '', '', 1, 0, 0, 1, 1, 0, 0, NULL, NULL, 0, 0, 0, 0, '2024-11-15 15:36:38', NULL, NULL);
INSERT INTO `pms_product` VALUES (31, 'HNTBJ2E080A', 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', '', '', '', '', 50, 8, 1, 3, 0, '英国', 0, 0, 98.00, 98.00, NULL, 100, 0, '', 0.00, '98765', '', '', '', '', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (32, 'HNTBJ2E153A', 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '', '', '', '', '', 50, 8, 1, 2, 0, '中国', 0, 0, 68.00, 68.00, NULL, 100, 0, '', 0.00, '67543', '1,2', '', '', '', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (33, '4609652', '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', '', '', '', '', 6, 35, 12, 4, 0, '法国', 0, 0, 2499.00, 2499.00, NULL, 100, 0, '', 0.00, '23455', '', '', '', '', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (34, '4609660', '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', '', '', '', '', 6, 35, 12, 5, 0, '德国', 0, 0, 3999.00, 3999.00, NULL, 100, 0, '', 0.00, '15345', '1,2', '', '', '', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (35, '6799342', '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', '', '', '', '', 58, 29, 11, 3, 0, '英国', 0, 0, 369.00, 369.00, NULL, 100, 0, '', 0.00, '14534', '', '', '', '', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (36, '6799345', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', '', '', '', '', 58, 29, 11, 1, 0, '中国', 0, 0, 499.00, 499.00, NULL, 100, 0, '', 0.00, '15344', '', '', '', '', 1, 0, 0, 1, 1, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (37, '100038005189', 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', '【11.11大爱超大爱】指定iPhone14产品限时限量领券立减601元！！！部分iPhone产品现货抢购确认收货即送原厂手机壳10元优惠券！！！猛戳 ', '', '', '', '', '<div style=\"margin: 0 auto;\"><img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/58071/39/19839/119559/63190110Edac0cea7/b62a84f1b8775fef.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img20.360buyimg.com/cms/jfs/t1/138903/36/29400/86115/63190110E0a98c819/d2efbef39eeb2995.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img30.360buyimg.com/cms/jfs/t1/176347/20/28995/115695/63190110Ef5d766f9/aee3d2d866522f66.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/120515/39/28721/142961/63190110Eec31e31a/3486d6a065a18ddc.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/30161/12/17674/81508/63190110E1385cf61/f05a2a43f4d304ff.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/100037/16/31071/62177/6319010fE871efe01/b01a6f981c268e38.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/90843/33/25852/74752/63190110E373559f4/74b6b52a3fb08c66.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/181914/22/28400/126094/63190110Edefb838c/802a16e758be2b1d.jpg!q70.dpg.webp\" /></div>', 51, 19, 3, 4, 0, '法国', 200, 0, 5999.00, 5999.00, NULL, 1000, 0, '', 208.00, '34526', '1,2,3', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (38, '100044025833', 'Apple iPad 10.9英寸平板电脑 2022年款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', '【11.11大爱超大爱】iPad9代限量抢购，价格优惠，更享以旧换新至高补贴325元！！快来抢购吧！！ ', '', '', '', '', '<div style=\"margin: 0 auto;\"><img style=\"max-width: 390px;\" src=\"//img12.360buyimg.com/cms/jfs/t1/75040/28/21026/295081/634ed154E981e4d10/2ceef91d6f2b2273.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img13.360buyimg.com/cms/jfs/t1/191028/1/28802/401291/634ed15eEb234dc40/5ab89f83531e1023.jpg!q70.dpg.webp\" /> <img style=\"max-width: 390px;\" src=\"//img14.360buyimg.com/cms/jfs/t1/32758/24/18599/330590/634ed15eEc3db173c/c52953dc8008a576.jpg!q70.dpg.webp\" /></div>', 51, 53, 3, 1, 0, '中国', 0, 0, 3599.00, 3599.00, NULL, 1000, 0, '', 0.00, '15344', '1,2,3', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (39, '100023207945', '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', '【双十一大促来袭】指定型号至高优惠1000，以旧换新至高补贴1000元，晒单赢好礼', '', '', '', '', '<div class=\"ssd-module-mobile-wrap\">\n<div class=\"ssd-module M16667778180631\" data-id=\"M16667778180631\"><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_05.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_snipaste_06.png\" /></div>\n<div class=\"ssd-module M16667778180631\" data-id=\"M16667778180631\">&nbsp;</div>\n<div class=\"ssd-module M16534569204241\" data-id=\"M16534569204241\">&nbsp;</div>\n<div class=\"ssd-module M16667778416884\" data-id=\"M16667778416884\">\n<div class=\"ssd-widget-text W16667778440496\">&nbsp;</div>\n</div>\n<div class=\"ssd-module M165303211067557\" data-id=\"M165303211067557\">&nbsp;</div>\n<div class=\"ssd-module M16530320459861\" data-id=\"M16530320459861\">&nbsp;</div>\n<div class=\"ssd-module M16530320460062\" data-id=\"M16530320460062\">&nbsp;</div>\n<div class=\"ssd-module M16530320460153\" data-id=\"M16530320460153\">&nbsp;</div>\n<div class=\"ssd-module M16530320460366\" data-id=\"M16530320460366\">&nbsp;</div>\n<div class=\"ssd-module M16530320460477\" data-id=\"M16530320460477\">&nbsp;</div>\n<div class=\"ssd-module M16530320460578\" data-id=\"M16530320460578\">&nbsp;</div>\n<div class=\"ssd-module M16530320460699\" data-id=\"M16530320460699\">&nbsp;</div>\n<div class=\"ssd-module M165303204608110\" data-id=\"M165303204608110\">&nbsp;</div>\n<div class=\"ssd-module M165303204609511\" data-id=\"M165303204609511\">&nbsp;</div>\n<div class=\"ssd-module M165303204611213\" data-id=\"M165303204611213\">&nbsp;</div>\n<div class=\"ssd-module M165303204612714\" data-id=\"M165303204612714\">&nbsp;</div>\n<div class=\"ssd-module M165303204614115\" data-id=\"M165303204614115\">&nbsp;</div>\n<div class=\"ssd-module M165303204615516\" data-id=\"M165303204615516\">&nbsp;</div>\n<div class=\"ssd-module M165303204617417\" data-id=\"M165303204617417\">&nbsp;</div>\n<div class=\"ssd-module M165303204618818\" data-id=\"M165303204618818\">&nbsp;</div>\n<div class=\"ssd-module M165303204620219\" data-id=\"M165303204620219\">&nbsp;</div>\n<div class=\"ssd-module M165303204621620\" data-id=\"M165303204621620\">&nbsp;</div>\n<div class=\"ssd-module M165303204622921\" data-id=\"M165303204622921\">&nbsp;</div>\n<div class=\"ssd-module M165303204624522\" data-id=\"M165303204624522\">&nbsp;</div>\n<div class=\"ssd-module M165303204626024\" data-id=\"M165303204626024\">&nbsp;</div>\n<div class=\"ssd-module M165303204627525\" data-id=\"M165303204627525\">&nbsp;</div>\n<div class=\"ssd-module M165303204629127\" data-id=\"M165303204629127\">&nbsp;</div>\n<div class=\"ssd-module M165303204632330\" data-id=\"M165303204632330\">&nbsp;</div>\n<div class=\"ssd-module M165303204634031\" data-id=\"M165303204634031\">&nbsp;</div>\n<div class=\"ssd-module M165303204635832\" data-id=\"M165303204635832\">&nbsp;</div>\n<div class=\"ssd-module M165303204637533\" data-id=\"M165303204637533\">&nbsp;</div>\n<div class=\"ssd-module M165303204639334\" data-id=\"M165303204639334\">&nbsp;</div>\n<div class=\"ssd-module M165303204642235\" data-id=\"M165303204642235\">&nbsp;</div>\n<div class=\"ssd-module M165303204647936\" data-id=\"M165303204647936\">&nbsp;</div>\n<div class=\"ssd-module M165303204651037\" data-id=\"M165303204651037\">&nbsp;</div>\n<div class=\"ssd-module M165303204653838\" data-id=\"M165303204653838\">&nbsp;</div>\n<div class=\"ssd-module M165303204656239\" data-id=\"M165303204656239\">&nbsp;</div>\n<div class=\"ssd-module M165303204659141\" data-id=\"M165303204659141\">&nbsp;</div>\n<div class=\"ssd-module M165303204661943\" data-id=\"M165303204661943\">&nbsp;</div>\n<div class=\"ssd-module M165303204665844\" data-id=\"M165303204665844\">&nbsp;</div>\n<div class=\"ssd-module M165303204668045\" data-id=\"M165303204668045\">&nbsp;</div>\n<div class=\"ssd-module M165303204670146\" data-id=\"M165303204670146\">&nbsp;</div>\n<div class=\"ssd-module M165303204672147\" data-id=\"M165303204672147\">&nbsp;</div>\n<div class=\"ssd-module M165303204674348\" data-id=\"M165303204674348\">&nbsp;</div>\n<div class=\"ssd-module M165303204676749\" data-id=\"M165303204676749\">&nbsp;</div>\n<div class=\"ssd-module M165303204681352\" data-id=\"M165303204681352\">&nbsp;</div>\n<div class=\"ssd-module M165303204683553\" data-id=\"M165303204683553\">&nbsp;</div>\n<div class=\"ssd-module M165303204685855\" data-id=\"M165303204685855\">&nbsp;</div>\n<div class=\"ssd-module M165303204688356\" data-id=\"M165303204688356\">&nbsp;</div>\n</div>', 6, 54, 13, 5, 0, '德国', 0, 0, 5599.00, 5599.00, NULL, 500, 0, '', 0.00, '26545', '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', 1, 0, 0, 0, 1, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (40, '100027789721', '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', '天玑9000+处理器、5160mAh大电量、2KAmoled超视感屏【点击购买小米11Ultra，戳】 ', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_snipaste_05.png\" /></p>', 6, 19, 3, 3, 0, '英国', 0, 0, 2999.00, 2999.00, NULL, 500, 0, '', 0.00, '07866', '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', 1, 0, 0, 0, 1, 0, 4, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (41, '100035246702', 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', '【品质好物】天玑8100，2K直屏，5500mAh大电量【Note12Pro火热抢购中】 ', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_snipaste_05.png\" /></p>', 6, 19, 3, 2, 0, '中国', 0, 0, 2099.00, 2099.00, NULL, 1000, 0, '', 0.00, '45637', '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (42, '100035295081', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', '【华为Mate50新品上市】内置66W华为充电套装，超光变XMAGE影像,北斗卫星消息，鸿蒙操作系统3.0！立即抢购！华为新品可持续计划，猛戳》 ', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_snipaste_05.png\" /></p>', 3, 19, 3, 4, 0, '法国', 0, 0, 4999.00, 4999.00, NULL, 1000, 0, '', 0.00, '87966', '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (43, '10044060351752', '万和（Vanward)燃气热水器天然气家用四重防冻直流变频节能全新升级增压水伺服恒温高抗风', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', '【家电11.11享低价，抢到手价不高于1199】【发布种草秀享好礼！同价11.11买贵补差】爆款超一级能效零冷水】 ', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_water_snipaste_05.png\" /></p>', 1, 39, 14, 3, 0, '英国', 0, 0, 1799.00, 1799.00, NULL, 1000, 0, '', 0.00, '56785', '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_16L_01.jpg', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (44, '100018768480', '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议)', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', '【满血无缓存！进店抽百元E卡，部分型号白条三期免息】兼具速度与可靠性！读速高达3500MB/s，全功率模式！点击 ', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_snipaste_03.png\" /></p>', 2, 55, 15, 4, 0, '法国', 0, 0, 369.00, 369.00, NULL, 1000, 0, '', 0.00, '45687', '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (45, '10052147850350', 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', '【11.11提前购机享价保，好货不用等，系统申请一键价保补差!】【Reno8Pro爆款优惠】 ', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_01.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_02.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_03.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_04.png\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_snipaste_05.png\" /></p>', 21, 19, 3, 1, 0, '中国', 0, 0, 2299.00, 2299.00, 999.00, 1000, 0, '', 0.00, '57348', '', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', 1, 0, 0, 0, 0, 0, 4, '2022-11-09 16:15:50', '2022-11-25 00:00:00', 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (46, '10', 'test', '', 'test', '', '', '', '', '', 6, 7, 1, 4, 0, '法国', 0, 0, 20.00, 20.00, NULL, 20, 0, '', 0.00, '43754', '', '', '', '', 1, 0, 0, 1, 1, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (47, '', '红米手机', '', '智能手机', '', '', '', '', '', 6, 34, 3, 4, 0, '法国', 0, 0, 0.00, 0.00, NULL, 0, 0, '', 0.00, '37667', '', '', '', '', 1, 0, 0, 1, 1, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (48, '7437788', '小米手机 Redmi Note 12 Pro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, '法国', NULL, NULL, 2999.00, NULL, NULL, NULL, NULL, NULL, NULL, 'REDMI-NOTE12-PRO-BLUE-256G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `pms_product` VALUES (49, '7437789', '无线蓝牙耳机', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, '中国', NULL, NULL, 199.00, NULL, NULL, NULL, NULL, NULL, NULL, 'TWS-X3-WHITE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `select_type` int(1) NULL DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(1) NULL DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(1) NULL DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(1) NULL DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(1) NULL DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(1) NULL DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(1) NULL DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
INSERT INTO `pms_product_attribute` VALUES (1, 1, '尺寸', 2, 1, 'M,X,XL,2XL,3XL,4XL', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (7, 1, '颜色', 2, 1, '黑色,红色,白色,粉色', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (13, 0, '上市年份', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (14, 0, '上市年份1', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (15, 0, '上市年份2', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (16, 0, '上市年份3', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (17, 0, '上市年份4', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (18, 0, '上市年份5', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (19, 0, '适用对象', 1, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (20, 0, '适用对象1', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (21, 0, '适用对象3', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (24, 1, '商品编号', 1, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (25, 1, '适用季节', 1, 1, '春季,夏季,秋季,冬季', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (32, 2, '适用人群', 0, 1, '老年,青年,中年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (33, 2, '风格', 0, 1, '嘻哈风格,基础大众,商务正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (35, 2, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (37, 1, '适用人群', 1, 1, '儿童,青年,中年,老年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (38, 1, '上市时间', 1, 1, '2017年秋,2017年冬,2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (39, 1, '袖长', 1, 1, '短袖,长袖,中袖', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (40, 2, '尺码', 0, 1, '29,30,31,32,33,34', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (41, 2, '适用场景', 0, 1, '居家,运动,正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (42, 2, '上市时间', 0, 1, '2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (43, 3, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (44, 3, '容量', 0, 1, '16G,32G,64G,128G,256G,512G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (45, 3, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (46, 3, '网络', 0, 1, '3G,4G,5G,WLAN', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (47, 3, '系统', 0, 1, 'Android,IOS', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (48, 3, '电池容量', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (49, 11, '颜色', 0, 1, '红色,蓝色,绿色', 0, 1, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (50, 11, '尺寸', 0, 1, '38,39,40', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (51, 11, '风格', 0, 1, '夏季,秋季', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (52, 12, '尺寸', 0, 1, '50英寸,65英寸,70英寸', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (53, 12, '内存', 0, 1, '8G,16G,32G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (54, 12, '商品编号', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (55, 12, '商品毛重', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (56, 12, '商品产地', 0, 1, '中国大陆,其他', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (57, 12, '电视类型', 0, 1, '大屏,教育电视,4K超清', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (58, 13, '颜色', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (59, 13, '版本', 0, 1, 'R7 16G 512,R5 16G 512,I5 16G 512,I7 16G 512', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (60, 13, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (61, 13, '屏幕分辨率', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (62, 13, 'CPU型号', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (63, 14, '系列', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (64, 14, '上市时间', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (65, 14, '毛重', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (66, 14, '额定功率', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (67, 15, '颜色', 0, 0, '', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (68, 15, '版本', 0, 1, '512GB,1TB', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (69, 15, '系列', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (70, 15, '型号', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (71, 15, '闪存类型', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (72, 15, '顺序读速', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (73, 15, '顺序写入', 0, 0, '', 0, 0, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attribute_count` int(11) NULL DEFAULT 0 COMMENT '属性数量',
  `param_count` int(11) NULL DEFAULT 0 COMMENT '参数数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品属性分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
INSERT INTO `pms_product_attribute_category` VALUES (1, '服装-T恤', 2, 5);
INSERT INTO `pms_product_attribute_category` VALUES (2, '服装-裤装', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (3, '手机数码-手机通讯', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (4, '配件', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (5, '居家', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (6, '洗护', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (10, '测试分类', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (11, '服装-鞋帽', 3, 0);
INSERT INTO `pms_product_attribute_category` VALUES (12, '家用电器-电视', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (13, '电脑办公-笔记本', 2, 3);
INSERT INTO `pms_product_attribute_category` VALUES (14, '家用电器-厨卫大电', 1, 3);
INSERT INTO `pms_product_attribute_category` VALUES (15, '电脑办公-硬盘', 2, 5);

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_id` bigint(20) NULL DEFAULT NULL,
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 528 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储产品参数信息的表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
INSERT INTO `pms_product_attribute_value` VALUES (1, 9, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (2, 10, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (3, 11, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (4, 12, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (5, 13, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (6, 14, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (7, 18, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (8, 7, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (9, 7, 1, 'XL');
INSERT INTO `pms_product_attribute_value` VALUES (10, 7, 1, 'XXL');
INSERT INTO `pms_product_attribute_value` VALUES (11, 22, 7, 'x,xx');
INSERT INTO `pms_product_attribute_value` VALUES (12, 22, 24, 'no110');
INSERT INTO `pms_product_attribute_value` VALUES (13, 22, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (14, 22, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (15, 22, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (16, 22, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (124, 23, 7, '米白色,浅黄色');
INSERT INTO `pms_product_attribute_value` VALUES (125, 23, 24, 'no1098');
INSERT INTO `pms_product_attribute_value` VALUES (126, 23, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (127, 23, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (128, 23, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (129, 23, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (130, 1, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (131, 1, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (132, 1, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (133, 1, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (134, 1, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (135, 1, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (136, 1, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (137, 1, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (138, 1, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (139, 2, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (140, 2, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (141, 2, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (142, 2, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (143, 2, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (144, 2, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (145, 2, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (146, 2, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (147, 2, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (243, 30, 7, '蓝色,白色');
INSERT INTO `pms_product_attribute_value` VALUES (244, 30, 24, 'HNTBJ2E042A');
INSERT INTO `pms_product_attribute_value` VALUES (245, 30, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (246, 30, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (247, 30, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (248, 30, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (249, 31, 7, '浅灰色,深灰色');
INSERT INTO `pms_product_attribute_value` VALUES (250, 31, 24, 'HNTBJ2E080A');
INSERT INTO `pms_product_attribute_value` VALUES (251, 31, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (252, 31, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (253, 31, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (254, 31, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (255, 32, 7, '黑色,白色');
INSERT INTO `pms_product_attribute_value` VALUES (256, 32, 24, 'HNTBJ2E153A');
INSERT INTO `pms_product_attribute_value` VALUES (257, 32, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (258, 32, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (259, 32, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (260, 32, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (265, 33, 54, '4609652');
INSERT INTO `pms_product_attribute_value` VALUES (266, 33, 55, '28.6kg');
INSERT INTO `pms_product_attribute_value` VALUES (267, 33, 56, '中国大陆');
INSERT INTO `pms_product_attribute_value` VALUES (268, 33, 57, '大屏');
INSERT INTO `pms_product_attribute_value` VALUES (269, 34, 54, '4609660');
INSERT INTO `pms_product_attribute_value` VALUES (270, 34, 55, '30.8kg');
INSERT INTO `pms_product_attribute_value` VALUES (271, 34, 56, '中国大陆');
INSERT INTO `pms_product_attribute_value` VALUES (272, 34, 57, '4K超清');
INSERT INTO `pms_product_attribute_value` VALUES (288, 27, 43, '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (289, 27, 45, '5.8');
INSERT INTO `pms_product_attribute_value` VALUES (290, 27, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (291, 27, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (292, 27, 48, '3000ml');
INSERT INTO `pms_product_attribute_value` VALUES (303, 28, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (304, 28, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (305, 28, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (306, 28, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (307, 28, 48, '2800ml');
INSERT INTO `pms_product_attribute_value` VALUES (308, 29, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (309, 29, 45, '4.7');
INSERT INTO `pms_product_attribute_value` VALUES (310, 29, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (311, 29, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (312, 29, 48, '1960ml');
INSERT INTO `pms_product_attribute_value` VALUES (338, 37, 43, '午夜色,星光色,紫色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (339, 37, 45, '6.1英寸');
INSERT INTO `pms_product_attribute_value` VALUES (340, 37, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (341, 37, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (342, 37, 48, '3000毫安');
INSERT INTO `pms_product_attribute_value` VALUES (443, 38, 43, '银色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (444, 38, 45, '10.9英寸');
INSERT INTO `pms_product_attribute_value` VALUES (445, 38, 46, 'WLAN');
INSERT INTO `pms_product_attribute_value` VALUES (446, 38, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (447, 38, 48, '6000毫安');
INSERT INTO `pms_product_attribute_value` VALUES (448, 39, 58, '新小米Pro 14英寸 2.8K屏,新Redmi Pro 15英寸 3.2K屏');
INSERT INTO `pms_product_attribute_value` VALUES (449, 39, 60, '15.6英寸');
INSERT INTO `pms_product_attribute_value` VALUES (450, 39, 61, '3200*2000');
INSERT INTO `pms_product_attribute_value` VALUES (451, 39, 62, 'R5 6600H');
INSERT INTO `pms_product_attribute_value` VALUES (452, 41, 43, '墨羽,银迹');
INSERT INTO `pms_product_attribute_value` VALUES (453, 41, 45, '6.67英寸');
INSERT INTO `pms_product_attribute_value` VALUES (454, 41, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (455, 41, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (456, 41, 48, '5500mAh');
INSERT INTO `pms_product_attribute_value` VALUES (457, 42, 43, '曜金黑,冰霜银');
INSERT INTO `pms_product_attribute_value` VALUES (458, 42, 45, '6.7英寸');
INSERT INTO `pms_product_attribute_value` VALUES (459, 42, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (460, 42, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (461, 42, 48, '4460mAh');
INSERT INTO `pms_product_attribute_value` VALUES (462, 43, 63, 'JSQ25-565W13【13升】【恒温旗舰款】,JSQ30-565W16【16升】【恒温旗舰款】');
INSERT INTO `pms_product_attribute_value` VALUES (463, 43, 64, '2021-05');
INSERT INTO `pms_product_attribute_value` VALUES (464, 43, 65, '15.5kg');
INSERT INTO `pms_product_attribute_value` VALUES (465, 43, 66, '30w');
INSERT INTO `pms_product_attribute_value` VALUES (466, 44, 67, '新品980｜NVMe PCIe3.0*4,980 PRO｜NVMe PCIe 4.0');
INSERT INTO `pms_product_attribute_value` VALUES (467, 44, 69, '980');
INSERT INTO `pms_product_attribute_value` VALUES (468, 44, 70, 'MZ-V8V500BW');
INSERT INTO `pms_product_attribute_value` VALUES (469, 44, 71, 'TLC');
INSERT INTO `pms_product_attribute_value` VALUES (470, 44, 72, '3100MB/s');
INSERT INTO `pms_product_attribute_value` VALUES (471, 44, 73, '2600MB/s');
INSERT INTO `pms_product_attribute_value` VALUES (472, 45, 43, '鸢尾紫,晴空蓝');
INSERT INTO `pms_product_attribute_value` VALUES (473, 45, 45, '6.43英寸');
INSERT INTO `pms_product_attribute_value` VALUES (474, 45, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (475, 45, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (476, 45, 48, '4500mAh');
INSERT INTO `pms_product_attribute_value` VALUES (477, 40, 43, '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (478, 40, 45, '6.73英寸');
INSERT INTO `pms_product_attribute_value` VALUES (479, 40, 46, '5G');
INSERT INTO `pms_product_attribute_value` VALUES (480, 40, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (481, 40, 48, '5160mAh');
INSERT INTO `pms_product_attribute_value` VALUES (512, 26, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (513, 26, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (514, 26, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (515, 26, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (516, 26, 48, '3000');
INSERT INTO `pms_product_attribute_value` VALUES (517, 46, 7, 'red');
INSERT INTO `pms_product_attribute_value` VALUES (518, 46, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (519, 46, 25, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (520, 46, 37, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (521, 46, 38, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (522, 46, 39, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (523, 47, 43, 'red');
INSERT INTO `pms_product_attribute_value` VALUES (524, 47, 45, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (525, 47, 46, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (526, 47, 47, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (527, 47, 48, NULL);

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(1) NULL DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) NULL DEFAULT NULL,
  `product_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nav_status` int(1) NULL DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
INSERT INTO `pms_product_category` VALUES (1, 0, '服装', 0, 100, '件', 1, 1, 1, NULL, '服装', '服装分类');
INSERT INTO `pms_product_category` VALUES (2, 0, '手机数码', 0, 100, '件', 1, 1, 1, NULL, '手机数码', '手机数码');
INSERT INTO `pms_product_category` VALUES (3, 0, '家用电器', 0, 100, '件', 1, 1, 1, NULL, '家用电器', '家用电器');
INSERT INTO `pms_product_category` VALUES (4, 0, '家具家装', 0, 100, '件', 1, 1, 1, NULL, '家具家装', '家具家装');
INSERT INTO `pms_product_category` VALUES (5, 0, '汽车用品', 0, 100, '件', 1, 1, 1, NULL, '汽车用品', '汽车用品');
INSERT INTO `pms_product_category` VALUES (7, 1, '外套', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac4780cN6087feb5.jpg', '外套', '外套');
INSERT INTO `pms_product_category` VALUES (8, 1, 'T恤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47ffaN8a7b2e14.png', 'T恤', 'T恤');
INSERT INTO `pms_product_category` VALUES (9, 1, '休闲裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47845N7374a31d.jpg', '休闲裤', '休闲裤');
INSERT INTO `pms_product_category` VALUES (10, 1, '牛仔裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac47841Nff658599.jpg', '牛仔裤', '牛仔裤');
INSERT INTO `pms_product_category` VALUES (11, 1, '衬衫', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48007Nb30b2118.jpg', '衬衫', '衬衫分类');
INSERT INTO `pms_product_category` VALUES (13, 12, '家电子分类1', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (14, 12, '家电子分类2', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (19, 2, '手机通讯', 1, 0, '件', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48d27N3f5bb821.jpg', '手机通讯', '手机通讯');
INSERT INTO `pms_product_category` VALUES (29, 1, '男鞋', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (30, 2, '手机配件', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5ac48672N11cf61fe.jpg', '手机配件', '手机配件');
INSERT INTO `pms_product_category` VALUES (31, 2, '摄影摄像', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a1679f2Nc2f659b6.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (32, 2, '影音娱乐', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a167859N01d8198b.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (33, 2, '数码配件', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190519/5a1676e9N1ba70a81.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (34, 2, '智能设备', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (35, 3, '电视', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f71eN25360979.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (36, 3, '空调', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6f6Ndfe746aa.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (37, 3, '洗衣机', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6eaN9ec936de.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (38, 3, '冰箱', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f6c5Ne56d7e26.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (39, 3, '厨卫大电', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a17f369N6a55ff3f.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (40, 3, '厨房小电', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (41, 3, '生活电器', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (42, 3, '个护健康', 1, 0, '', 0, 0, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (43, 4, '厨房卫浴', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb12cN5ab932bb.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (44, 4, '灯饰照明', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb115Na5705672.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (45, 4, '五金工具', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a28e743Nf6d99998.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (46, 4, '卧室家具', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb096N6326e0bd.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (47, 4, '客厅家具', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1eb080N38c2e7b7.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (48, 5, '全新整车', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/ebe31b9cc535e122.png', '', '');
INSERT INTO `pms_product_category` VALUES (49, 5, '车载电器', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1fb8d2N53bbd2ba.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (50, 5, '维修保养', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a1fb8baNbe801af8.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (51, 5, '汽车装饰', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20200607/5a28ae20N34461e66.jpg', '', '');
INSERT INTO `pms_product_category` VALUES (52, 0, '电脑办公', 0, 0, '件', 1, 1, 1, '', '电脑办公', '电脑办公');
INSERT INTO `pms_product_category` VALUES (53, 52, '平板电脑', 1, 0, '件', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/pad_category_01.jpg', '平板电脑', '平板电脑');
INSERT INTO `pms_product_category` VALUES (54, 52, '笔记本', 1, 0, '件', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/computer_category_01.jpg', '笔记本', '笔记本');
INSERT INTO `pms_product_category` VALUES (55, 52, '硬盘', 1, 0, '', 0, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/ssd_category_01.jpg', '硬盘', '');

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `product_attribute_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
INSERT INTO `pms_product_category_attribute_relation` VALUES (1, 24, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (5, 26, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (7, 28, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (9, 25, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (10, 25, 25);

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `full_price` decimal(10, 2) NULL DEFAULT NULL,
  `reduce_price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品满减表(只针对同商品)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
INSERT INTO `pms_product_full_reduction` VALUES (1, 7, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (2, 8, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (3, 9, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (4, 10, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (5, 11, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (6, 12, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (7, 13, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (8, 14, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (9, 18, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (10, 7, 200.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (11, 7, 300.00, 100.00);
INSERT INTO `pms_product_full_reduction` VALUES (14, 22, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (16, 24, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (34, 23, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (78, 36, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (79, 35, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (83, 30, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (84, 31, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (85, 32, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (87, 33, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (88, 34, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (93, 27, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (96, 28, 500.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (97, 28, 1000.00, 120.00);
INSERT INTO `pms_product_full_reduction` VALUES (98, 29, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (104, 37, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (126, 38, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (127, 39, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (128, 41, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (129, 42, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (130, 43, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (131, 44, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (132, 45, 2000.00, 100.00);
INSERT INTO `pms_product_full_reduction` VALUES (133, 40, 2000.00, 200.00);
INSERT INTO `pms_product_full_reduction` VALUES (146, 26, 3000.00, 300.00);
INSERT INTO `pms_product_full_reduction` VALUES (147, 26, 5000.00, 500.00);
INSERT INTO `pms_product_full_reduction` VALUES (148, 46, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (149, 47, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品阶梯价格表(只针对同商品)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
INSERT INTO `pms_product_ladder` VALUES (1, 7, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (2, 8, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (3, 9, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (4, 10, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (5, 11, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (6, 12, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (7, 13, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (8, 14, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (12, 18, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (14, 7, 4, 0.60, 0.00);
INSERT INTO `pms_product_ladder` VALUES (15, 7, 5, 0.50, 0.00);
INSERT INTO `pms_product_ladder` VALUES (18, 22, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (20, 24, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (38, 23, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (83, 36, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (84, 35, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (88, 30, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (89, 31, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (90, 32, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (92, 33, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (93, 34, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (99, 27, 2, 0.80, 0.00);
INSERT INTO `pms_product_ladder` VALUES (100, 27, 3, 0.75, 0.00);
INSERT INTO `pms_product_ladder` VALUES (103, 28, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (104, 29, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (110, 37, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (133, 38, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (134, 39, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (135, 41, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (136, 42, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (137, 43, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (138, 44, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (139, 45, 1, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (140, 40, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (147, 26, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (148, 46, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (149, 47, 0, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `price_old` decimal(10, 2) NULL DEFAULT NULL,
  `price_new` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_old` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_new` decimal(10, 2) NULL DEFAULT NULL,
  `gift_point_old` int(11) NULL DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int(11) NULL DEFAULT NULL,
  `use_point_limit_old` int(11) NULL DEFAULT NULL,
  `use_point_limit_new` int(11) NULL DEFAULT NULL,
  `operate_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `vertify_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `status` int(1) NULL DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品审核记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
INSERT INTO `pms_product_vertify_record` VALUES (1, 1, '2018-04-27 16:36:41', 'test', 1, '验证通过');
INSERT INTO `pms_product_vertify_record` VALUES (2, 2, '2018-04-27 16:36:41', 'test', 1, '验证通过');

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编码',
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT 0 COMMENT '库存',
  `low_stock` int(11) NULL DEFAULT NULL COMMENT '预警库存',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int(11) NULL DEFAULT 0 COMMENT '锁定库存',
  `sp_data` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性，json格式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 245 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku的库存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES (98, 27, '201808270027001', 2699.00, 86, NULL, NULL, NULL, NULL, -24, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (99, 27, '201808270027002', 2999.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (100, 27, '201808270027003', 2699.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (101, 27, '201808270027004', 2999.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (102, 28, '201808270028001', 649.00, 99, NULL, NULL, NULL, NULL, -8, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (103, 28, '201808270028002', 699.00, 99, NULL, NULL, NULL, NULL, -8, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (104, 28, '201808270028003', 649.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (105, 28, '201808270028004', 699.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (106, 29, '201808270029001', 5499.00, 99, NULL, NULL, NULL, 4999.00, -8, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (107, 29, '201808270029002', 6299.00, 100, NULL, NULL, NULL, 5799.00, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (108, 29, '201808270029003', 5499.00, 100, NULL, NULL, NULL, 4999.00, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (109, 29, '201808270029004', 6299.00, 100, NULL, NULL, NULL, 5799.00, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (110, 26, '201806070026001', 3788.00, 487, NULL, NULL, NULL, 3699.00, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (111, 26, '201806070026002', 3999.00, 499, NULL, NULL, NULL, 3899.00, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (112, 26, '201806070026003', 3788.00, 500, NULL, NULL, NULL, 3699.00, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (113, 26, '201806070026004', 3999.00, 500, NULL, NULL, NULL, 3899.00, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (163, 36, '202002210036001', 100.00, 100, 25, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (164, 36, '202002210036002', 120.00, 98, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (165, 36, '202002210036003', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (166, 36, '202002210036004', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (167, 36, '202002210036005', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (168, 36, '202002210036006', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (169, 36, '202002210036007', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (170, 36, '202002210036008', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (171, 35, '202002250035001', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (172, 35, '202002250035002', 240.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (173, 35, '202002250035003', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (174, 35, '202002250035004', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (175, 35, '202002250035005', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (176, 35, '202002250035006', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (177, 35, '202002250035007', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (178, 35, '202002250035008', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (179, 30, '202004190030001', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (180, 30, '202004190030002', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (181, 30, '202004190030003', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (182, 30, '202004190030004', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (183, 30, '202004190030005', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (184, 30, '202004190030006', 88.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (185, 31, '202004190031001', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"浅灰色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (186, 31, '202004190031002', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"浅灰色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (187, 31, '202004190031003', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"深灰色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (188, 31, '202004190031004', 88.00, 80, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"深灰色\"},{\"key\":\"尺寸\",\"value\":\"XL\"}]');
INSERT INTO `pms_sku_stock` VALUES (189, 32, '202004190032001', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (190, 32, '202004190032002', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (191, 32, '202004190032003', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"X\"}]');
INSERT INTO `pms_sku_stock` VALUES (192, 32, '202004190032004', 99.00, 100, 10, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (193, 33, '202004190033001', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"50英寸\"},{\"key\":\"内存\",\"value\":\"8G\"}]');
INSERT INTO `pms_sku_stock` VALUES (194, 33, '202004190033002', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"50英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (195, 33, '202004190033003', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"8G\"}]');
INSERT INTO `pms_sku_stock` VALUES (196, 33, '202004190033004', 2499.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (197, 34, '202004190034001', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (198, 34, '202004190034002', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"65英寸\"},{\"key\":\"内存\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (199, 34, '202004190034003', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"70英寸\"},{\"key\":\"内存\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (200, 34, '202004190034004', 3999.00, 500, 10, NULL, NULL, NULL, 0, '[{\"key\":\"尺寸\",\"value\":\"70英寸\"},{\"key\":\"内存\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (201, 37, '202210280037001', 5999.00, 195, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 1, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (202, 37, '202210280037002', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (203, 37, '202210280037003', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"午夜色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (204, 37, '202210280037004', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (205, 37, '202210280037005', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (206, 37, '202210280037006', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"星光色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (207, 37, '202210280037007', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"紫色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (208, 37, '202210280037008', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"紫色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (209, 37, '202210280037009', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_003.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"紫色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (210, 37, '202210280037010', 5999.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (211, 37, '202210280037011', 6899.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (212, 37, '202210280037012', 8699.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/iphone14_004.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"512G\"}]');
INSERT INTO `pms_sku_stock` VALUES (213, 38, '202210280038001', 3599.00, 198, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (214, 38, '202210280038002', 4799.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (215, 38, '202210280038003', 3599.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (216, 38, '202210280038004', 4799.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/ipad_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (217, 39, '202210280039001', 5999.00, 499, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (218, 39, '202210280039002', 5599.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_001.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新小米Pro 14英寸 2.8K屏\"},{\"key\":\"版本\",\"value\":\"R5 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (219, 39, '202210280039003', 5499.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新Redmi Pro 15英寸 3.2K屏\"},{\"key\":\"版本\",\"value\":\"R7 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (220, 39, '202210280039004', 4999.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221028/xiaomi_computer_002.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新Redmi Pro 15英寸 3.2K屏\"},{\"key\":\"版本\",\"value\":\"R5 16G 512\"}]');
INSERT INTO `pms_sku_stock` VALUES (221, 40, '202211040040001', 2999.00, 91, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (222, 40, '202211040040002', 3499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (223, 40, '202211040040003', 2999.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (224, 40, '202211040040004', 3499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/xiaomi_12_pro_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (225, 41, '202211040041001', 2099.00, 195, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (226, 41, '202211040041002', 2299.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"墨羽\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (227, 41, '202211040041003', 2099.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银迹\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (228, 41, '202211040041004', 2299.00, 200, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/redmi_k50_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银迹\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (229, 42, '202211040042001', 4999.00, 99, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (230, 42, '202211040042002', 5499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"曜金黑\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (231, 42, '202211040042003', 4999.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"冰霜银\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (232, 42, '202211040042004', 5499.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/huawei_mate50_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"冰霜银\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (233, 43, '202211040043001', 1649.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', NULL, NULL, 0, '[{\"key\":\"系列\",\"value\":\"JSQ25-565W13【13升】【恒温旗舰款】\"}]');
INSERT INTO `pms_sku_stock` VALUES (234, 43, '202211040043002', 1799.00, 500, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221104/wanhe_13L_01.png', NULL, NULL, 0, '[{\"key\":\"系列\",\"value\":\"JSQ30-565W16【16升】【恒温旗舰款】\"}]');
INSERT INTO `pms_sku_stock` VALUES (235, 44, '202211080044001', 369.00, 99, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `pms_sku_stock` VALUES (236, 44, '202211080044002', 649.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"新品980｜NVMe PCIe3.0*4\"},{\"key\":\"版本\",\"value\":\"1TB\"}]');
INSERT INTO `pms_sku_stock` VALUES (237, 44, '202211080044003', 549.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"980 PRO｜NVMe PCIe 4.0\"},{\"key\":\"版本\",\"value\":\"512GB\"}]');
INSERT INTO `pms_sku_stock` VALUES (238, 44, '202211080044004', 899.00, 100, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_ssd_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"980 PRO｜NVMe PCIe 4.0\"},{\"key\":\"版本\",\"value\":\"1TB\"}]');
INSERT INTO `pms_sku_stock` VALUES (239, 45, '202211080045001', 2299.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (240, 45, '202211080045002', 2499.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_01.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"鸢尾紫\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (241, 45, '202211080045003', 2299.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"晴空蓝\"},{\"key\":\"容量\",\"value\":\"128G\"}]');
INSERT INTO `pms_sku_stock` VALUES (242, 45, '202211080045004', 2499.00, 250, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_r8_02.jpg', NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"晴空蓝\"},{\"key\":\"容量\",\"value\":\"256G\"}]');
INSERT INTO `pms_sku_stock` VALUES (243, 46, '202502050046001', NULL, NULL, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"red\"},{\"key\":\"尺寸\",\"value\":\"M\"}]');
INSERT INTO `pms_sku_stock` VALUES (244, 47, '202502050047001', NULL, NULL, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"red\"},{\"key\":\"容量\",\"value\":\"32G\"}]');

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) NULL DEFAULT NULL COMMENT '优惠券类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` int(1) NULL DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) NULL DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `use_type` int(1) NULL DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) NULL DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) NULL DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) NULL DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime(0) NULL DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠码',
  `member_level` int(1) NULL DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES (27, 0, '全品类通用券', 0, 94, 10.00, 10, 100.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 0, NULL, 100, 0, 6, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (28, 0, '手机分类专用券', 0, 995, 100.00, 5, 1000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 1, NULL, 1000, 0, 5, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (29, 0, '苹果手机专用券', 0, 998, 600.00, 1, 4000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 2, NULL, 1000, 0, 2, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (30, 0, '小米手机专用券', 0, 998, 200.00, 1, 2000.00, '2022-11-08 00:00:00', '2023-11-30 00:00:00', 2, NULL, 1000, 0, 2, '2022-11-08 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (31, 0, '限时优惠券', 0, 999, 20.00, 5, 500.00, '2022-12-01 00:00:00', '2022-12-22 00:00:00', 0, NULL, 1000, 0, 1, '2022-12-23 00:00:00', NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `coupon_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `member_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int(1) NULL DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `use_status` int(1) NULL DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_coupon_id`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券使用、领取历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
INSERT INTO `sms_coupon_history` VALUES (37, 30, 1, '7806895974110001', 'windir', 1, '2022-11-09 15:14:29', 1, '2022-11-09 15:14:58', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (38, 27, 1, '7872472849240001', 'windir', 1, '2022-11-09 15:25:25', 1, '2022-11-09 15:25:38', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (39, 29, 1, '7876204111480001', 'windir', 1, '2022-11-09 15:26:02', 1, '2022-11-09 15:26:11', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (40, 27, 1, '7911945030190001', 'windir', 1, '2022-11-09 15:31:59', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (41, 28, 1, '8194868687790001', 'windir', 1, '2022-11-09 16:19:09', 1, '2022-11-11 16:12:42', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (42, 28, 1, '1239565720390001', 'test', 1, '2022-12-21 16:46:36', 1, '2022-12-21 16:53:07', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (43, 31, 1, '6030247208280001', 'test', 1, '2022-12-23 09:51:42', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (44, 28, 1, '6050939443480001', 'test', 1, '2022-12-23 09:55:09', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (45, 27, 1, '4182437014580001', 'test', 1, '2023-01-10 17:10:24', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (46, 27, 11, '9011281751500011', 'member', 1, '2023-05-11 15:28:33', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (47, 28, 11, '9011495851370011', 'member', 1, '2023-05-11 15:28:35', 1, '2023-05-11 15:37:16', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (48, 30, 11, '9011677197430011', 'member', 1, '2023-05-11 15:28:37', 1, '2023-05-11 15:28:56', NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (49, 27, 11, '9046676666610011', 'member', 1, '2023-05-11 15:34:27', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (50, 28, 11, '9046909751910011', 'member', 1, '2023-05-11 15:34:29', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (51, 29, 11, '9047077722990011', 'member', 1, '2023-05-11 15:34:31', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (52, 27, 11, '9075818288630011', 'member', 1, '2023-05-11 15:39:18', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  `product_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券和产品分类关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_category_relation` VALUES (11, 28, 19, '手机通讯', '手机数码');

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券和产品的关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_relation` VALUES (18, 29, 37, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', '100038005189');
INSERT INTO `sms_coupon_product_relation` VALUES (19, 29, 29, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '7437799');
INSERT INTO `sms_coupon_product_relation` VALUES (21, 30, 41, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量 墨羽 12GB+256GB 5G智能手机 小米 红米', '100035246702');
INSERT INTO `sms_coupon_product_relation` VALUES (22, 30, 40, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', '100027789721');

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '秒杀时间段名称',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `status` int(1) NULL DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
INSERT INTO `sms_flash_promotion` VALUES (14, '双11特卖活动', '2022-11-09', '2023-12-31', 1, '2022-11-09 14:56:48');

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `member_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subscribe_time` datetime(0) NULL DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购通知记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint(20) NULL DEFAULT NULL,
  `flash_promotion_session_id` bigint(20) NULL DEFAULT NULL COMMENT '编号',
  `product_id` bigint(20) NULL DEFAULT NULL,
  `flash_promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int(11) NULL DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int(11) NULL DEFAULT NULL COMMENT '每人限购数量',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品限时购与商品关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
INSERT INTO `sms_flash_promotion_product_relation` VALUES (1, 2, 1, 26, 3000.00, 10, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (2, 2, 1, 27, 2000.00, 10, 1, 20);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (3, 2, 1, 28, 599.00, 19, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (4, 2, 1, 29, 4999.00, 10, 1, 100);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (9, 2, 2, 26, 2999.00, 100, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (10, 2, 2, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (11, 2, 2, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (12, 2, 2, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (13, 2, 2, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (14, 2, 3, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (15, 2, 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (16, 2, 4, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (17, 2, 4, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (18, 2, 5, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (19, 2, 6, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (20, 2, 6, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (21, 14, 1, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (22, 14, 1, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (23, 14, 1, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (24, 14, 1, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (25, 14, 2, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (26, 14, 2, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (27, 14, 2, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (28, 14, 2, 35, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (29, 14, 3, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (30, 14, 3, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (31, 14, 3, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (32, 14, 3, 37, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (33, 14, 4, 37, 5699.00, 10, 1, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (34, 14, 4, 38, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (35, 14, 4, 39, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (36, 14, 4, 40, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (37, 14, 5, 41, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (38, 14, 5, 42, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (39, 14, 5, 43, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (40, 14, 5, 44, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (41, 14, 5, 45, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (42, 14, 6, 26, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (43, 14, 6, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (44, 14, 6, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (45, 14, 6, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (46, 14, 6, 30, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (47, 14, 7, 31, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (48, 14, 7, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (49, 14, 7, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (50, 14, 7, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (51, 14, 7, 35, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场次名称',
  `start_time` time(0) NULL DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time(0) NULL DEFAULT NULL COMMENT '每日结束时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购场次表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session` VALUES (1, '8:00', '08:00:00', '10:00:00', 1, '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES (2, '10:00', '10:00:00', '12:00:00', 1, '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES (3, '12:00', '12:00:00', '14:00:00', 1, '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES (4, '14:00', '14:00:00', '16:00:00', 1, '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES (5, '16:00', '16:00:00', '18:00:00', 1, '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES (6, '18:00', '18:00:00', '20:00:00', 1, '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES (7, '20:00', '20:00:00', '22:00:00', 1, '2018-11-16 13:22:55');

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int(11) NULL DEFAULT NULL COMMENT '点击数',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页轮播广告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
INSERT INTO `sms_home_advertise` VALUES (2, '夏季大热促销', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/ad1.jpg', '2018-11-01 14:01:37', '2018-11-15 14:01:37', 0, 0, 0, NULL, '夏季大热促销', 0);
INSERT INTO `sms_home_advertise` VALUES (3, '夏季大热促销1', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/ad1.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', 0, 0, 0, NULL, '夏季大热促销1', 0);
INSERT INTO `sms_home_advertise` VALUES (4, '夏季大热促销2', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190525/ad2.jpg', '2018-11-13 14:01:37', '2018-11-13 14:01:37', 0, 0, 0, NULL, '夏季大热促销2', 0);
INSERT INTO `sms_home_advertise` VALUES (9, '电影推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2018-11-24 00:00:00', 0, 0, 0, 'www.baidu.com', '电影推荐广告', 100);
INSERT INTO `sms_home_advertise` VALUES (10, '汽车促销广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', 0, 0, 0, 'xxx', NULL, 99);
INSERT INTO `sms_home_advertise` VALUES (11, '汽车推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg', '2018-11-13 00:00:00', '2018-11-30 00:00:00', 0, 0, 0, 'xxx', NULL, 98);
INSERT INTO `sms_home_advertise` VALUES (12, '小米推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/xiaomi_banner_01.png', '2022-11-08 17:04:03', '2023-11-08 17:04:05', 1, 0, 0, '/pages/brand/brandDetail?id=6', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (13, '华为推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/huawei_banner_01.png', '2022-11-08 17:10:27', '2023-11-08 17:10:28', 1, 0, 0, '/pages/brand/brandDetail?id=3', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (14, '苹果推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/apple_banner_01.png', '2022-11-08 17:12:54', '2023-11-08 17:12:55', 1, 0, 0, '/pages/brand/brandDetail?id=51', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (15, '三星推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/sanxing_banner_01.png', '2022-11-08 17:15:38', '2023-11-08 17:15:39', 1, 0, 0, '/pages/brand/brandDetail?id=2', NULL, 0);
INSERT INTO `sms_home_advertise` VALUES (16, 'OPPO推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20221108/oppo_banner_01.png', '2022-11-08 17:20:10', '2023-11-08 17:20:11', 1, 0, 0, '/pages/brand/brandDetail?id=21', NULL, 0);

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NULL DEFAULT NULL,
  `brand_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
INSERT INTO `sms_home_brand` VALUES (6, 6, '小米', 1, 300);
INSERT INTO `sms_home_brand` VALUES (32, 50, '海澜之家', 1, 198);
INSERT INTO `sms_home_brand` VALUES (33, 51, '苹果', 1, 199);
INSERT INTO `sms_home_brand` VALUES (34, 2, '三星', 1, 195);
INSERT INTO `sms_home_brand` VALUES (35, 3, '华为', 1, 200);
INSERT INTO `sms_home_brand` VALUES (39, 21, 'OPPO', 1, 197);
INSERT INTO `sms_home_brand` VALUES (45, 1, '万和', 1, 0);
INSERT INTO `sms_home_brand` VALUES (46, 5, '方太', 1, 0);
INSERT INTO `sms_home_brand` VALUES (47, 4, '格力', 1, 0);

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新鲜好物表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
INSERT INTO `sms_home_new_product` VALUES (19, 37, 'Apple iPhone 14 (A2884) 128GB 支持移动联通电信5G 双卡双待手机', 1, 197);
INSERT INTO `sms_home_new_product` VALUES (20, 38, 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (21, 39, '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑(新R5-6600H标压 16G 512G win11)', 1, 198);
INSERT INTO `sms_home_new_product` VALUES (22, 40, '小米12 Pro 天玑版 天玑9000+处理器 5000万疾速影像 2K超视感屏 120Hz高刷 67W快充 12GB+256GB 黑色 5G手机', 1, 200);
INSERT INTO `sms_home_new_product` VALUES (23, 41, 'Redmi K50 天玑8100 2K柔性直屏 OIS光学防抖 67W快充 5500mAh大电量 墨羽 12GB+256GB 5G智能手机 小米 红米', 1, 199);
INSERT INTO `sms_home_new_product` VALUES (24, 42, 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息 低电量应急模式 128GB曜金黑华为鸿蒙手机', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (25, 44, '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议) 980（MZ-V8V500BW）', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (26, 45, 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄 3200万前置索尼镜头 5G手机', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (27, 43, '万和（Vanward)燃气热水器天然气家用四重防冻直流变频节能全新升级增压水伺服恒温高抗风 JSQ30-565W16【16升】【恒温旗舰款】', 1, 0);

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人气推荐商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
INSERT INTO `sms_home_recommend_product` VALUES (10, 38, 'Apple iPad 10.9英寸平板电脑 2022年款（64GB WLAN版/A14芯片/1200万像素/iPadOS MPQ03CH/A ）', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (11, 39, '小米 Xiaomi Book Pro 14 2022 锐龙版 2.8K超清大师屏 高端轻薄笔记本电脑(新R5-6600H标压 16G 512G win11)', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (12, 44, '三星（SAMSUNG）500GB SSD固态硬盘 M.2接口(NVMe协议) 980（MZ-V8V500BW）', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (13, 43, '万和（Vanward)燃气热水器天然气家用四重防冻直流变频节能全新升级增压水伺服恒温高抗风 JSQ30-565W16【16升】【恒温旗舰款】', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (14, 45, 'OPPO Reno8 8GB+128GB 鸢尾紫 新配色上市 80W超级闪充 5000万水光人像三摄 3200万前置索尼镜头 5G手机', 1, 0);

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL,
  `subject_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `recommend_status` int(1) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
INSERT INTO `sms_home_recommend_subject` VALUES (14, 1, 'polo衬衫的也时尚', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (15, 2, '大牌手机低价秒', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (16, 3, '晓龙845新品上市', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (17, 4, '夏天应该穿什么', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (18, 5, '夏季精选', 1, 100);
INSERT INTO `sms_home_recommend_subject` VALUES (19, 6, '品牌手机降价', 1, 0);

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `sales_channel_id` bigint(20) NULL DEFAULT NULL,
  `order_country_num` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (1, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 'test@qq.com', '测试账号', NULL, NULL, NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1);
INSERT INTO `ums_admin` VALUES (3, 'admin', '$2a$10$.E1FokumK5GIXWgKlg.Hc.i/0/2.qdAwYFL1zc5QHdyzpXOr38RZO', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_01.png', 'admin@163.com', '系统管理员', '系统管理员', 2547, '中国', '2018-10-08 13:32:47', '2019-04-20 12:45:16', 1);
INSERT INTO `ums_admin` VALUES (4, 'macro', '$2a$10$Bx4jZPR7GhEpIQfefDQtVeS58GfT5n6mxs/b4nLLK65eMFa16topa', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_01.png', 'macro@qq.com', 'macro', 'macro专用', NULL, NULL, '2019-10-06 15:53:51', '2020-02-03 14:55:55', 1);
INSERT INTO `ums_admin` VALUES (6, 'productAdmin', '$2a$10$6/.J.p.6Bhn7ic4GfoB5D.pGd7xSiD1a9M6ht6yO0fxzlKJPjRAGm', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_03.png', 'product@qq.com', '商品管理员', '只有商品权限', NULL, NULL, '2020-02-07 16:15:08', NULL, 1);
INSERT INTO `ums_admin` VALUES (7, 'orderAdmin', '$2a$10$UqEhA9UZXjHHA3B.L9wNG.6aerrBjC6WHTtbv1FdvYPUI.7lkL6E.', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_04.png', 'order@qq.com', '订单管理员', '只有订单管理权限', NULL, NULL, '2020-02-07 16:15:50', NULL, 1);
INSERT INTO `ums_admin` VALUES (8, 'test123', '$2a$10$M1qJguEzwoAN0la7PB8UO.HOGe1xZGku7xw1iTaUUpY0ZVRCxrxoO', 'string', 'abc@qq.com', 'string', 'string', 2547, NULL, '2022-08-07 14:45:42', NULL, 1);
INSERT INTO `ums_admin` VALUES (9, 'test256', '$2a$10$kTMBrt8mkXcO8T4eHThFWOf3KuNK6tqevkiAf4YbtXtaCJ6ocYkJa', 'string', 'abc@qq.com', 'string', 'string', 3742, NULL, '2022-08-07 14:52:57', NULL, 1);
INSERT INTO `ums_admin` VALUES (10, 'test1267', '$2a$10$VUywDhXVPY13YZxMD/uPWeDqkzSozN7o8u/3MX6sBig2NK2VaTJZ2', NULL, 'test1267@qq.com', 'test1267', 'test1267', 1264, NULL, '2023-01-04 16:13:34', NULL, 1);
INSERT INTO `ums_admin` VALUES (11, 'test123', '$2a$10$M1qJguEzwoAN0la7PB8UO.HOGe1xZGku7xw1iTaUUpY0ZVRCxrxoO', 'string', 'abc@qq.com', 'string', 'string', NULL, NULL, '2022-08-07 14:45:42', NULL, 1);
INSERT INTO `ums_admin` VALUES (12, 'test123', '$2a$10$M1qJguEzwoAN0la7PB8UO.HOGe1xZGku7xw1iTaUUpY0ZVRCxrxoO', 'string', 'abc@qq.com', 'string', 'string', NULL, NULL, '2022-08-07 14:45:42', NULL, 1);

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 468 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES (1, 3, '2018-12-23 14:27:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (2, 3, '2019-04-07 16:04:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (3, 3, '2019-04-08 21:47:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (4, 3, '2019-04-08 21:48:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (5, 3, '2019-04-18 22:18:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (6, 3, '2019-04-20 12:45:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (7, 3, '2019-05-19 14:52:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (8, 3, '2019-05-25 15:00:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (9, 3, '2019-06-19 20:11:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (10, 3, '2019-06-30 10:33:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (11, 3, '2019-06-30 10:34:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (12, 3, '2019-06-30 10:35:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (13, 3, '2019-07-27 17:11:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (14, 3, '2019-07-27 17:13:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (15, 3, '2019-07-27 17:15:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (16, 3, '2019-07-27 17:17:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (17, 3, '2019-07-27 17:18:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (18, 3, '2019-07-27 21:21:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (19, 3, '2019-07-27 21:34:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (20, 3, '2019-07-27 21:35:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (21, 3, '2019-07-27 21:35:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (22, 3, '2019-07-27 21:40:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (23, 3, '2019-08-18 16:00:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (24, 3, '2019-08-18 16:01:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (25, 3, '2019-08-18 16:47:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (26, 3, '2019-10-06 15:54:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (27, 3, '2019-10-06 16:03:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (28, 3, '2019-10-06 16:04:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (29, 3, '2019-10-06 16:06:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (30, 3, '2019-10-06 16:14:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (31, 1, '2019-10-06 16:15:09', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (32, 1, '2019-10-06 16:16:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (33, 3, '2019-10-06 16:16:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (34, 3, '2019-10-06 16:16:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (35, 3, '2019-10-07 15:20:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (36, 3, '2019-10-07 15:40:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (37, 3, '2019-10-07 16:34:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (38, 3, '2019-10-09 21:19:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (39, 4, '2019-10-09 21:30:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (40, 4, '2019-10-09 21:31:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (41, 4, '2019-10-09 21:32:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (42, 4, '2019-10-09 21:33:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (43, 4, '2019-10-09 21:33:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (44, 3, '2019-10-20 16:02:53', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (45, 3, '2019-10-23 21:20:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (46, 3, '2019-10-27 21:41:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (47, 3, '2019-11-09 16:44:57', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (48, 3, '2019-11-09 16:46:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (49, 3, '2019-11-09 16:49:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (50, 3, '2019-11-23 14:17:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (51, 6, '2019-11-23 14:52:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (52, 3, '2019-11-23 15:07:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (53, 3, '2019-11-30 21:25:30', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (54, 3, '2019-11-30 21:27:54', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (55, 3, '2019-12-28 15:23:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (56, 3, '2020-01-01 15:21:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (57, 3, '2020-01-04 16:00:54', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (58, 3, '2020-02-01 15:05:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (59, 3, '2020-02-01 15:36:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (60, 3, '2020-02-01 15:36:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (61, 3, '2020-02-01 15:37:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (62, 3, '2020-02-01 15:37:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (63, 3, '2020-02-01 15:38:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (64, 3, '2020-02-01 15:38:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (65, 3, '2020-02-01 15:39:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (66, 3, '2020-02-01 15:41:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (67, 3, '2020-02-01 15:43:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (68, 3, '2020-02-01 15:44:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (69, 3, '2020-02-01 15:45:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (70, 3, '2020-02-01 15:46:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (71, 3, '2020-02-01 15:48:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (72, 3, '2020-02-01 16:00:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (73, 3, '2020-02-01 16:07:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (74, 3, '2020-02-01 16:08:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (75, 3, '2020-02-02 15:28:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (76, 3, '2020-02-02 15:44:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (77, 3, '2020-02-02 15:45:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (78, 3, '2020-02-02 15:52:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (79, 3, '2020-02-02 15:53:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (80, 3, '2020-02-02 15:54:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (81, 3, '2020-02-02 16:01:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (82, 3, '2020-02-02 16:05:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (83, 3, '2020-02-02 16:06:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (84, 3, '2020-02-02 16:17:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (85, 3, '2020-02-02 16:18:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (86, 3, '2020-02-02 16:19:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (87, 3, '2020-02-02 16:19:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (88, 3, '2020-02-02 16:22:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (89, 3, '2020-02-02 16:23:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (90, 3, '2020-02-02 16:23:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (91, 3, '2020-02-02 16:24:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (92, 3, '2020-02-02 16:25:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (93, 3, '2020-02-02 16:26:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (94, 3, '2020-02-02 16:26:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (95, 3, '2020-02-02 16:27:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (96, 3, '2020-02-02 16:31:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (97, 3, '2020-02-02 16:31:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (98, 3, '2020-02-02 16:31:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (99, 3, '2020-02-02 16:31:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (100, 3, '2020-02-02 16:33:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (101, 3, '2020-02-02 16:33:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (102, 3, '2020-02-02 16:34:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (103, 3, '2020-02-02 16:38:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (104, 3, '2020-02-02 16:39:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (105, 3, '2020-02-02 16:42:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (106, 3, '2020-02-02 16:46:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (107, 3, '2020-02-02 16:50:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (108, 3, '2020-02-02 16:51:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (109, 3, '2020-02-02 16:51:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (110, 3, '2020-02-02 16:52:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (111, 3, '2020-02-02 17:01:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (112, 3, '2020-02-03 10:43:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (113, 3, '2020-02-03 10:45:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (114, 3, '2020-02-03 10:46:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (115, 3, '2020-02-03 10:54:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (116, 3, '2020-02-03 14:24:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (117, 3, '2020-02-03 14:25:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (118, 5, '2020-02-03 15:22:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (119, 5, '2020-02-03 15:23:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (120, 5, '2020-02-03 15:24:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (121, 3, '2020-02-03 15:24:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (122, 5, '2020-02-03 15:27:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (123, 3, '2020-02-03 15:27:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (124, 3, '2020-02-03 15:29:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (125, 5, '2020-02-03 15:33:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (126, 3, '2020-02-03 15:33:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (127, 1, '2020-02-03 15:34:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (128, 3, '2020-02-03 15:34:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (129, 3, '2020-02-04 14:14:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (130, 3, '2020-02-05 10:33:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (131, 3, '2020-02-05 10:36:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (132, 3, '2020-02-05 16:34:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (133, 4, '2020-02-05 16:58:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (134, 3, '2020-02-05 16:59:03', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (135, 3, '2020-02-06 10:25:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (136, 3, '2020-02-07 14:34:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (137, 3, '2020-02-07 14:36:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (138, 1, '2020-02-07 14:43:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (139, 3, '2020-02-07 15:18:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (140, 3, '2020-02-07 15:20:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (141, 3, '2020-02-07 15:22:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (142, 3, '2020-02-07 15:22:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (143, 3, '2020-02-07 15:55:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (144, 3, '2020-02-07 15:56:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (145, 3, '2020-02-07 15:58:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (146, 6, '2020-02-07 16:16:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (147, 7, '2020-02-07 16:16:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (148, 3, '2020-02-07 16:18:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (149, 7, '2020-02-07 16:20:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (150, 3, '2020-02-07 16:20:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (151, 3, '2020-02-07 16:32:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (152, 3, '2020-02-07 19:32:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (153, 3, '2020-02-07 19:32:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (154, 3, '2020-02-07 19:33:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (155, 3, '2020-02-07 19:33:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (156, 3, '2020-02-07 19:33:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (157, 3, '2020-02-07 19:35:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (158, 3, '2020-02-07 19:37:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (159, 3, '2020-02-07 19:37:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (160, 3, '2020-02-07 19:37:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (161, 3, '2020-02-07 19:45:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (162, 3, '2020-02-07 19:47:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (163, 3, '2020-02-07 20:02:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (164, 6, '2020-02-07 20:10:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (165, 6, '2020-02-07 20:11:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (166, 6, '2020-02-07 20:13:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (167, 6, '2020-02-07 20:17:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (168, 3, '2020-02-07 20:17:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (169, 6, '2020-02-07 20:18:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (170, 3, '2020-02-10 10:28:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (171, 3, '2020-02-10 10:45:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (172, 3, '2020-02-10 10:57:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (173, 3, '2020-02-10 10:59:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (174, 3, '2020-02-10 11:04:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (175, 3, '2020-02-10 11:05:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (176, 3, '2020-02-10 11:06:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (177, 3, '2020-02-10 11:07:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (178, 3, '2020-02-10 11:08:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (179, 3, '2020-02-10 11:10:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (180, 6, '2020-02-10 14:25:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (181, 6, '2020-02-10 14:29:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (182, 3, '2020-02-10 16:09:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (183, 3, '2020-02-20 14:39:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (184, 8, '2020-02-20 17:14:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (185, 8, '2020-02-20 17:17:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (186, 8, '2020-02-20 17:17:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (187, 8, '2020-02-21 10:26:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (188, 8, '2020-02-21 10:28:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (189, 8, '2020-02-21 10:32:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (190, 8, '2020-02-21 10:33:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (191, 8, '2020-02-21 10:35:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (192, 8, '2020-02-21 10:36:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (193, 3, '2020-02-21 11:10:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (194, 3, '2020-02-25 16:11:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (195, 3, '2020-02-25 16:46:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (196, 3, '2020-03-07 16:33:59', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (197, 6, '2020-03-07 16:35:38', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (198, 3, '2020-03-07 17:00:09', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (199, 3, '2020-03-14 14:32:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (200, 8, '2020-03-14 14:32:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (201, 3, '2020-03-14 14:33:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (202, 8, '2020-03-14 14:34:57', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (203, 3, '2020-03-14 14:35:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (204, 8, '2020-03-14 14:36:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (205, 3, '2020-03-14 14:36:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (206, 8, '2020-03-14 14:37:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (207, 3, '2020-03-14 14:37:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (208, 8, '2020-03-14 14:38:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (209, 3, '2020-03-14 14:38:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (210, 8, '2020-03-14 14:39:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (211, 3, '2020-03-14 14:39:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (212, 3, '2020-03-15 14:23:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (213, 3, '2020-03-22 14:33:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (214, 3, '2020-03-22 14:59:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (215, 3, '2020-03-22 15:04:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (216, 3, '2020-03-29 16:14:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (217, 3, '2020-03-29 17:17:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (218, 3, '2020-04-06 16:54:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (219, 3, '2020-04-12 15:01:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (220, 3, '2020-04-19 09:50:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (221, 3, '2020-05-04 10:45:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (222, 3, '2020-05-05 11:02:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (223, 3, '2020-05-16 15:17:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (224, 3, '2020-05-17 14:58:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (225, 3, '2020-05-18 15:47:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (226, 3, '2020-05-23 16:51:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (227, 3, '2020-05-23 16:54:53', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (228, 3, '2020-05-23 17:00:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (229, 3, '2020-05-24 10:38:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (230, 3, '2020-06-07 09:39:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (231, 3, '2020-06-14 14:23:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (232, 3, '2020-06-14 17:11:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (233, 3, '2020-06-20 14:53:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (234, 3, '2020-06-21 14:57:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (235, 3, '2020-06-27 10:41:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (236, 3, '2020-07-05 15:54:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (237, 3, '2020-07-11 10:40:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (238, 3, '2020-07-11 10:45:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (239, 3, '2020-07-19 11:00:16', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (240, 3, '2020-07-19 11:46:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (241, 3, '2020-07-19 11:53:47', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (242, 3, '2020-07-19 14:17:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (243, 3, '2020-07-19 14:44:24', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (244, 3, '2020-07-19 14:44:58', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (245, 3, '2020-07-19 14:48:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (246, 3, '2020-07-19 14:48:57', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (247, 3, '2020-07-19 14:49:30', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (248, 3, '2020-07-19 14:50:18', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (249, 3, '2020-07-19 14:51:51', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (250, 3, '2020-07-19 14:55:27', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (251, 3, '2020-07-19 14:58:14', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (252, 6, '2020-07-19 15:04:21', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (253, 3, '2020-07-19 15:38:49', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (254, 6, '2020-07-19 16:26:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (255, 3, '2020-08-08 10:39:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (256, 3, '2020-08-09 11:06:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (257, 3, '2020-08-10 20:41:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (258, 3, '2020-08-15 10:12:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (259, 1, '2020-08-19 21:23:59', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (260, 1, '2020-08-19 21:25:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (261, 3, '2020-09-05 16:14:50', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (262, 3, '2020-09-05 16:15:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (263, 3, '2020-09-12 16:07:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (264, 6, '2020-09-12 16:08:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (265, 1, '2020-09-12 16:08:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (266, 6, '2020-09-12 16:09:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (267, 1, '2020-09-12 16:09:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (268, 3, '2020-09-13 14:22:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (269, 3, '2020-09-13 14:23:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (270, 3, '2020-09-13 14:24:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (271, 3, '2020-09-13 14:32:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (272, 1, '2020-09-19 15:43:31', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (273, 3, '2020-09-19 15:43:58', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (274, 3, '2020-09-19 15:49:44', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (275, 6, '2020-09-19 15:50:12', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (276, 6, '2020-09-19 15:50:18', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (277, 1, '2020-09-19 15:50:41', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (278, 6, '2020-09-19 15:52:28', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (279, 1, '2020-09-19 15:53:01', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (280, 1, '2020-09-19 15:53:48', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (281, 6, '2020-09-19 15:54:37', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (282, 3, '2020-09-20 11:13:50', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (283, 1, '2020-10-08 14:26:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (284, 1, '2020-10-08 14:30:49', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (285, 3, '2021-04-11 10:27:43', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (286, 1, '2021-04-11 10:29:19', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (287, 3, '2021-04-11 10:30:40', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (288, 3, '2021-04-11 10:37:50', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (289, 3, '2021-12-08 10:44:09', '192.168.3.4', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (290, 3, '2022-04-15 15:04:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (291, 1, '2022-05-10 15:25:58', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (292, 1, '2022-05-10 15:31:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (293, 1, '2022-05-10 15:32:18', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (294, 1, '2022-05-10 15:34:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (295, 1, '2022-05-10 15:34:38', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (296, 1, '2022-05-10 15:54:50', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (297, 1, '2022-05-10 16:31:20', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (298, 1, '2022-05-10 16:33:45', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (299, 1, '2022-05-10 16:39:07', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (300, 1, '2022-05-18 14:53:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (301, 3, '2022-06-07 17:28:29', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (302, 3, '2022-06-08 09:48:32', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (303, 3, '2022-06-08 10:34:20', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (304, 3, '2022-06-08 17:09:29', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (305, 3, '2022-06-08 17:10:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (306, 6, '2022-06-08 17:10:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (307, 3, '2022-06-08 17:23:05', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (308, 3, '2022-06-08 17:30:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (309, 3, '2022-06-08 17:31:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (310, 3, '2022-06-08 17:31:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (311, 3, '2022-06-08 21:03:56', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (312, 3, '2022-06-09 10:41:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (313, 3, '2022-06-09 15:18:46', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (314, 3, '2022-06-10 15:43:15', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (315, 3, '2022-06-10 15:52:27', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (316, 3, '2022-06-15 14:41:59', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (317, 3, '2022-06-23 16:24:09', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (318, 3, '2022-06-23 16:41:33', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (319, 3, '2022-06-23 16:42:50', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (320, 3, '2022-06-23 16:42:51', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (321, 3, '2022-06-23 16:42:52', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (322, 3, '2022-06-23 16:42:53', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (323, 3, '2022-06-23 16:43:07', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (324, 3, '2022-06-23 16:44:56', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (325, 3, '2022-06-23 16:45:42', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (326, 3, '2022-06-23 16:50:08', '192.168.3.6', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (327, 3, '2022-06-24 15:19:04', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (328, 3, '2022-06-24 15:25:52', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (329, 3, '2022-06-24 15:40:29', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (330, 3, '2022-06-25 15:13:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (331, 3, '2022-06-25 15:25:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (332, 3, '2022-06-27 16:38:37', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (333, 3, '2022-07-24 10:10:06', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (334, 1, '2022-07-25 17:15:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (335, 3, '2022-07-27 09:41:32', '192.168.3.227', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (336, 1, '2022-07-28 16:56:10', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (337, 1, '2022-07-28 16:56:25', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (338, 8, '2022-08-07 14:46:00', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (339, 9, '2022-08-07 14:53:32', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (340, 9, '2022-08-07 14:53:46', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (341, 9, '2022-08-07 14:56:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (342, 1, '2022-08-09 10:53:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (343, 1, '2022-08-09 10:54:36', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (344, 1, '2022-08-09 11:00:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (345, 1, '2022-08-09 11:02:04', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (346, 1, '2022-08-09 15:48:14', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (347, 1, '2022-08-16 16:35:24', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (348, 1, '2022-08-17 15:03:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (349, 1, '2022-08-20 16:49:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (350, 1, '2022-08-23 14:54:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (351, 1, '2022-08-31 17:16:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (352, 3, '2022-10-14 15:31:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (353, 3, '2022-10-14 15:42:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (354, 3, '2022-10-14 15:44:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (355, 3, '2022-10-14 15:46:23', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (356, 3, '2022-10-14 15:46:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (357, 3, '2022-10-14 16:06:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (358, 3, '2022-10-14 16:24:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (359, 3, '2022-10-17 16:44:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (360, 3, '2022-10-17 16:49:42', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (361, 3, '2022-10-17 16:49:53', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (362, 3, '2022-10-17 17:03:10', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (363, 3, '2022-10-17 17:03:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (364, 3, '2022-10-17 21:00:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (365, 3, '2022-10-24 16:32:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (366, 3, '2022-10-26 16:31:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (367, 3, '2022-10-26 16:50:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (368, 3, '2022-10-26 16:52:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (369, 3, '2022-10-27 17:21:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (370, 3, '2022-10-28 10:52:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (371, 3, '2022-11-04 16:09:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (372, 3, '2022-11-08 10:27:27', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (373, 3, '2022-11-09 10:42:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (374, 3, '2022-11-10 15:03:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (375, 3, '2022-11-11 10:11:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (376, 3, '2022-11-14 16:33:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (377, 3, '2022-11-15 10:54:02', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (378, 3, '2022-11-15 15:16:35', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (379, 3, '2022-11-15 15:17:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (380, 3, '2022-11-15 15:17:47', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (381, 1, '2022-11-15 15:19:56', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (382, 3, '2022-11-15 15:20:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (383, 3, '2022-11-15 15:22:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (384, 3, '2022-11-16 10:39:08', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (385, 1, '2022-11-24 20:02:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (386, 3, '2022-11-28 15:24:02', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (387, 3, '2022-11-30 09:34:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (388, 3, '2022-12-05 09:43:58', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (389, 3, '2022-12-09 17:18:09', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (390, 3, '2022-12-15 14:53:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (391, 3, '2022-12-15 16:11:54', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (392, 3, '2022-12-20 15:55:18', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (393, 3, '2022-12-21 14:49:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (394, 3, '2022-12-23 09:49:50', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (395, 3, '2023-01-04 10:17:44', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (396, 3, '2023-01-04 15:28:47', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (397, 3, '2023-01-05 10:13:43', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (398, 3, '2023-01-06 09:49:23', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (399, 3, '2023-01-06 10:04:19', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (400, 3, '2023-01-06 10:07:06', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (401, 3, '2023-01-06 16:21:31', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (402, 3, '2023-01-09 16:50:30', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (403, 3, '2023-01-10 10:05:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (404, 3, '2023-01-10 17:09:44', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (405, 3, '2023-01-11 10:17:17', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (406, 3, '2023-01-13 09:35:37', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (407, 3, '2023-01-13 09:40:51', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (408, 3, '2023-01-31 10:46:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (409, 3, '2023-02-08 17:11:11', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (410, 3, '2023-02-09 15:46:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (411, 3, '2023-02-10 17:23:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (412, 3, '2023-05-11 15:29:54', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (413, 3, '2025-02-03 17:31:36', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (414, 3, '2025-02-04 12:15:48', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (415, 3, '2025-02-04 14:01:44', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (416, 3, '2025-02-04 15:18:58', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (417, 3, '2025-02-04 16:30:44', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (418, 3, '2025-02-04 18:43:13', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (419, 3, '2025-02-04 19:57:26', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (420, 3, '2025-02-04 21:44:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (421, 3, '2025-02-05 10:03:00', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (422, 3, '2025-02-06 13:26:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (423, 3, '2025-02-06 15:35:04', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (424, 3, '2025-02-06 15:59:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (425, 3, '2025-02-07 09:54:22', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (426, 3, '2025-02-07 19:42:28', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (427, 3, '2025-02-07 19:52:49', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (428, 3, '2025-02-07 20:01:29', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (429, 3, '2025-02-07 20:34:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (430, 3, '2025-02-07 20:39:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (431, 3, '2025-02-07 20:49:05', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (432, 3, '2025-02-07 21:32:27', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (433, 3, '2025-02-07 21:53:38', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (434, 3, '2025-02-08 09:33:58', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (435, 3, '2025-02-08 13:58:50', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (436, 3, '2025-02-08 16:59:16', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (437, 3, '2025-02-08 18:02:54', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (438, 3, '2025-02-08 18:17:54', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (439, 3, '2025-02-08 20:16:21', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (440, 3, '2025-02-08 20:52:59', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (441, 3, '2025-02-08 21:09:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (442, 3, '2025-02-08 21:16:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (443, 3, '2025-02-08 21:17:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (444, 3, '2025-02-08 21:18:25', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (445, 3, '2025-02-08 21:45:36', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (446, 3, '2025-02-08 22:19:57', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (447, 3, '2025-02-09 09:43:57', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (448, 3, '2025-02-09 10:11:53', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (449, 3, '2025-02-09 15:52:49', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (450, 3, '2025-02-09 16:41:39', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (451, 3, '2025-02-10 12:46:57', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (452, 3, '2025-02-11 13:01:41', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (453, 3, '2025-02-12 12:23:55', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (454, 3, '2025-02-12 15:20:14', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (455, 3, '2025-02-14 15:05:52', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (456, 3, '2025-02-15 11:38:12', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (457, 3, '2025-02-18 14:19:27', '192.168.56.1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (458, 3, '2025-02-24 14:53:42', '192.168.0.108', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (459, 3, '2025-03-03 15:18:57', '192.168.0.108', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (460, 3, '2025-03-03 17:16:19', '192.168.0.108', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (461, 3, '2025-03-08 15:31:52', '192.168.0.108', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (462, 3, '2025-03-13 19:34:45', '192.168.0.108', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (463, 3, '2025-03-18 16:30:29', '192.168.0.108', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (464, 3, '2025-03-19 13:12:34', '192.168.0.108', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (465, 3, '2025-03-28 16:08:41', '192.168.0.108', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (466, 3, '2025-03-28 16:43:14', '192.168.0.108', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (467, 3, '2025-03-29 21:09:42', '192.168.0.108', NULL, NULL);

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和权限关系表(除角色中定义的权限以外的加减权限)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_permission_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
INSERT INTO `ums_admin_role_relation` VALUES (26, 3, 7);
INSERT INTO `ums_admin_role_relation` VALUES (27, 6, 1);
INSERT INTO `ums_admin_role_relation` VALUES (28, 7, 2);
INSERT INTO `ums_admin_role_relation` VALUES (29, 1, 5);
INSERT INTO `ums_admin_role_relation` VALUES (30, 4, 5);
INSERT INTO `ums_admin_role_relation` VALUES (31, 8, 6);
INSERT INTO `ums_admin_role_relation` VALUES (32, 9, 6);
INSERT INTO `ums_admin_role_relation` VALUES (33, 10, 6);

-- ----------------------------
-- Table structure for ums_euex
-- ----------------------------
DROP TABLE IF EXISTS `ums_euex`;
CREATE TABLE `ums_euex`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `token` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `clientid`(`client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_euex
-- ----------------------------
INSERT INTO `ums_euex` VALUES (1, 'David', 'w1FBC42XNTjQ1C4y65sA');

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `change_type` int(1) NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成长值变化历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
INSERT INTO `ums_growth_change_history` VALUES (1, 1, '2018-08-29 17:16:35', 0, 1000, 'test', '测试使用', 1);

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `change_type` int(1) NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分变化历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_integration_change_history
-- ----------------------------

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(11) NULL DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int(11) NULL DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int(11) NULL DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int(1) NULL DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分消费设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
INSERT INTO `ums_integration_consume_setting` VALUES (1, 100, 50, 100, 1);

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) NULL DEFAULT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` int(1) NULL DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` int(1) NULL DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '用户来源',
  `integration` int(11) NULL DEFAULT NULL COMMENT '积分',
  `growth` int(11) NULL DEFAULT NULL COMMENT '成长值',
  `luckey_count` int(11) NULL DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int(11) NULL DEFAULT NULL COMMENT '历史积分数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, 4, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'test', '18061581849', 1, '2018-08-02 10:35:44', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_03.png', 1, '2009-06-01', '上海', '学生', 'test', NULL, 3900, 1000, NULL, NULL);
INSERT INTO `ums_member` VALUES (3, 4, 'windy', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windy', '18061581848', 1, '2018-08-03 16:46:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (4, 4, 'zhengsan', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'zhengsan', '18061581847', 1, '2018-11-12 14:12:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (5, 4, 'lisi', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lisi', '18061581841', 1, '2018-11-12 14:12:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (6, 4, 'wangwu', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'wangwu', '18061581842', 1, '2018-11-12 14:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (7, 4, 'lion', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lion', '18061581845', 1, '2018-11-12 14:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (8, 4, 'shari', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'shari', '18061581844', 1, '2018-11-12 14:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (9, 4, 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (10, 4, 'guest', '$2a$10$WQiD4RzEs1iJVWU.2HVu8OdSlExJHWKmwndaw3SUfMyqfKZmXe1vq', NULL, '18911111111', 1, '2020-03-14 14:52:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (11, 4, 'member', '$2a$10$Q08uzqvtPj61NnpYQZsVvOnyilJ3AU4VdngAcJFGvPhEeqhhC.hhS', 'member', '18961511111', 1, '2023-05-11 15:22:38', 'https://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/icon/github_icon_02.png', 1, '2009-06-01', '上海', '学生', 'member', NULL, 5000, 1000, NULL, NULL);

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth_point` int(11) NULL DEFAULT NULL,
  `default_status` int(1) NULL DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) NULL DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(1) NULL DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(1) NULL DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(1) NULL DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(1) NULL DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(1) NULL DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(1) NULL DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
INSERT INTO `ums_member_level` VALUES (1, '黄金会员', 1000, 0, 199.00, 5, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (2, '白金会员', 5000, 0, 99.00, 10, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (3, '钻石会员', 15000, 0, 69.00, 15, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (4, '普通会员', 1, 1, 199.00, 20, 1, 1, 1, 1, 0, 0, NULL);

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_type` int(1) NULL DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员登录记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `tag_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和标签关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_member_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `product_category_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员与产品分类关系表（用户喜欢的分类）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_product_category_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `default_status` int(1) NULL DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员收货地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
INSERT INTO `ums_member_receive_address` VALUES (1, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `ums_member_receive_address` VALUES (3, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '福田区', '清水河街道');
INSERT INTO `ums_member_receive_address` VALUES (4, 1, '大梨', '18033441849', 1, '518000', '广东省', '深圳市', '福田区', '东晓街道');
INSERT INTO `ums_member_receive_address` VALUES (5, 11, '小李', '18961511111', 1, '518000', '广东省', '深圳市', '福田区', '东晓街道');
INSERT INTO `ums_member_receive_address` VALUES (6, 11, '小李', '18961511111', NULL, '518000', '广东省', '深圳市', '福田区', '清水河街道');

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(11) NULL DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int(11) NULL DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int(11) NULL DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员积分成长规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_rule_setting
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `consume_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) NULL DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) NULL DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) NULL DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) NULL DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) NULL DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) NULL DEFAULT NULL,
  `collect_subject_count` int(11) NULL DEFAULT NULL,
  `collect_topic_count` int(11) NULL DEFAULT NULL,
  `collect_comment_count` int(11) NULL DEFAULT NULL,
  `invite_friend_count` int(11) NULL DEFAULT NULL,
  `recent_order_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员统计信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_statistics_info
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_order_count` int(11) NULL DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_tag
-- ----------------------------

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `growth` int(11) NULL DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int(11) NULL DEFAULT NULL COMMENT '赠送积分',
  `type` int(1) NULL DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_member_task
-- ----------------------------

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `level` int(4) NULL DEFAULT NULL COMMENT '菜单级数',
  `sort` int(4) NULL DEFAULT NULL COMMENT '菜单排序',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端名称',
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端图标',
  `hidden` int(1) NULL DEFAULT NULL COMMENT '前端隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES (1, 0, '2020-02-02 14:50:36', '商品', 0, 0, 'pms', 'product', 0);
INSERT INTO `ums_menu` VALUES (2, 1, '2020-02-02 14:51:50', '商品列表', 1, 0, 'product', 'product-list', 0);
INSERT INTO `ums_menu` VALUES (3, 1, '2020-02-02 14:52:44', '添加商品', 1, 0, 'addProduct', 'product-add', 0);
INSERT INTO `ums_menu` VALUES (4, 1, '2020-02-02 14:53:51', '商品分类', 1, 0, 'productCate', 'product-cate', 0);
INSERT INTO `ums_menu` VALUES (5, 1, '2020-02-02 14:54:51', '商品类型', 1, 0, 'productAttr', 'product-attr', 0);
INSERT INTO `ums_menu` VALUES (6, 1, '2020-02-02 14:56:29', '品牌管理', 1, 0, 'brand', 'product-brand', 0);
INSERT INTO `ums_menu` VALUES (7, 0, '2020-02-02 16:54:07', '订单', 0, 0, 'oms', 'order', 0);
INSERT INTO `ums_menu` VALUES (8, 7, '2020-02-02 16:55:18', '订单列表', 1, 0, 'order', 'product-list', 0);
INSERT INTO `ums_menu` VALUES (9, 7, '2020-02-02 16:56:46', '订单设置', 1, 0, 'orderSetting', 'order-setting', 0);
INSERT INTO `ums_menu` VALUES (10, 7, '2020-02-02 16:57:39', '退货申请处理', 1, 0, 'returnApply', 'order-return', 0);
INSERT INTO `ums_menu` VALUES (11, 7, '2020-02-02 16:59:40', '退货原因设置', 1, 0, 'returnReason', 'order-return-reason', 0);
INSERT INTO `ums_menu` VALUES (12, 0, '2020-02-04 16:18:00', '营销', 0, 0, 'sms', 'sms', 0);
INSERT INTO `ums_menu` VALUES (13, 12, '2020-02-04 16:19:22', '秒杀活动列表', 1, 0, 'flash', 'sms-flash', 0);
INSERT INTO `ums_menu` VALUES (14, 12, '2020-02-04 16:20:16', '优惠券列表', 1, 0, 'coupon', 'sms-coupon', 0);
INSERT INTO `ums_menu` VALUES (16, 12, '2020-02-07 16:22:38', '品牌推荐', 1, 0, 'homeBrand', 'product-brand', 0);
INSERT INTO `ums_menu` VALUES (17, 12, '2020-02-07 16:23:14', '新品推荐', 1, 0, 'homeNew', 'sms-new', 0);
INSERT INTO `ums_menu` VALUES (18, 12, '2020-02-07 16:26:38', '人气推荐', 1, 0, 'homeHot', 'sms-hot', 0);
INSERT INTO `ums_menu` VALUES (19, 12, '2020-02-07 16:28:16', '专题推荐', 1, 0, 'homeSubject', 'sms-subject', 0);
INSERT INTO `ums_menu` VALUES (20, 12, '2020-02-07 16:28:42', '广告列表', 1, 0, 'homeAdvertise', 'sms-ad', 0);
INSERT INTO `ums_menu` VALUES (21, 0, '2020-02-07 16:29:13', '权限', 0, 0, 'ums', 'ums', 0);
INSERT INTO `ums_menu` VALUES (22, 21, '2020-02-07 16:29:51', '用户列表', 1, 0, 'admin', 'ums-admin', 0);
INSERT INTO `ums_menu` VALUES (23, 21, '2020-02-07 16:30:13', '角色列表', 1, 0, 'role', 'ums-role', 0);
INSERT INTO `ums_menu` VALUES (24, 21, '2020-02-07 16:30:53', '菜单列表', 1, 0, 'menu', 'ums-menu', 0);
INSERT INTO `ums_menu` VALUES (25, 21, '2020-02-07 16:31:13', '资源列表', 1, 0, 'resource', 'ums-resource', 0);

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` int(1) NULL DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端资源路径',
  `status` int(1) NULL DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES (1, 0, '商品', NULL, NULL, 0, NULL, 1, '2018-09-29 16:15:14', 0);
INSERT INTO `ums_permission` VALUES (2, 1, '商品列表', 'pms:product:read', NULL, 1, '/pms/product/index', 1, '2018-09-29 16:17:01', 0);
INSERT INTO `ums_permission` VALUES (3, 1, '添加商品', 'pms:product:create', NULL, 1, '/pms/product/add', 1, '2018-09-29 16:18:51', 0);
INSERT INTO `ums_permission` VALUES (4, 1, '商品分类', 'pms:productCategory:read', NULL, 1, '/pms/productCate/index', 1, '2018-09-29 16:23:07', 0);
INSERT INTO `ums_permission` VALUES (5, 1, '商品类型', 'pms:productAttribute:read', NULL, 1, '/pms/productAttr/index', 1, '2018-09-29 16:24:43', 0);
INSERT INTO `ums_permission` VALUES (6, 1, '品牌管理', 'pms:brand:read', NULL, 1, '/pms/brand/index', 1, '2018-09-29 16:25:45', 0);
INSERT INTO `ums_permission` VALUES (7, 2, '编辑商品', 'pms:product:update', NULL, 2, '/pms/product/updateProduct', 1, '2018-09-29 16:34:23', 0);
INSERT INTO `ums_permission` VALUES (8, 2, '删除商品', 'pms:product:delete', NULL, 2, '/pms/product/delete', 1, '2018-09-29 16:38:33', 0);
INSERT INTO `ums_permission` VALUES (9, 4, '添加商品分类', 'pms:productCategory:create', NULL, 2, '/pms/productCate/create', 1, '2018-09-29 16:43:23', 0);
INSERT INTO `ums_permission` VALUES (10, 4, '修改商品分类', 'pms:productCategory:update', NULL, 2, '/pms/productCate/update', 1, '2018-09-29 16:43:55', 0);
INSERT INTO `ums_permission` VALUES (11, 4, '删除商品分类', 'pms:productCategory:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:44:38', 0);
INSERT INTO `ums_permission` VALUES (12, 5, '添加商品类型', 'pms:productAttribute:create', NULL, 2, '/pms/productAttr/create', 1, '2018-09-29 16:45:25', 0);
INSERT INTO `ums_permission` VALUES (13, 5, '修改商品类型', 'pms:productAttribute:update', NULL, 2, '/pms/productAttr/update', 1, '2018-09-29 16:48:08', 0);
INSERT INTO `ums_permission` VALUES (14, 5, '删除商品类型', 'pms:productAttribute:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:48:44', 0);
INSERT INTO `ums_permission` VALUES (15, 6, '添加品牌', 'pms:brand:create', NULL, 2, '/pms/brand/add', 1, '2018-09-29 16:49:34', 0);
INSERT INTO `ums_permission` VALUES (16, 6, '修改品牌', 'pms:brand:update', NULL, 2, '/pms/brand/update', 1, '2018-09-29 16:50:55', 0);
INSERT INTO `ums_permission` VALUES (17, 6, '删除品牌', 'pms:brand:delete', NULL, 2, '/pms/brand/delete', 1, '2018-09-29 16:50:59', 0);
INSERT INTO `ums_permission` VALUES (18, 0, '首页', NULL, NULL, 0, NULL, 1, '2018-09-29 16:51:57', 0);

-- ----------------------------
-- Table structure for ums_resource
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource`;
CREATE TABLE `ums_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '资源分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_resource
-- ----------------------------
INSERT INTO `ums_resource` VALUES (1, '2020-02-04 17:04:55', '商品品牌管理', '/brand/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (2, '2020-02-04 17:05:35', '商品属性分类管理', '/productAttribute/category/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (3, '2020-02-04 17:06:13', '商品属性管理', '/productAttribute/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (4, '2020-02-04 17:07:15', '商品分类管理', '/productCategory/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (5, '2020-02-04 17:09:16', '商品管理', '/product/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (6, '2020-02-04 17:09:53', '商品库存管理', '/sku/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (8, '2020-02-05 14:43:37', '订单管理', '/order/**', '', 2);
INSERT INTO `ums_resource` VALUES (9, '2020-02-05 14:44:22', ' 订单退货申请管理', '/returnApply/**', '', 2);
INSERT INTO `ums_resource` VALUES (10, '2020-02-05 14:45:08', '退货原因管理', '/returnReason/**', '', 2);
INSERT INTO `ums_resource` VALUES (11, '2020-02-05 14:45:43', '订单设置管理', '/orderSetting/**', '', 2);
INSERT INTO `ums_resource` VALUES (12, '2020-02-05 14:46:23', '收货地址管理', '/companyAddress/**', '', 2);
INSERT INTO `ums_resource` VALUES (13, '2020-02-07 16:37:22', '优惠券管理', '/coupon/**', '', 3);
INSERT INTO `ums_resource` VALUES (14, '2020-02-07 16:37:59', '优惠券领取记录管理', '/couponHistory/**', '', 3);
INSERT INTO `ums_resource` VALUES (15, '2020-02-07 16:38:28', '限时购活动管理', '/flash/**', '', 3);
INSERT INTO `ums_resource` VALUES (16, '2020-02-07 16:38:59', '限时购商品关系管理', '/flashProductRelation/**', '', 3);
INSERT INTO `ums_resource` VALUES (17, '2020-02-07 16:39:22', '限时购场次管理', '/flashSession/**', '', 3);
INSERT INTO `ums_resource` VALUES (18, '2020-02-07 16:40:07', '首页轮播广告管理', '/home/advertise/**', '', 3);
INSERT INTO `ums_resource` VALUES (19, '2020-02-07 16:40:34', '首页品牌管理', '/home/brand/**', '', 3);
INSERT INTO `ums_resource` VALUES (20, '2020-02-07 16:41:06', '首页新品管理', '/home/newProduct/**', '', 3);
INSERT INTO `ums_resource` VALUES (21, '2020-02-07 16:42:16', '首页人气推荐管理', '/home/recommendProduct/**', '', 3);
INSERT INTO `ums_resource` VALUES (22, '2020-02-07 16:42:48', '首页专题推荐管理', '/home/recommendSubject/**', '', 3);
INSERT INTO `ums_resource` VALUES (23, '2020-02-07 16:44:56', ' 商品优选管理', '/prefrenceArea/**', '', 5);
INSERT INTO `ums_resource` VALUES (24, '2020-02-07 16:45:39', '商品专题管理', '/subject/**', '', 5);
INSERT INTO `ums_resource` VALUES (25, '2020-02-07 16:47:34', '后台用户管理', '/admin/**', '', 4);
INSERT INTO `ums_resource` VALUES (26, '2020-02-07 16:48:24', '后台用户角色管理', '/role/**', '', 4);
INSERT INTO `ums_resource` VALUES (27, '2020-02-07 16:48:48', '后台菜单管理', '/menu/**', '', 4);
INSERT INTO `ums_resource` VALUES (28, '2020-02-07 16:49:18', '后台资源分类管理', '/resourceCategory/**', '', 4);
INSERT INTO `ums_resource` VALUES (29, '2020-02-07 16:49:45', '后台资源管理', '/resource/**', '', 4);
INSERT INTO `ums_resource` VALUES (30, '2020-09-19 15:47:57', '会员等级管理', '/memberLevel/**', '', 7);
INSERT INTO `ums_resource` VALUES (31, '2020-09-19 15:51:29', '获取登录用户信息', '/admin/info', '用户登录必配', 4);
INSERT INTO `ums_resource` VALUES (32, '2020-09-19 15:53:34', '用户登出', '/admin/logout', '用户登出必配', 4);

-- ----------------------------
-- Table structure for ums_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource_category`;
CREATE TABLE `ums_resource_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort` int(4) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_resource_category
-- ----------------------------
INSERT INTO `ums_resource_category` VALUES (1, '2020-02-05 10:21:44', '商品模块', 0);
INSERT INTO `ums_resource_category` VALUES (2, '2020-02-05 10:22:34', '订单模块', 0);
INSERT INTO `ums_resource_category` VALUES (3, '2020-02-05 10:22:48', '营销模块', 0);
INSERT INTO `ums_resource_category` VALUES (4, '2020-02-05 10:23:04', '权限模块', 0);
INSERT INTO `ums_resource_category` VALUES (5, '2020-02-07 16:34:27', '内容模块', 0);
INSERT INTO `ums_resource_category` VALUES (7, '2020-09-19 15:49:08', '其他模块', 0);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) NULL DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (1, '商品管理员', '只能查看及操作商品', 0, '2020-02-03 16:50:37', 1, 0);
INSERT INTO `ums_role` VALUES (2, '订单管理员', '只能查看及操作订单', 0, '2018-09-30 15:53:45', 1, 0);
INSERT INTO `ums_role` VALUES (5, '超级管理员', '拥有所有查看和操作功能', 0, '2020-02-02 15:11:05', 1, 0);
INSERT INTO `ums_role` VALUES (6, '零售商', NULL, NULL, NULL, 1, 0);
INSERT INTO `ums_role` VALUES (7, '供货商', NULL, NULL, NULL, 1, 0);
INSERT INTO `ums_role` VALUES (8, '三方物流', NULL, NULL, NULL, 1, 0);
INSERT INTO `ums_role` VALUES (9, '快递转发', NULL, NULL, NULL, 1, 0);
INSERT INTO `ums_role` VALUES (10, '清关', NULL, 0, '2025-03-29 21:10:18', 1, 0);

-- ----------------------------
-- Table structure for ums_role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu_relation`;
CREATE TABLE `ums_role_menu_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色菜单关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_menu_relation
-- ----------------------------
INSERT INTO `ums_role_menu_relation` VALUES (53, 2, 7);
INSERT INTO `ums_role_menu_relation` VALUES (54, 2, 8);
INSERT INTO `ums_role_menu_relation` VALUES (55, 2, 9);
INSERT INTO `ums_role_menu_relation` VALUES (56, 2, 10);
INSERT INTO `ums_role_menu_relation` VALUES (57, 2, 11);
INSERT INTO `ums_role_menu_relation` VALUES (72, 5, 1);
INSERT INTO `ums_role_menu_relation` VALUES (73, 5, 2);
INSERT INTO `ums_role_menu_relation` VALUES (74, 5, 3);
INSERT INTO `ums_role_menu_relation` VALUES (75, 5, 4);
INSERT INTO `ums_role_menu_relation` VALUES (76, 5, 5);
INSERT INTO `ums_role_menu_relation` VALUES (77, 5, 6);
INSERT INTO `ums_role_menu_relation` VALUES (78, 5, 7);
INSERT INTO `ums_role_menu_relation` VALUES (79, 5, 8);
INSERT INTO `ums_role_menu_relation` VALUES (80, 5, 9);
INSERT INTO `ums_role_menu_relation` VALUES (81, 5, 10);
INSERT INTO `ums_role_menu_relation` VALUES (82, 5, 11);
INSERT INTO `ums_role_menu_relation` VALUES (83, 5, 12);
INSERT INTO `ums_role_menu_relation` VALUES (84, 5, 13);
INSERT INTO `ums_role_menu_relation` VALUES (85, 5, 14);
INSERT INTO `ums_role_menu_relation` VALUES (86, 5, 16);
INSERT INTO `ums_role_menu_relation` VALUES (87, 5, 17);
INSERT INTO `ums_role_menu_relation` VALUES (88, 5, 18);
INSERT INTO `ums_role_menu_relation` VALUES (89, 5, 19);
INSERT INTO `ums_role_menu_relation` VALUES (90, 5, 20);
INSERT INTO `ums_role_menu_relation` VALUES (91, 5, 21);
INSERT INTO `ums_role_menu_relation` VALUES (92, 5, 22);
INSERT INTO `ums_role_menu_relation` VALUES (93, 5, 23);
INSERT INTO `ums_role_menu_relation` VALUES (94, 5, 24);
INSERT INTO `ums_role_menu_relation` VALUES (95, 5, 25);
INSERT INTO `ums_role_menu_relation` VALUES (121, 1, 1);
INSERT INTO `ums_role_menu_relation` VALUES (122, 1, 2);
INSERT INTO `ums_role_menu_relation` VALUES (123, 1, 3);
INSERT INTO `ums_role_menu_relation` VALUES (124, 1, 4);
INSERT INTO `ums_role_menu_relation` VALUES (125, 1, 5);
INSERT INTO `ums_role_menu_relation` VALUES (126, 1, 6);
INSERT INTO `ums_role_menu_relation` VALUES (127, 2, 22);
INSERT INTO `ums_role_menu_relation` VALUES (128, 2, 23);
INSERT INTO `ums_role_menu_relation` VALUES (129, 6, 1);
INSERT INTO `ums_role_menu_relation` VALUES (130, 6, 2);
INSERT INTO `ums_role_menu_relation` VALUES (131, 6, 3);
INSERT INTO `ums_role_menu_relation` VALUES (132, 6, 4);
INSERT INTO `ums_role_menu_relation` VALUES (133, 6, 5);
INSERT INTO `ums_role_menu_relation` VALUES (134, 6, 6);
INSERT INTO `ums_role_menu_relation` VALUES (135, 6, 7);
INSERT INTO `ums_role_menu_relation` VALUES (136, 6, 8);
INSERT INTO `ums_role_menu_relation` VALUES (137, 6, 9);
INSERT INTO `ums_role_menu_relation` VALUES (138, 6, 10);
INSERT INTO `ums_role_menu_relation` VALUES (139, 6, 11);
INSERT INTO `ums_role_menu_relation` VALUES (140, 6, 12);
INSERT INTO `ums_role_menu_relation` VALUES (141, 6, 13);
INSERT INTO `ums_role_menu_relation` VALUES (142, 6, 14);
INSERT INTO `ums_role_menu_relation` VALUES (143, 6, 15);
INSERT INTO `ums_role_menu_relation` VALUES (144, 6, 16);
INSERT INTO `ums_role_menu_relation` VALUES (145, 6, 17);
INSERT INTO `ums_role_menu_relation` VALUES (146, 6, 18);
INSERT INTO `ums_role_menu_relation` VALUES (147, 6, 19);
INSERT INTO `ums_role_menu_relation` VALUES (148, 6, 20);
INSERT INTO `ums_role_menu_relation` VALUES (149, 6, 21);
INSERT INTO `ums_role_menu_relation` VALUES (150, 6, 22);
INSERT INTO `ums_role_menu_relation` VALUES (151, 6, 23);
INSERT INTO `ums_role_menu_relation` VALUES (152, 6, 24);
INSERT INTO `ums_role_menu_relation` VALUES (153, 8, 1);
INSERT INTO `ums_role_menu_relation` VALUES (154, 8, 2);
INSERT INTO `ums_role_menu_relation` VALUES (155, 8, 3);
INSERT INTO `ums_role_menu_relation` VALUES (156, 8, 4);
INSERT INTO `ums_role_menu_relation` VALUES (157, 8, 5);
INSERT INTO `ums_role_menu_relation` VALUES (158, 8, 6);
INSERT INTO `ums_role_menu_relation` VALUES (159, 8, 7);
INSERT INTO `ums_role_menu_relation` VALUES (160, 8, 8);
INSERT INTO `ums_role_menu_relation` VALUES (161, 8, 9);
INSERT INTO `ums_role_menu_relation` VALUES (162, 8, 10);
INSERT INTO `ums_role_menu_relation` VALUES (163, 8, 11);
INSERT INTO `ums_role_menu_relation` VALUES (164, 8, 12);
INSERT INTO `ums_role_menu_relation` VALUES (165, 8, 13);
INSERT INTO `ums_role_menu_relation` VALUES (166, 8, 14);
INSERT INTO `ums_role_menu_relation` VALUES (167, 8, 15);
INSERT INTO `ums_role_menu_relation` VALUES (168, 8, 16);
INSERT INTO `ums_role_menu_relation` VALUES (169, 8, 17);
INSERT INTO `ums_role_menu_relation` VALUES (170, 8, 18);
INSERT INTO `ums_role_menu_relation` VALUES (171, 8, 19);
INSERT INTO `ums_role_menu_relation` VALUES (172, 8, 20);
INSERT INTO `ums_role_menu_relation` VALUES (173, 8, 21);
INSERT INTO `ums_role_menu_relation` VALUES (174, 8, 22);
INSERT INTO `ums_role_menu_relation` VALUES (175, 8, 23);
INSERT INTO `ums_role_menu_relation` VALUES (176, 8, 24);
INSERT INTO `ums_role_menu_relation` VALUES (177, 7, 1);
INSERT INTO `ums_role_menu_relation` VALUES (178, 7, 2);
INSERT INTO `ums_role_menu_relation` VALUES (179, 7, 3);
INSERT INTO `ums_role_menu_relation` VALUES (180, 7, 4);
INSERT INTO `ums_role_menu_relation` VALUES (181, 7, 5);
INSERT INTO `ums_role_menu_relation` VALUES (182, 7, 6);
INSERT INTO `ums_role_menu_relation` VALUES (183, 7, 7);
INSERT INTO `ums_role_menu_relation` VALUES (184, 7, 8);
INSERT INTO `ums_role_menu_relation` VALUES (185, 7, 9);
INSERT INTO `ums_role_menu_relation` VALUES (186, 7, 10);
INSERT INTO `ums_role_menu_relation` VALUES (187, 7, 11);
INSERT INTO `ums_role_menu_relation` VALUES (188, 7, 12);
INSERT INTO `ums_role_menu_relation` VALUES (189, 7, 13);
INSERT INTO `ums_role_menu_relation` VALUES (190, 7, 14);
INSERT INTO `ums_role_menu_relation` VALUES (191, 7, 15);
INSERT INTO `ums_role_menu_relation` VALUES (192, 7, 16);
INSERT INTO `ums_role_menu_relation` VALUES (193, 7, 17);
INSERT INTO `ums_role_menu_relation` VALUES (194, 7, 18);
INSERT INTO `ums_role_menu_relation` VALUES (195, 7, 19);
INSERT INTO `ums_role_menu_relation` VALUES (196, 7, 20);
INSERT INTO `ums_role_menu_relation` VALUES (197, 7, 21);
INSERT INTO `ums_role_menu_relation` VALUES (198, 7, 22);
INSERT INTO `ums_role_menu_relation` VALUES (199, 7, 23);
INSERT INTO `ums_role_menu_relation` VALUES (200, 7, 24);
INSERT INTO `ums_role_menu_relation` VALUES (201, 7, 25);

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色和权限关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES (1, 1, 1);
INSERT INTO `ums_role_permission_relation` VALUES (2, 1, 2);
INSERT INTO `ums_role_permission_relation` VALUES (3, 1, 3);
INSERT INTO `ums_role_permission_relation` VALUES (4, 1, 7);
INSERT INTO `ums_role_permission_relation` VALUES (5, 1, 8);
INSERT INTO `ums_role_permission_relation` VALUES (6, 2, 4);
INSERT INTO `ums_role_permission_relation` VALUES (7, 2, 9);
INSERT INTO `ums_role_permission_relation` VALUES (8, 2, 10);
INSERT INTO `ums_role_permission_relation` VALUES (9, 2, 11);
INSERT INTO `ums_role_permission_relation` VALUES (10, 3, 5);
INSERT INTO `ums_role_permission_relation` VALUES (11, 3, 12);
INSERT INTO `ums_role_permission_relation` VALUES (12, 3, 13);
INSERT INTO `ums_role_permission_relation` VALUES (13, 3, 14);
INSERT INTO `ums_role_permission_relation` VALUES (14, 4, 6);
INSERT INTO `ums_role_permission_relation` VALUES (15, 4, 15);
INSERT INTO `ums_role_permission_relation` VALUES (16, 4, 16);
INSERT INTO `ums_role_permission_relation` VALUES (17, 4, 17);
INSERT INTO `ums_role_permission_relation` VALUES (18, 6, 1);
INSERT INTO `ums_role_permission_relation` VALUES (19, 6, 2);
INSERT INTO `ums_role_permission_relation` VALUES (20, 6, 3);
INSERT INTO `ums_role_permission_relation` VALUES (21, 6, 4);
INSERT INTO `ums_role_permission_relation` VALUES (22, 6, 5);
INSERT INTO `ums_role_permission_relation` VALUES (23, 6, 6);
INSERT INTO `ums_role_permission_relation` VALUES (24, 6, 7);
INSERT INTO `ums_role_permission_relation` VALUES (25, 6, 8);
INSERT INTO `ums_role_permission_relation` VALUES (26, 6, 9);
INSERT INTO `ums_role_permission_relation` VALUES (27, 6, 10);
INSERT INTO `ums_role_permission_relation` VALUES (28, 6, 11);
INSERT INTO `ums_role_permission_relation` VALUES (29, 6, 12);
INSERT INTO `ums_role_permission_relation` VALUES (30, 6, 13);
INSERT INTO `ums_role_permission_relation` VALUES (31, 6, 14);
INSERT INTO `ums_role_permission_relation` VALUES (32, 6, 15);
INSERT INTO `ums_role_permission_relation` VALUES (33, 6, 16);
INSERT INTO `ums_role_permission_relation` VALUES (34, 6, 17);
INSERT INTO `ums_role_permission_relation` VALUES (35, 6, 18);
INSERT INTO `ums_role_permission_relation` VALUES (36, 8, 1);
INSERT INTO `ums_role_permission_relation` VALUES (37, 8, 2);
INSERT INTO `ums_role_permission_relation` VALUES (38, 8, 3);
INSERT INTO `ums_role_permission_relation` VALUES (39, 8, 4);
INSERT INTO `ums_role_permission_relation` VALUES (40, 8, 5);
INSERT INTO `ums_role_permission_relation` VALUES (41, 8, 6);
INSERT INTO `ums_role_permission_relation` VALUES (42, 8, 7);
INSERT INTO `ums_role_permission_relation` VALUES (43, 8, 8);
INSERT INTO `ums_role_permission_relation` VALUES (44, 8, 9);
INSERT INTO `ums_role_permission_relation` VALUES (45, 8, 10);
INSERT INTO `ums_role_permission_relation` VALUES (46, 8, 11);
INSERT INTO `ums_role_permission_relation` VALUES (47, 8, 12);
INSERT INTO `ums_role_permission_relation` VALUES (48, 8, 13);
INSERT INTO `ums_role_permission_relation` VALUES (49, 8, 14);
INSERT INTO `ums_role_permission_relation` VALUES (50, 8, 15);
INSERT INTO `ums_role_permission_relation` VALUES (51, 8, 16);
INSERT INTO `ums_role_permission_relation` VALUES (52, 8, 17);
INSERT INTO `ums_role_permission_relation` VALUES (53, 8, 18);

-- ----------------------------
-- Table structure for ums_role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_resource_relation`;
CREATE TABLE `ums_role_resource_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 349 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色资源关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ums_role_resource_relation
-- ----------------------------
INSERT INTO `ums_role_resource_relation` VALUES (194, 5, 1);
INSERT INTO `ums_role_resource_relation` VALUES (195, 5, 2);
INSERT INTO `ums_role_resource_relation` VALUES (196, 5, 3);
INSERT INTO `ums_role_resource_relation` VALUES (197, 5, 4);
INSERT INTO `ums_role_resource_relation` VALUES (198, 5, 5);
INSERT INTO `ums_role_resource_relation` VALUES (199, 5, 6);
INSERT INTO `ums_role_resource_relation` VALUES (200, 5, 8);
INSERT INTO `ums_role_resource_relation` VALUES (201, 5, 9);
INSERT INTO `ums_role_resource_relation` VALUES (202, 5, 10);
INSERT INTO `ums_role_resource_relation` VALUES (203, 5, 11);
INSERT INTO `ums_role_resource_relation` VALUES (204, 5, 12);
INSERT INTO `ums_role_resource_relation` VALUES (205, 5, 13);
INSERT INTO `ums_role_resource_relation` VALUES (206, 5, 14);
INSERT INTO `ums_role_resource_relation` VALUES (207, 5, 15);
INSERT INTO `ums_role_resource_relation` VALUES (208, 5, 16);
INSERT INTO `ums_role_resource_relation` VALUES (209, 5, 17);
INSERT INTO `ums_role_resource_relation` VALUES (210, 5, 18);
INSERT INTO `ums_role_resource_relation` VALUES (211, 5, 19);
INSERT INTO `ums_role_resource_relation` VALUES (212, 5, 20);
INSERT INTO `ums_role_resource_relation` VALUES (213, 5, 21);
INSERT INTO `ums_role_resource_relation` VALUES (214, 5, 22);
INSERT INTO `ums_role_resource_relation` VALUES (215, 5, 23);
INSERT INTO `ums_role_resource_relation` VALUES (216, 5, 24);
INSERT INTO `ums_role_resource_relation` VALUES (217, 5, 25);
INSERT INTO `ums_role_resource_relation` VALUES (218, 5, 26);
INSERT INTO `ums_role_resource_relation` VALUES (219, 5, 27);
INSERT INTO `ums_role_resource_relation` VALUES (220, 5, 28);
INSERT INTO `ums_role_resource_relation` VALUES (221, 5, 29);
INSERT INTO `ums_role_resource_relation` VALUES (222, 5, 30);
INSERT INTO `ums_role_resource_relation` VALUES (232, 2, 8);
INSERT INTO `ums_role_resource_relation` VALUES (233, 2, 9);
INSERT INTO `ums_role_resource_relation` VALUES (234, 2, 10);
INSERT INTO `ums_role_resource_relation` VALUES (235, 2, 11);
INSERT INTO `ums_role_resource_relation` VALUES (236, 2, 12);
INSERT INTO `ums_role_resource_relation` VALUES (237, 2, 31);
INSERT INTO `ums_role_resource_relation` VALUES (238, 2, 32);
INSERT INTO `ums_role_resource_relation` VALUES (239, 1, 1);
INSERT INTO `ums_role_resource_relation` VALUES (240, 1, 2);
INSERT INTO `ums_role_resource_relation` VALUES (241, 1, 3);
INSERT INTO `ums_role_resource_relation` VALUES (242, 1, 4);
INSERT INTO `ums_role_resource_relation` VALUES (243, 1, 5);
INSERT INTO `ums_role_resource_relation` VALUES (244, 1, 6);
INSERT INTO `ums_role_resource_relation` VALUES (245, 1, 23);
INSERT INTO `ums_role_resource_relation` VALUES (246, 1, 24);
INSERT INTO `ums_role_resource_relation` VALUES (247, 1, 31);
INSERT INTO `ums_role_resource_relation` VALUES (248, 1, 32);
INSERT INTO `ums_role_resource_relation` VALUES (249, 2, 25);
INSERT INTO `ums_role_resource_relation` VALUES (250, 2, 26);
INSERT INTO `ums_role_resource_relation` VALUES (251, 2, 27);
INSERT INTO `ums_role_resource_relation` VALUES (252, 2, 28);
INSERT INTO `ums_role_resource_relation` VALUES (253, 6, 1);
INSERT INTO `ums_role_resource_relation` VALUES (254, 6, 2);
INSERT INTO `ums_role_resource_relation` VALUES (255, 6, 3);
INSERT INTO `ums_role_resource_relation` VALUES (256, 6, 4);
INSERT INTO `ums_role_resource_relation` VALUES (257, 6, 5);
INSERT INTO `ums_role_resource_relation` VALUES (258, 6, 6);
INSERT INTO `ums_role_resource_relation` VALUES (259, 6, 7);
INSERT INTO `ums_role_resource_relation` VALUES (260, 6, 8);
INSERT INTO `ums_role_resource_relation` VALUES (261, 6, 9);
INSERT INTO `ums_role_resource_relation` VALUES (262, 6, 10);
INSERT INTO `ums_role_resource_relation` VALUES (263, 6, 11);
INSERT INTO `ums_role_resource_relation` VALUES (264, 6, 12);
INSERT INTO `ums_role_resource_relation` VALUES (265, 6, 13);
INSERT INTO `ums_role_resource_relation` VALUES (266, 6, 14);
INSERT INTO `ums_role_resource_relation` VALUES (267, 6, 15);
INSERT INTO `ums_role_resource_relation` VALUES (268, 6, 16);
INSERT INTO `ums_role_resource_relation` VALUES (269, 6, 17);
INSERT INTO `ums_role_resource_relation` VALUES (270, 6, 18);
INSERT INTO `ums_role_resource_relation` VALUES (271, 6, 19);
INSERT INTO `ums_role_resource_relation` VALUES (272, 6, 20);
INSERT INTO `ums_role_resource_relation` VALUES (273, 6, 21);
INSERT INTO `ums_role_resource_relation` VALUES (274, 6, 22);
INSERT INTO `ums_role_resource_relation` VALUES (275, 6, 23);
INSERT INTO `ums_role_resource_relation` VALUES (276, 6, 24);
INSERT INTO `ums_role_resource_relation` VALUES (277, 6, 25);
INSERT INTO `ums_role_resource_relation` VALUES (278, 6, 26);
INSERT INTO `ums_role_resource_relation` VALUES (279, 6, 27);
INSERT INTO `ums_role_resource_relation` VALUES (280, 6, 28);
INSERT INTO `ums_role_resource_relation` VALUES (281, 6, 29);
INSERT INTO `ums_role_resource_relation` VALUES (282, 6, 30);
INSERT INTO `ums_role_resource_relation` VALUES (283, 6, 31);
INSERT INTO `ums_role_resource_relation` VALUES (284, 6, 32);
INSERT INTO `ums_role_resource_relation` VALUES (285, 8, 1);
INSERT INTO `ums_role_resource_relation` VALUES (286, 8, 2);
INSERT INTO `ums_role_resource_relation` VALUES (287, 8, 3);
INSERT INTO `ums_role_resource_relation` VALUES (288, 8, 4);
INSERT INTO `ums_role_resource_relation` VALUES (289, 8, 5);
INSERT INTO `ums_role_resource_relation` VALUES (290, 8, 6);
INSERT INTO `ums_role_resource_relation` VALUES (291, 8, 7);
INSERT INTO `ums_role_resource_relation` VALUES (292, 8, 8);
INSERT INTO `ums_role_resource_relation` VALUES (293, 8, 9);
INSERT INTO `ums_role_resource_relation` VALUES (294, 8, 10);
INSERT INTO `ums_role_resource_relation` VALUES (295, 8, 11);
INSERT INTO `ums_role_resource_relation` VALUES (296, 8, 12);
INSERT INTO `ums_role_resource_relation` VALUES (297, 8, 13);
INSERT INTO `ums_role_resource_relation` VALUES (298, 8, 14);
INSERT INTO `ums_role_resource_relation` VALUES (299, 8, 15);
INSERT INTO `ums_role_resource_relation` VALUES (300, 8, 16);
INSERT INTO `ums_role_resource_relation` VALUES (301, 8, 17);
INSERT INTO `ums_role_resource_relation` VALUES (302, 8, 18);
INSERT INTO `ums_role_resource_relation` VALUES (303, 8, 19);
INSERT INTO `ums_role_resource_relation` VALUES (304, 8, 20);
INSERT INTO `ums_role_resource_relation` VALUES (305, 8, 21);
INSERT INTO `ums_role_resource_relation` VALUES (306, 8, 22);
INSERT INTO `ums_role_resource_relation` VALUES (307, 8, 23);
INSERT INTO `ums_role_resource_relation` VALUES (308, 8, 24);
INSERT INTO `ums_role_resource_relation` VALUES (309, 8, 25);
INSERT INTO `ums_role_resource_relation` VALUES (310, 8, 26);
INSERT INTO `ums_role_resource_relation` VALUES (311, 8, 27);
INSERT INTO `ums_role_resource_relation` VALUES (312, 8, 28);
INSERT INTO `ums_role_resource_relation` VALUES (313, 8, 29);
INSERT INTO `ums_role_resource_relation` VALUES (314, 8, 30);
INSERT INTO `ums_role_resource_relation` VALUES (315, 8, 31);
INSERT INTO `ums_role_resource_relation` VALUES (316, 8, 32);
INSERT INTO `ums_role_resource_relation` VALUES (317, 7, 1);
INSERT INTO `ums_role_resource_relation` VALUES (318, 7, 2);
INSERT INTO `ums_role_resource_relation` VALUES (319, 7, 3);
INSERT INTO `ums_role_resource_relation` VALUES (320, 7, 4);
INSERT INTO `ums_role_resource_relation` VALUES (321, 7, 5);
INSERT INTO `ums_role_resource_relation` VALUES (322, 7, 6);
INSERT INTO `ums_role_resource_relation` VALUES (323, 7, 7);
INSERT INTO `ums_role_resource_relation` VALUES (324, 7, 8);
INSERT INTO `ums_role_resource_relation` VALUES (325, 7, 9);
INSERT INTO `ums_role_resource_relation` VALUES (326, 7, 10);
INSERT INTO `ums_role_resource_relation` VALUES (327, 7, 11);
INSERT INTO `ums_role_resource_relation` VALUES (328, 7, 12);
INSERT INTO `ums_role_resource_relation` VALUES (329, 7, 13);
INSERT INTO `ums_role_resource_relation` VALUES (330, 7, 14);
INSERT INTO `ums_role_resource_relation` VALUES (331, 7, 15);
INSERT INTO `ums_role_resource_relation` VALUES (332, 7, 16);
INSERT INTO `ums_role_resource_relation` VALUES (333, 7, 17);
INSERT INTO `ums_role_resource_relation` VALUES (334, 7, 18);
INSERT INTO `ums_role_resource_relation` VALUES (335, 7, 19);
INSERT INTO `ums_role_resource_relation` VALUES (336, 7, 20);
INSERT INTO `ums_role_resource_relation` VALUES (337, 7, 21);
INSERT INTO `ums_role_resource_relation` VALUES (338, 7, 22);
INSERT INTO `ums_role_resource_relation` VALUES (339, 7, 23);
INSERT INTO `ums_role_resource_relation` VALUES (340, 7, 24);
INSERT INTO `ums_role_resource_relation` VALUES (341, 7, 25);
INSERT INTO `ums_role_resource_relation` VALUES (342, 7, 26);
INSERT INTO `ums_role_resource_relation` VALUES (343, 7, 27);
INSERT INTO `ums_role_resource_relation` VALUES (344, 7, 28);
INSERT INTO `ums_role_resource_relation` VALUES (345, 7, 29);
INSERT INTO `ums_role_resource_relation` VALUES (346, 7, 30);
INSERT INTO `ums_role_resource_relation` VALUES (347, 7, 31);
INSERT INTO `ums_role_resource_relation` VALUES (348, 7, 32);

-- ----------------------------
-- Table structure for wms_admin_warehouse_relation
-- ----------------------------
DROP TABLE IF EXISTS `wms_admin_warehouse_relation`;
CREATE TABLE `wms_admin_warehouse_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NOT NULL COMMENT '用户ID',
  `warehouse_id` bigint(20) NOT NULL COMMENT '仓库ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `warehouse_id`(`warehouse_id`) USING BTREE,
  CONSTRAINT `wms_admin_warehouse_relation_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `ums_admin` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wms_admin_warehouse_relation_ibfk_2` FOREIGN KEY (`warehouse_id`) REFERENCES `wms_warehouse` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_admin_warehouse_relation
-- ----------------------------
INSERT INTO `wms_admin_warehouse_relation` VALUES (1, 3, 1);
INSERT INTO `wms_admin_warehouse_relation` VALUES (2, 3, 3);
INSERT INTO `wms_admin_warehouse_relation` VALUES (3, 3, 4);
INSERT INTO `wms_admin_warehouse_relation` VALUES (4, 3, 2);
INSERT INTO `wms_admin_warehouse_relation` VALUES (5, 3, 5);

-- ----------------------------
-- Table structure for wms_center
-- ----------------------------
DROP TABLE IF EXISTS `wms_center`;
CREATE TABLE `wms_center`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '国家编码',
  `center_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人姓名',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人电话',
  `post_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '中心邮编',
  `province` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '区',
  `street` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '街道名称',
  `street_Num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '街道号码',
  `detail_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '国家物流中心' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_center
-- ----------------------------
INSERT INTO `wms_center` VALUES (1, 'CN', '中国', '张伟', '13812345678', '100000', '北京市', '北京市', '朝阳区', NULL, NULL, '北京市朝阳区建国路88号');
INSERT INTO `wms_center` VALUES (2, 'FR', '法国', 'Pierre Dupont', '+33 6 12 34 56 78', '75001', 'Île-de-France', 'Paris', 'Paris', NULL, NULL, '1 Rue de Rivoli, 75001 Paris, France');
INSERT INTO `wms_center` VALUES (3, 'GB', '英国', 'John Smith', '+44 7911 123456', 'EC1A 1BB', 'England', 'London', 'Greater London', NULL, NULL, '88 Old Street, London, EC1A 1BB, England');
INSERT INTO `wms_center` VALUES (4, 'DE', '德国', 'Max Müller', '+49 170 1234567', '10115', 'Berlin', 'Berlin', 'Mitte', NULL, NULL, 'Invalidenstraße 123, 10115 Berlin, Deutschland');

-- ----------------------------
-- Table structure for wms_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `wms_warehouse`;
CREATE TABLE `wms_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '仓库名称',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `manager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `contact_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_warehouse
-- ----------------------------
INSERT INTO `wms_warehouse` VALUES (1, '北京仓库', '中国', NULL, NULL, '2025-02-06 13:04:31', 1, '2025-02-07 11:45:21');
INSERT INTO `wms_warehouse` VALUES (2, '上海仓库', '中国', NULL, NULL, '2025-02-06 13:04:31', 1, '2025-02-07 11:45:21');
INSERT INTO `wms_warehouse` VALUES (3, '伦敦仓库', '英国', NULL, NULL, '2025-02-06 13:04:31', 1, '2025-02-07 11:45:21');
INSERT INTO `wms_warehouse` VALUES (4, '巴黎仓库', '法国', NULL, NULL, '2025-02-06 13:04:31', 1, '2025-02-07 11:45:21');
INSERT INTO `wms_warehouse` VALUES (5, '柏林仓库', '德国', NULL, NULL, '2025-02-06 13:04:31', 1, '2025-02-07 11:45:21');
INSERT INTO `wms_warehouse` VALUES (6, NULL, NULL, NULL, NULL, NULL, 1, '2025-02-14 17:31:37');

SET FOREIGN_KEY_CHECKS = 1;
