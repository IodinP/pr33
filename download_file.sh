#!/bin/bash
URL="https://jsonplaceholder.typicode.com/todos/1" # Тестовый JSON файл
DATE=$(date +%Y-%m-%d-%H-%M-%S)
FILENAME="downloaded-file-$DATE.json"
LOGFILE="download-errors.log"

# Скачиваем файл и сразу проверяем статус
# -f (fail) заставляет curl возвращать ошибку при кодах 400+
if curl -f -s "$URL" -o "$FILENAME"; then
    echo "Файл успешно скачан: $FILENAME"
else
    echo "Ошибка при скачивании $URL"
    echo "$(date): Ошибка скачивания $URL" >> "$LOGFILE"
fi
