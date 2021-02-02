#!/bin/bash
set -x

COUNTER=$1
SUBPATH="add_row"
URL="http://0.0.0.0:8080/${SUBPATH}"
#JSON='{"email":"example@email.com","date": "2021-01-01" ,"score":"$COUNTER" }'

# JSON='{ "transaction_id" : 123123456456, "item_id": 123, "item_name": "Basic T-shirt", "name": "Billy Santors","number": 10,"size": "XXL", "date": "2021-01-01" }'

JSON='[{ "transaction_id" : 100000000001, "item_id": 7, "item_name": "Basic T-shirt", "name": "Mia Khalifa","number": 6,"size": "M", "date": "2021-01-01" }, { "transaction_id" : 100000000001, "item_id": 7, "item_name": "Basic T-shirt", "name": "Eimi Fukada","number": 9,"size": "XS", "date": "2021-01-01" }, { "transaction_id" : 100000000001, "item_id": 7, "item_name": "Basic T-shirt", "name": "Lexi Lore","number": 12,"size": "XXS", "date": "2021-01-01" }]'
echo $URL
curl -d "$JSON" -H 'Content-Type: application/json' $URL

