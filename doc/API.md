# API reference


## invoice

### 取得
#### request
- method: `GET`
- uri: `/v1/invoice/{invoiceID}`

#### response



- body
```json
{
    "incoiceID": "12345"
}
```






### 登録
#### request
- method: `PSOT`
- uri: `/v1/invoice`


#### response

```json

{
    "invoiceID": "12345",
    "createdAt":"2022-04-05 10:50:33.123 TIME型",
    "payer": {
        "name": "latona",
        "address": "ハラジュ区"
    },
    "claimant":{
        "name": "butterflygate",
        "address": "ハラジュ区"
    },
    "quotationID":"123456",
    "due-date":"2022-05-31 23:59:59.999 time型",
    "total-amount": 1400000,
    "charge-detail":[
        {
            "number":1,
            "description":"6月作業分",
            "quantity":24,
            "unit":"days",
            "unit-price": 55000,
            "subtotal": 1320000,
            "tax": 132000,
            "total":1452000
        },
        {
            "number":2,
            "description":"出張費用",
            "quantity":2,
            "unit":"days",
            "unit-price": 5000,
            "subtotal": 10000,
            "tax": 1000,
            "total":11000
        }
    ]
}
```


