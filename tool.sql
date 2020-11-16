# 站点权限排查
select id,is_online from lx_tb_station_info where full_station_id='11111111_1';
update lx_tb_station_info set is_online=1 where id=20588;

select * from  lx_reverse_open_operator where app_id='324887859' and operator_id='MA5DT8Q54';

select * from lx_reverse_station_privilege where app_id='324887859';


select * from lx_reverse_station_privilege_detail where app_id='324887859' and is_open=1 ;

update simulated_cec_connector_flow_detail set detail='{"failReason":0,"policyInfo":[{"elecPrice":0.1000,"sevicePrice":0.0600,"startTime":"000000"}]}' where phase=1;

update simulated_cec_connector_flow_detail set detail=
    '{"failReason":0,"policyInfo":[{"elecPrice":0.6000,"sevicePrice":1.0000,"startTime":"000000"},{"elecPrice":0.8000,"sevicePrice":1.2000,"startTime":"233000"},{"elecPrice":0.3000,"sevicePrice":1.3000,"startTime":"143030"},{"elecPrice":0.4000,"sevicePrice":1.4000,"startTime":"144040"},{"elecPrice":0.5000,"sevicePrice":1.5000,"startTime":"145050"},{"elecPrice":0.0500,"sevicePrice":1.0500,"startTime":"140050"},{"elecPrice":0.1500,"sevicePrice":1.1500,"startTime":"141550"}]}'
where phase=1 and connector_id='1111111120200916134413411690';


-- dfsf 
select id,station_id, is_online from lx_tb_station_info where operator_id='11111111' ;

update lx_tb_station_info  set is_online=1 where  station_id='313744932^s00001';

SELECT 
    is_online, removed
FROM
    lx_tb_station_info
WHERE
    station_id = '313744932^s00001';


use hlht_test;
select ltsi.* from lx_tb_station_info ltsi  join lx_reverse_station_privilege_detail lrsps on ltsi.full_station_id=lrsps.target_id and lrsps.is_open=1 and lrsps.app_id='MA5DT8Q54' where 1=1 and  ltsi.is_online=1 and ltsi.station_status=50 and ltsi.removed=0 and ltsi.update_time> '1970-01-01 00:00:00.0' and ltsi.full_station_id in ("313744932_313744932^s00001") and ((ltsi.operator_id='395815801' and ltsi.equipment_owner_id in ("MAIMNW79X","MA76EL682","MA759KKPX","MA73ND6F4","MA6XDHJT3","MA6U0FJU2","MA6TY7EG9","MA6K5H990","MA6DLHJ01","MA66F8RC7","MA65QDG95","MA624AXX9","MA61X1K76","MA5URRPB3","MA5U7WHK0","MA5U6BEC3","MA5U3W7Q4","MA5RD4W65","MA5KBC3B6","MA5D8N5P0","MA5D3FLM9","MA5D35K13","MA5CR1FR3","MA547A46X","MA52BM841","MA4R0X2L3","MA4PM99U4","MA4M2H036","MA4KLRKG9","MA493XJ69","MA3X79WU4","MA3PYTHK1","MA3N2HEF2","MA3MH2R45","MA3L72PP9","MA3EMM7XX","MA3CR7PH8","MA3CEE2W2","MA3CDKM68","MA3CD64N4","MA3CBB53X","MA3C92U84","MA3833DB7","MA36Y70L4","MA2Y5Y8TX","MA2XNA8L6","MA2TT5K30","MA2MX9G58","MA2AKF202","MA29G8825","MA2945DL9","MA28PE870","MA2824QJ0","MA27U0609","MA20PP988","MA2040571","MA2023X26","MA1YNF196","MA1YK90DX","MA1Q322N5","MA1MGGMJ5","MA1MD8HQ2","MA1K3FHH1","MA1G81HD4","MA0Y5K1KX","MA0QEJD79","MA0Q55J10","MA0H076N8","MA0H03AR5","MA0GU44YX","MA0GTYRR5","MA08K09X0","MA07XEYX8","MA07TD0P1","MA07RGGKX","MA07PHJE1","MA07NJM94","MA07NH072","MA07NGFU3","MA07NEH80","MA07LF7Q6","MA009B0Q9","M00001K51","777468446","766854544","729458251","717883218","706328307","697532831","683749669","661395302","660831133","63370987X","630323003","607298261","570448288","429290434","429253166","429251435","429251232","395815801","358300956","350525907","348904123","347455653","340898857","333761801","32687121X","32592974X","323225482","322481791","320619283","20745323-4","109800132","099664201","090313501","081447057","069445120")) or  ltsi.operator_id in ("MA002TMQX","313744932","11111111"));

