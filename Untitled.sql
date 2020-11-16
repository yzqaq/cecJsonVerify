DELETE t1
FROM lx_cec_connector_info as t1,
     (
         SELECT min(id) as id,
                operator_id,
                station_id,
                equipment_id,
                connector_id
         FROM lx_cec_connector_info
         GROUP BY operator_id, station_id, equipment_id, connector_id
         HAVING count(id) > 1
     ) as t2
WHERE t1.operator_id = t2.operator_id
  AND t1.station_id = t2.station_id
  And t1.equipment_id = t2.equipment_id
  And t1.connector_id = t2.connector_id
  AND t1.id > t2.id;
delete
from lx_cec_connector_info
where (operator_id, station_id, equipment_id, connector_id) in (select *
                                                                from (select operator_id, station_id, equipment_id, connector_id
                                                                      from lx_cec_connector_info
                                                                      group by operator_id, station_id, equipment_id, connector_id
                                                                      having count(id) > 1) a)
  and id not in (select *
                 from (select min(id)
                       from lx_cec_connector_info
                       group by operator_id, station_id, equipment_id, connector_id
                       having count(id) > 1) b);

delete
from lx_cec_connector_info
where exists(
              select t1.id
              FROM lx_cec_connector_info as t1,
                   (
                       SELECT min(id) as id,
                              operator_id,
                              station_id,
                              equipment_id,
                              connector_id
                       FROM lx_cec_connector_info
                       GROUP BY operator_id, station_id, equipment_id, connector_id
                       HAVING count(id) > 1
                   ) as t2
              WHERE t1.operator_id = t2.operator_id
                AND t1.station_id = t2.station_id
                And t1.equipment_id = t2.equipment_id
                And t1.connector_id = t2.connector_id
                AND t1.id > t2.id);


alter table lx_tb_equipment_info
    add unique unique_operator_id_and_station_id_and_equipment_id (operator_id, station_id, equipment_id);
create unique index uni_operator_id_and_station_id_and_equipment_id_and_connector_id
    on lx_cec_connector_info (operator_id, station_id, equipment_id, connector_id);

delete
from lx_cec_connector_info
where not id = 266693
  and operator_id = 'MA1MY0GF9'
  and station_id = '139'
  and equipment_id = '32010200000413'
  and connector_id = ' 3201020000000861';
delete
from lx_cec_connector_info
where not id = 266692
  and operator_id = 'MA1MY0GF9'
  and station_id = '139'
  and equipment_id = '32010200000414'
  and connector_id = ' 3201020000000862';
delete
from lx_cec_connector_info
where not id = 304030
  and operator_id = 'MA1MY0GF9'
  and station_id = '26976'
  and equipment_id = '32010600018533'
  and connector_id = ' 3201060001854401';
delete
from lx_cec_connector_info
where not id = 304029
  and operator_id = 'MA1MY0GF9'
  and station_id = '26976'
  and equipment_id = '32010600018534'
  and connector_id = ' 3201060001854301';
delete
from lx_cec_connector_info
where not id = 304027
  and operator_id = 'MA1MY0GF9'
  and station_id = '26976'
  and equipment_id = '32010600018535'
  and connector_id = ' 3201060001854201';
delete
from lx_cec_connector_info
where not id = 304025
  and operator_id = 'MA1MY0GF9'
  and station_id = '26976'
  and equipment_id = '32010600018536'
  and connector_id = ' 3201060001854101';

delete
from lx_cec_connector_info
where id = 369011
  and operator_id = '313744932'
  and station_id = '331358'
  and equipment_id = '12000000000000010323379'
  and connector_id = '12000000000000010323379002';

#count(id),id,operator_id,station_id,equipment_id,connector_id
# 2,369010,313744932,331358,12000000000000010323379,12000000000000010323379002
# 247,266693,MA1MY0GF9,139,32010200000413, 3201020000000861
# 247,266692,MA1MY0GF9,139,32010200000414, 3201020000000862
# 247,304030,MA1MY0GF9,26976,32010600018533, 3201060001854401
# 247,304029,MA1MY0GF9,26976,32010600018534, 3201060001854301
# 247,304027,MA1MY0GF9,26976,32010600018535, 3201060001854201
# 247,304025,MA1MY0GF9,26976,32010600018536, 3201060001854101


