#! /bin/bash

api="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI3ODIwOGZmYjk2OGU0MmNlOTNmOGZlMWMwMGYwOTY5MyIsImlhdCI6MTU5NTgyMzcwNywiZXhwIjoxOTExMTgzNzA3fQ.I7ywE5NiHzdTBFzqTORliwt4nnHqEvsOiIfh8laSHBY"
entity="light.spare_room"
host="192.168.1.254"

result=$(curl -X GET -H "Authorization: Bearer $api" -H "Content-Type: application/json" http://$host:8123/api/states/$entity | jq -r '.state')

if [ $result == "off" ]; then
	curl -X POST -H "Authorization: Bearer $api" -H "Content-Type: application/json" -d '{"entity_id": "'"$entity"'"}' http://$host:8123/api/services/light/turn_on
	echo "on"
else
	curl -X POST -H "Authorization: Bearer $api" -H "Content-Type: application/json" -d '{"entity_id": "'"$entity"'"}' http://$host:8123/api/services/light/turn_off
	echo "off"
fi
