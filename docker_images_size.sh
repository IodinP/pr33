#!/bin/bash
DATE=$(date +%Y-%m-%d)
FILENAME="docker-images-sizes-$DATE.txt"

echo "Отчет за $(date)" > "$FILENAME"
echo "---------------------------------" >> "$FILENAME"

# Выводим список всех образов
docker images --format "table {{.Repository}}:{{.Tag}}\t{{.Size}}" >> "$FILENAME"

echo "" >> "$FILENAME"
echo "Самый большой образ:" >> "$FILENAME"
# Сортируем по размеру и берем первый (упрощенная логика, docker images не всегда удобно сортировать bash-ем)
docker images --format "{{.Size}}\t{{.Repository}}:{{.Tag}}" | sort -hr | head -n 1 >> "$FILENAME"

echo "Отчет сохранен в $FILENAME"
