import decimal
import json

b=json.loads('''{"a":12.222}''',parse_float=decimal.Decimal)
print()

a= decimal.Decimal.from_float(12.222)
print(a)
"select operator_id,connector_id from lx_cec_connector_info group by operator_id,connector_id having count(id)>1;"





select *,count(id) from lx_cec_connector_info group by operator_id,station_id,equipment_id,connector_id having count(id)>1 