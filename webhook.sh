#!/bin/bash
clear
TOKEN=$(echo ${GH_TOKEN})
echo $TOKEN
curl -X POST -H "Accept: application/vnd.github+json" -H "Authorization: token $TOKEN" \
-d '{"event_type": "webhook", "client_payload": {"key": "value"}}' https://api.github.com/repos/60pportunities/documentacao/dispatches
