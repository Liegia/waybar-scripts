#!/bin/bash

status=$(mullvad status)

if echo "$status" | grep -q "^Connected"; then
    city=$(echo "$status" | grep "Visible location" | sed 's/.*Sweden, \([^.]*\).*/\1/')
    ip=$(echo "$status" | grep -oP 'IPv4: \K[0-9.]+')
    echo "{\"text\": \"󰖂 Connected. $city. $ip\", \"class\": \"connected\"}"
else
    echo "{\"text\": \"󰖂 Disconnected\", \"class\": \"disconnected\"}"
fi
