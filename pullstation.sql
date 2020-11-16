CREATE TABLE `lx_cec_app_fetch_auth_info` (
`id` bigint unsigned NOT NULL AUTO_INCREMENT,
`operator_id` varchar(20) NOT NULL DEFAULT '' COMMENT '运营商ID',
`app_id` varchar(20) NOT NULL DEFAULT '' COMMENT 'start_operator_id  对应的在联行的app_id',
`start_operator_id` varchar(20) NOT NULL DEFAULT '' COMMENT '作为拉取的start_operator_id',
`operator_secret` varchar(256) NOT NULL DEFAULT '' COMMENT '运营商密钥',
`data_secret` varchar(256) NOT NULL DEFAULT '' COMMENT '数据加密秘钥',
`data_secret_iv` varchar(256) NOT NULL DEFAULT '' COMMENT '数据加密初始向量',
`sig_secret` varchar(256) NOT NULL DEFAULT '' COMMENT '签名秘钥',
`domain` varchar(128) NOT NULL DEFAULT '' COMMENT '回调地址',
`operator_name` varchar(128) NOT NULL DEFAULT '' COMMENT '运营商名称',
`create_time` timestamp Not NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp  not NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
UNIQUE KEY `uniq_start_operator_id_and_operator_id_` (`start_operator_id`,`operator_id`),
KEY `idx_lx_cec_app_fetch_auth_info_app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定向站拉取的密钥信息';
CREATE TABLE `lx_tb_fetch_record` (
`id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
`app_id` varchar(45) NOT NULL DEFAULT '' COMMENT ' cpoa的operator_id',
`operator_id` varchar(45) NOT NULL DEFAULT '' COMMENT 'cpob的operator_id',
`station_id` varchar(45) NOT NULL DEFAULT '' COMMENT '拉取站id',
`full_station_id` varchar(90) NOT NULL DEFAULT '' COMMENT '供应商id+站id组合',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (`id`),
UNIQUE KEY `uniq_a_b_station` (`app_id`,`operator_id`,`station_id`),
KEY `idx_update_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='定向站的拉取记录'