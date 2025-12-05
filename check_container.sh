#!/bin/bash
CONTAINER_NAME=$1 # Имя контейнера берем из аргумента запуска
DATE=$(date +%Y-%m-%d)
LOGFILE="container-status-$DATE.log"

if [ -z "$CONTAINER_NAME" ]; then
    echo "Использование: ./check_container.sh <имя_контейнера>"
    exit 1
fi

# Проверяем, запущен ли контейнер
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Контейнер $CONTAINER_NAME уже запущен."
    STATUS=$(docker ps -f name=$CONTAINER_NAME --format "{{.Status}}")
    echo "$(date): $CONTAINER_NAME is RUNNING ($STATUS)" >> "$LOGFILE"
else
    echo "Контейнер $CONTAINER_NAME не запущен. Запускаю..."
    docker start $CONTAINER_NAME
    if [ $? -eq 0 ]; then
        echo "$(date): $CONTAINER_NAME was STOPPED, now STARTED" >> "$LOGFILE"
    else
        echo "$(date): Failed to start $CONTAINER_NAME" >> "$LOGFILE"
    fi
fi
