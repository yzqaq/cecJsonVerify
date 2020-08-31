import decimal
import json

b=json.loads('''{"a":12.222}''',parse_float=decimal.Decimal)
print()

a= decimal.Decimal.from_float(12.222)
print(a)