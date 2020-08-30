from jsonschema import Draft7Validator
import json
import os
import decimal

shema_path = "schema"
json_path = "json"


def fun1(schema_file: str, json_file: str):
    with open(os.path.join(shema_path, schema_file+".json")) as f_schema, open(os.path.join(json_path, json_file+".json")) as f_json:
        schema = json.load(f_schema)
        json_instance = json.load(f_json, parse_float=decimal.Decimal)
    validator = Draft7Validator(schema)
    error_set = set()
    for error in sorted(validator.iter_errors(json_instance), key=str):
        title = error.schema.get("title")
        instance = error.instance
        message = error.message
        if title and str(title).startswith("%.") and isinstance(instance, decimal.Decimal):
            scale_str = title[2:]
            scale = int(scale_str)
            a = str(instance).split(r".")
            if len(a) == 2 and len(a[1]) == scale:
                continue
            else:
                message = "scale should be "+scale_str
        error_set.add(str(message)+"\n"+str(error.path) +
                      "\n"+str(error.instance)+"\n")

    i = 0
    for s in error_set:
        i += 1
        print(i, "->>\n", s)


if __name__ == "__main__":
    keys = [

        "notification_charge_order_info_req",
        "notification_stationInfo_req",
        "otification_stationStatus_req",
        "query_equip_business_policy_res",
        "query_equip_charge_status_res",
        "query_stations_info_res"
    ]
    while True:
        print("\nenter a number:\n")
        for i, val in enumerate(keys):
            print("%s -> %s" % (i, val))
            print()
        try:
            index = int(input())
        except Exception:
            continue
        if index >= len(keys):
            print("out of range")
            continue
        fun1("schema_"+keys[index], keys[index])
