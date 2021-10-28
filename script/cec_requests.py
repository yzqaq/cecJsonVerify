import requests

def encrypt():
    

def query_token():
    url=""
    head= {'Content-Type': 'application/json'}
    payload = {'CountryName': '中国',
               'ProvinceName': '四川省',
               'L1CityName': 'chengdu',
               'L2CityName': 'yibing',
               'TownName': '',
               'Longitude': '107.33393',
               'Latitude': '33.157131',
               'Language': 'CN'}
    r=requests.post(url,headers=head,data=payload)
    print(r)