delete
from lx_tb_connector_info
where id in (334336,
             334338,
             332484,
             332486,
             333691,
             330992,
             333282,
             331195,
             331193,
             331191,
             331189,
             331187,
             331184,
             331182,
             331180,
             331178,
             331176,
             331174,
             329970,
             329968,
             329966,
             332259,
             332257,
             332252,
             332250,
             332248,
             332246,
             332244,
             327215,
             327213,
             331976,
             331974,
             331972,
             331970,
             331968,
             321360,
             321358,
             334039,
             321667,
             321665,
             321663,
             321661,
             321659,
             330537,
             330535,
             330528,
             330526,
             330524,
             330522,
             330520,
             330518,
             329954,
             327729,
             327727,
             327725,
             327723,
             327721,
             327719,
             327717,
             327715,
             327713,
             174532,
             174534,
             174536,
             174538,
             174540,
             174542);

select * ,count(id)from  lx_cec_connector_info group by operator_id ,station_id,equipment_id,connector_id having count(id)>1;
select * from lx_tb_connector_info  where operator_id='551433697' and connector_id='21101050025120061';
select distinct  * from lx_tb_station_info  where operator_id='MA5DT8Q54' and business_hours='24';

insert into simulated_cec_connector_flow_detail (flow_id, connector_id, phase, detail) select id,connector_id,9,'{"powerPerSecond":0.02}' from simulated_cec_connector_flow where not exists( select  id from simulated_cec_connector_flow_detail where phase=9 and simulated_cec_connector_flow.id = simulated_cec_connector_flow_detail.flow_id);

select * from simulated_cec_connector_flow_detail where phase=9;

update simulated_cec_connector_status_info set operator_id='11111111' where operator_id is null;

select * from simulated_cec_connector_status_info where operator_id is null;

update simulated_cec_connector_status_info set connector_id='11111111_20200910143531160972' where connector_id='1111111120200910143531160972';
update simulated_cec_connector_flow set connector_id='11111111_20200910143531160972' where connector_id='1111111120200910143531160972';
update simulated_cec_connector_flow_detail set connector_id='11111111_20200910143531160972' where connector_id='1111111120200910143531160972';
update simulated_cec_connector_info set connector_id='11111111_20200910143531160972' ,equipment_id='11111111_20200910143531160972' where connector_id='1111111120200910143531160972';
update simulated_cec_equipment_info set equipment_id='11111111_20200910143531160972' where equipment_id='1111111120200910143531160972';

select * from lx_tb_equipment_info group by operator_id,station_id,equipment_id having count(id)>1;
select * from lx_tb_equipment_info where station_id='s149' and operator_id='40' and equipment_id='332510200013';

select * from simulated_cec_station_info;
select * from  lx_reverse_open_operator where app_id='a' and operator_id='b';

select * from lx_tb_station_info where full_station_id='11111111_1';
update lx_tb_station_info set is_online=1 where id=20588;

select * from  lx_reverse_open_operator where app_id='MA5DT8Q54' and operator_id='313744932';

select * from lx_reverse_station_privilege where app_id='MA5DT8Q54';


select * from lx_reverse_station_privilege_detail where app_id='MA5DT8Q54' and is_open=1;

update simulated_cec_connector_flow_detail set detail='{"failReason":0,"policyInfo":[{"elecPrice":0.1000,"sevicePrice":0.0600,"startTime":"000000"}]}' where phase=1;

update simulated_cec_connector_flow_detail set detail=
    '{"failReason":0,"policyInfo":[{"elecPrice":0.6000,"sevicePrice":1.0000,"startTime":"000000"},{"elecPrice":0.8000,"sevicePrice":1.2000,"startTime":"233000"},{"elecPrice":0.3000,"sevicePrice":1.3000,"startTime":"143030"},{"elecPrice":0.4000,"sevicePrice":1.4000,"startTime":"144040"},{"elecPrice":0.5000,"sevicePrice":1.5000,"startTime":"145050"},{"elecPrice":0.0500,"sevicePrice":1.0500,"startTime":"140050"},{"elecPrice":0.1500,"sevicePrice":1.1500,"startTime":"141550"}]}'
where phase=1 and connector_id='1111111120200916134413411690';