select * from lx_tb_station_info where is_online=0 order by update_time  desc;

#
#模拟桩相关
#

# 查询模拟枪上架情况
SELECT id,  is_online,station_id,area_code FROM hlht_test.lx_tb_station_info where (station_id,operator_id) in (select station_id,operator_id from simulated_cec_station_info);
select id ,station_id,area_code from lx_cec_station_info where(station_id,operator_id) in (select station_id,operator_id from simulated_cec_station_info);

select * from lx_tb_station_info where operator_id='11111111' or station_id like 'MA002TMQX^s00001%';
select * from lx_cec_station_info where operator_id='11111111';
select * from lx_cec_connector_info where connector_id='MA002TMQX^071207';
select * from lx_tb_check_field;
select * from lx_tb_station_picture where operator_id='11111111';
select * from lx_tb_station_tag where  station_id='MA002TMQX^s00001';
select * from lx_tb_base_dict;
select * from simulated_cec_station_info where station_id='17' or station_id='MA002TMQX^s00001' or station_id='16';
select * from simulated_cec_connector_flow_detail where phase=1 and  connector_id in (select connector_id from simulated_cec_connector_info where station_id='MA002TMQX^s00001');
UPDATE `hlht_test`.`simulated_cec_connector_flow_detail` SET `detail` = '{\"failReason\":0,\"policyInfo\":[{\"elecPrice\":0.2000,\"sevicePrice\":0.0600,\"startTime\":\"000000\"}]}' WHERE (`id` in (select * from (select id from simulated_cec_connector_flow_detail where phase=1 and  connector_id in (select connector_id from simulated_cec_connector_info where station_id='MA002TMQX^s00001'))ids) );
INSERT INTO `hlht_test`.`lx_tb_station_tag` (`operator_id`, `station_id`, `tag_type`, `tag_code`, `tag_value`) VALUES ('MA002TMQX', 'MA002TMQX^s00001', 'station_tag_assorted_facilities', '2', '简餐');
INSERT INTO `hlht_test`.`lx_tb_station_tag` (`operator_id`, `station_id`, `tag_type`, `tag_code`, `tag_value`) VALUES ('MA002TMQX', 'MA002TMQX^s00001', 'station_tag_oil_place_hold', '1', '严重');
INSERT INTO `hlht_test`.`lx_tb_station_tag` (`operator_id`, `station_id`, `tag_type`, `tag_code`, `tag_value`) VALUES ('MA002TMQX', 'MA002TMQX^s00001', 'station_tag_park_fee', '1', '免费停车');
INSERT INTO `hlht_test`.`lx_tb_station_tag` (`operator_id`, `station_id`, `tag_type`, `tag_code`, `tag_value`) VALUES ('MA002TMQX', 'MA002TMQX^s00001', 'station_tag_park_postition', '2', '地下');

#
#分户拉站相关
#
select * from lx_cec_app_fetch_auth_info ;
select id,station_id,is_online,is_uniev_mode,station_status from  lx_tb_station_info where full_station_id='11111111_16' or full_station_id='339767534_1308268090307514368';

 select * from  lx_tb_station_info where full_station_id='11111111_16' or full_station_id='339767534_1308268090307514368';
update lx_reverse_operator_auth_info set app_secret='a762796b2a8989b8',data_secret='98f46ab6481d87c4',data_secret_iv='978170fd1c11a70e',domain='https://api.uniev.com/evcs-cec/' where id=23;

# 其他
select * from lx_cec_charge_order_info where start_charge_seq='MA01H3BQ1202010161143580001' order by update_time desc;

show create table lx_tb_station_info;

select * from lx_tb_bank_info;


