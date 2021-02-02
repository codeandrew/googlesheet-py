#!/bin/bash
set -x

COUNTER=$1
SUBPATH="add_review"
URL="http://0.0.0.0:32772/${SUBPATH}"
JSON='{"email":"example@email.com","date": "2021-01-01" ,"score":"$COUNTER" }'

echo $URL
curl -d "$JSON" -H 'Content-Type: application/json' $URL

