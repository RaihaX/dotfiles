#! /bin/bash

api="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiI3ODIwOGZmYjk2OGU0MmNlOTNmOGZlMWMwMGYwOTY5MyIsImlhdCI6MTU5NTgyMzcwNywiZXhwIjoxOTExMTgzNzA3fQ.I7ywE5NiHzdTBFzqTORliwt4nnHqEvsOiIfh8laSHBY"
entity="light.spare_room"
host="192.168.1.254"

result=$(curl --silent -X GET -H "Authorization: Bearer $api" -H "Content-Type: application/json" http://$host:8123/api/states/$entity | jq -r '.state')

if [ $result == "off" ]; then
		echo "%{F#d8dee9}"
else
		echo "%{F5e81ac}"
fi		
