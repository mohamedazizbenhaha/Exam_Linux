#!/bin/bash

if groups "$USER" | grep -w "sudo"; then
    echo "$USER est dans le groupe sudo."
else
    echo "$USER nest pas dans le groupe sudo."
fi

LOG_FILE="$(dir "$0")/app.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "Fichier log introuvable : $LOG_FILE"
    exit 
fi

ERRORS=$(grep -c "ERROR" "$LOG_FILE")
WARNINGS=$(grep -c "WARNING" "$LOG_FILE")
INFOS=$(grep -c "INFO" "$LOG_FILE")

echo "ERROR   : $ERRORS"
echo "WARNING : $WARNINGS"
echo "INFO    : $INFOS"

