alter table pms_product add column product_vender_code varchar (32) ;
alter table pms_product add column create_time datetime;
alter table pms_product add column status_time datetime;
alter table pms_product add column sales_time datetime;
alter table pms_product add column product_tag varchar (256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL comment ‘商品标签，一个商品有多个标签，逗号分割存储，查询用like模糊匹配’;

alter table oms_order add column sales_channel_code varchar (32);;
alter table oms_order add column order_country_numb varchar (16) comment ‘订单的归属国家，取发货地址的联系电话开头国家码，预留字段’;
alter table oms_order add column order_sales_channel varchar (16) comment ‘订单销售渠道码，在一个销售商有多个销售渠道时使用，预留字段’;
alter table oms_order add column status_time datetime;
alter table oms_order add column package_id varchar(56) comment ‘供货商发货的包裹单号’;
alter table oms_order add column package_status varchar (16);
alter table oms_order add column package_create_time datetime;
alter table oms_order add column package_status_time datetime;

alter table ums_role add column rule_limit_tag_type varchar (32);
alter table ums_role add column rule_limit_tag_code varchar (32);
alter table ums_role add column rule_limit_tag_name varchar (64);
