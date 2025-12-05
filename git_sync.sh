#!/bin/bash
LOGFILE="git-sync.log"

# Выполняем pull
echo "--- Sync started at $(date) ---" >> "$LOGFILE"
git pull >> "$LOGFILE" 2>&1

# Получаем инфо о последнем коммите
LAST_COMMIT=$(git log -1 --format="Author: %an, Date: %cd, Message: %s")
echo "Last Commit: $LAST_COMMIT"
echo "Last Commit: $LAST_COMMIT" >> "$LOGFILE"
