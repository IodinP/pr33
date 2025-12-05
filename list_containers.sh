#!/bin/bash
DATE=$(date +%Y-%m-%d)
FILENAME="containers-$DATE.txt"

echo "Дата проверки: $(date)" > "$FILENAME"
echo "---------------------------------" >> "$FILENAME"

# Получаем список запущенных контейнеров и дописываем в файл
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}" >> "$FILENAME"

echo "Список контейнеров сохранен в $FILENAME"
