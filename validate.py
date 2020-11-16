from jsonschema import Draft7Validator
import json
import os
import decimal
import re
import sys

shema_path = "schema"
json_path = "."

keys = (
    ("query_stations_info_res", "查询充电站信息（query_stations_info）"),
    ("notification_stationInfo_req", "充电站状态推送（notification_stationInfo）"),
    ("notification_stationStatus_req", "设备状态变化推送（notification_stationStatus）"),
    ("query_station_status_res", "设备接口状态查询（query_station_status）"),
    ("query_equip_business_policy_res", "查询计费业务策略信息（query_equip_business_policy）"),
    ("query_equip_charge_status_res", "查询充电状态（query_equip_charge_status）"),
    ("notification_equip_charge_status_req",
     "推送充电状态（notification_equip_charge_status）"),
    ("notification_charge_order_info_req",
     "推送充电订单账单信息（notification_charge_order_info）"),
)

# 字段缺失
pattern_required=re.compile(r"'(.+)' is a required property")

# 保留位数不对
# 格式不对
pattern_type=re.compile(r".* is not of type '(.+)'")

# 不在枚举范围内
pattern_not_one_of=re.compile(r"(.*) is not one of .*")



def fun1(schema_str: str, json_str: str,index:int):
    missed_fileds=set()
    wrong_type=set()
    wrong_scale=set()
    not_one_of=set()
    other_error=set()
    schema = json.loads(schema_str)
    json_instance = json.loads(json_str, parse_float=decimal.Decimal)
    validator = Draft7Validator(schema)
    error_set = set()
    message_set=set()
    for error in sorted(validator.iter_errors(json_instance), key=str):
        title = error.schema.get("title")
        instance = error.instance
        message = str(error.message)
        path_str=str(error.path)
        instance_str=cut_str(str(error.instance))
        if error.path:
            target=str(error.path[-1])
        else:
            target=""
        if title and str(title).startswith("%.") and not isinstance(instance, str):
            scale_str = title[2:]
            scale = int(scale_str)
            a = str(instance).split(r".")
            if len(a) == 2 and len(a[1]) == scale:
                continue
            #错误的保留位数
            message = "scale should be "+scale_str
            wrong_scale.add((target,scale_str))
            error_set.add(message+"\n"+path_str +
                    "\n"+instance_str+"\n")
            message_set.add(message)
            continue
        error_set.add(message+"\n"+path_str +
                      "\n"+instance_str+"\n")
        message_set.add(message) 
        

        result=pattern_required.search(message)
        if result:
            missed_fileds.add(result.group(1))
            continue
        
        result=pattern_type.search(message)
        if result:
            wrong_type.add((target,result.group(1)))
            continue

        result=pattern_not_one_of.search(message)
        if result:
            not_one_of.add((target,result.group(1)))
            continue
        
        other_error.add(message)
        
        
        


            
    notes=[str(index)+"、"+keys[index][1],]
    # 字段缺失
    if missed_fileds:
        temp="-> 字段缺失："
        for s in missed_fileds:
            temp+=s+","
        notes.append(temp)
    #类型错误
    if wrong_type:
        temp="-> 类型错误："
        for s in wrong_type:
            temp+=f"{s[0]}应为{s[1]}类型, "
        notes.append(temp)
    #保留小数
    if wrong_scale:
        temp="-> 保留小数位数错误："
        for s in wrong_scale:
            temp+=f"{s[0]}应保留{s[1]}位, "
        notes.append(temp)
    if not_one_of:
        temp="-> 值不在枚举范围内："
        for s in not_one_of:
            temp+=f"{s[0]}的{s[1]}, "
        notes.append(temp)
    # 其他错误
    for s in other_error:
        notes.append(s)


    
            

    i = 0
    for s in error_set:
        i += 1
        print(i, "->>\n", s)
    print("\n\n----------------\n\n")
    i=0
    for s in message_set:
        i+=1
        print(i, "->>\n", s)
    print("\n\n----------------\n\n")
    for s in notes:
        print(s)
    print("\n\n")
def cut_str(s:str)-> str:
    if len(s)>50:
        s=s[:25]+"..."+s[-20:]
    return s

if __name__ == "__main__":  
    while True:
        print("\nenter a number:\n")
        for i, val in enumerate(keys):
            print("%s -> %s" % (i, val[1]))
            print()
        try:
            index = int(input())
            if index >= len(keys):
                print("out of range")
                continue
            # print("输入json字符串，Ctrl+D 结束：")
            # json_strs=sys.stdin.readlines()
            with open(os.path.join(shema_path, "schema_"+keys[index][0]+".json")) as f_schema, open(os.path.join(json_path, "input.json")) as f_json:
                # if json_strs:
                #     json_str="".join(json_strs)
                # else:
                json_str=f_json.read()
                # print("\n")
                # json_str=json.dumps(json.loads(json_str),indent=2)
                # print(json_str)
                schema_str=f_schema.read()
                # f_json.seek(0)
                # f_json.truncate()
                # f_json.write(json_str)
            fun1(schema_str, json_str,index)
        except Exception as e:
            print(e)
            continue
