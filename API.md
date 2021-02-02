# API Documentation

## Add Row

Json Structure 
```Json
[
  { "transaction_id" : 100000000001, "item_id": 7, "item_name": "Basic T-shirt", "name": "Mia Khalifa","number": 6,"size": "M", "date": "2021-01-01" },
  { "transaction_id" : 100000000001, "item_id": 7, "item_name": "Basic T-shirt", "name": "Eimi Fukada","number": 9,"size": "XS", "date": "2021-01-01" },
  { "transaction_id" : 100000000001, "item_id": 7, "item_name": "Basic T-shirt", "name": "Lexi Lore","number": 12,"size": "XXS", "date": "2021-01-01" }
]
```

POST to ` http://$URL/add_row `