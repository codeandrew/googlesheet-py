#!/bin/bash

COUNTER=$1
SUBPATH="create_sheet"
#DOMAIN=https://stimulusathletic-dwit4dasba-as.a.run.app
DOMAIN=http://0.0.0.0:8080
URL="${DOMAIN}/${SUBPATH}"

JSON='[{ "transaction_id" : 100000000001, "item_id": 7, "item_name": "Basic T-shirt", "name": "Mia Khalifa","number": 6,"size": "M", "date": "2021-01-01" }, { "transaction_id" : 100000000001, "item_id": 7, "item_name": "Basic T-shirt", "name": "Eimi Fukada","number": 9,"size": "XS", "date": "2021-01-01" }, { "transaction_id" : 100000000001, "item_id": 7, "item_name": "Basic T-shirt", "name": "Lexi Lore","number": 12,"size": "XXS", "date": "2021-01-01" }]'

echo $URL
curl -d "$JSON" -H 'Content-Type: application/json' $URL

#curl -X POST $URL