create table lx_tb_fetch_record
(
    id              bigint unsigned auto_increment primary key not null comment '主键',
    app_id          varchar(45) default ''                     not null comment ' cpoa的operator_id',
    operator_id     varchar(45) default ''                     not null comment 'cpob的operator_id',
    station_id      varchar(45) default ''                     not null comment '拉取站id',
    full_station_id varchar(90) default ''                     not null comment '供应商id+站id组合',
    create_time     timestamp   default CURRENT_TIMESTAMP      not null comment '创建时间',
    update_time     timestamp   default CURRENT_TIMESTAMP      not null on update CURRENT_TIMESTAMP comment '更新时间',
    unique index unique_a_b_station (app_id, operator_id, station_id)
) charset = utf8mb4
  ENGINE = InnoDB comment '模拟车企拉取到的站的记录';

create table lx_cec_app_fetch_auth_info
(
    id                bigint(11) unsigned auto_increment
        primary key,
    operator_id       varchar(20)  default ''                not null comment '运营商ID',
    start_operator_id varchar(20)  default ''                not null comment '作为拉取的start_operator_id',
    operator_secret   varchar(256) default ''                not null comment '运营商密钥',
    data_secret       varchar(256) default ''                not null comment '数据加密秘钥',
    data_secret_iv    varchar(256) default ''                not null comment '数据加密初始向量',
    sig_secret        varchar(256) default ''                not null comment '签名秘钥',
    domain            varchar(128) default ''                not null comment '回调地址',
    operator_name     varchar(128) default ''                not null comment '车企运营商ID',
    create_time       timestamp    default CURRENT_TIMESTAMP null comment '创建时间',
    update_time       timestamp    default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新时间',
    index operator_id (start_operator_id)
) charset = utf8mb4
  ENGINE = InnoDB comment '模拟车企拉取的密钥信息';

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
select ltsi.* from lx_tb_station_info ltsi  join lx_reverse_station_privilege_detail lrsps on ltsi.full_station_id=lrsps.target_id and lrsps.is_open=1 and lrsps.app_id='MA5DT8Q54' where 1=1 and  ltsi.is_online=1 and ltsi.station_status=50 and ltsi.removed=0 and ltsi.update_time> '1970-01-01 00:00:00.0' and ltsi.full_station_id in ("313744932_313744932^s00001") and ((ltsi.operator_id='395815801' and ltsi.equipment_owner_id in ("MAIMNW79X","MA76EL682","MA759KKPX","MA73ND6F4","MA6XDHJT3","MA6U0FJU2","MA6TY7EG9","MA6K5H990","MA6DLHJ01","MA66F8RC7","MA65QDG95","MA624AXX9","MA61X1K76","MA5URRPB3","MA5U7WHK0","MA5U6BEC3","MA5U3W7Q4","MA5RD4W65","MA5KBC3B6","MA5D8N5P0","MA5D3FLM9","MA5D35K13","MA5CR1FR3","MA547A46X","MA52BM841","MA4R0X2L3","MA4PM99U4","MA4M2H036","MA4KLRKG9","MA493XJ69","MA3X79WU4","MA3PYTHK1","MA3N2HEF2","MA3MH2R45","MA3L72PP9","MA3EMM7XX","MA3CR7PH8","MA3CEE2W2","MA3CDKM68","MA3CD64N4","MA3CBB53X","MA3C92U84","MA3833DB7","MA36Y70L4","MA2Y5Y8TX","MA2XNA8L6","MA2TT5K30","MA2MX9G58","MA2AKF202","MA29G8825","MA2945DL9","MA28PE870","MA2824QJ0","MA27U0609","MA20PP988","MA2040571","MA2023X26","MA1YNF196","MA1YK90DX","MA1Q322N5","MA1MGGMJ5","MA1MD8HQ2","MA1K3FHH1","MA1G81HD4","MA0Y5K1KX","MA0QEJD79","MA0Q55J10","MA0H076N8","MA0H03AR5","MA0GU44YX","MA0GTYRR5","MA08K09X0","MA07XEYX8","MA07TD0P1","MA07RGGKX","MA07PHJE1","MA07NJM94","MA07NH072","MA07NGFU3","MA07NEH80","MA07LF7Q6","MA009B0Q9","M00001K51","777468446","766854544","729458251","717883218","706328307","697532831","683749669","661395302","660831133","63370987X","630323003","607298261","570448288","429290434","429253166","429251435","429251232","395815801","358300956","350525907","348904123","347455653","340898857","333761801","32687121X","32592974X","323225482","322481791","320619283","20745323-4","109800132","099664201","090313501","081447057","069445120")) or  ltsi.operator_id in ("MA002TMQX","313744932","11111111"))