#!/bin/sh

URL="https://www.reddit.com/message/unread/.json?feed=a6181789989f0c3207acc822628d26e0c577e15a&user=rthee"
USERAGENT="polybar-scripts/notification-reddit:v1.0 u/rthee"

notifications=$(curl -sf --user-agent "$USERAGENT" "$URL" | jq '.["data"]["children"] | length')

if [ -n "$notifications" ] && [ "$notifications" -gt 0 ]; then
    echo "$notifications"
else
    echo "0"
fi
