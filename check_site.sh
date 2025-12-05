#!/bin/bash
URL="http://google.com"  # Можешь заменить на любой другой
DATE=$(date +%Y-%m-%d)
LOGFILE="errors-$DATE.log"

# Проверяем статус код (-o /dev/null скрывает тело ответа, -w %{http_code} выводит только код)
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$HTTP_STATUS" -eq 200 ]; then
    echo "$(date): $URL - OK"
else
    echo "$(date): $URL - FAIL (Status: $HTTP_STATUS)"
    # Записываем ошибку в лог
    echo "$(date): $URL - FAIL (Status: $HTTP_STATUS)" >> "$LOGFILE"
fi

