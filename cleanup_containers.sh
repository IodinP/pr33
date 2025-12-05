#!/bin/bash
LOGFILE="cleanup.log"

echo "Поиск остановленных контейнеров..."

# Получаем список ID остановленных контейнеров
CONTAINERS=$(docker ps -aq -f status=exited)

if [ -z "$CONTAINERS" ]; then
    echo "Остановленных контейнеров нет."
else
    echo "Найдены контейнеры: $CONTAINERS"
    # Удаляем
    docker rm $CONTAINERS
    echo "$(date): Удалены контейнеры: $CONTAINERS" >> "$LOGFILE"
    echo "Очистка завершена."
fi
