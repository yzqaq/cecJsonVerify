这是cec联调标准的json校验工具

## 依赖
pip install jsonschema
## 使用方法
将对应的data json 粘贴到 input.json  
然后执行
python3 validate.py 
推荐和 vscode 一起使用

```shell
$ python3 validate.py 

enter a number:

0 -> 查询充电站信息（query_stations_info）

1 -> 充电站状态推送（notification_stationInfo）

2 -> 设备状态变化推送（notification_stationStatus）

3 -> 设备接口状态查询（query_station_status）

4 -> 查询计费业务策略信息（query_equip_business_policy）

5 -> 查询充电状态（query_equip_charge_status）

6 -> 推送充电状态（notification_equip_charge_status）

7 -> 推送充电订单账单信息（notification_charge_order_info）

#  ******** 运行结果 ******

----------------


0、查询充电站信息（query_stations_info）
-> 字段缺失：ServiceTax,ElectricityFee,ParkFee,ParkFeeFree,ServiceFee,ElectricityTax,
-> 类型错误：StationLng应为number类型, StationLat应为number类型, 
-> 保留小数位数错误：Power应保留1位, 
```
