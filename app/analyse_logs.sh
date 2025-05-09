#!/bin/bash


if ! groups | grep -qw sudo; then
    echo "Erreur"
    exit 1
fi


if [ -z "$1" ]; then
    echo "Usage: $0 <chemin_vers_logs>"
    exit 1
fi

LOG_DIR="$1"
REPORT="logs/rapport_logs.txt"

mkdir -p logs

echo "Rapport d'analyse - $(date)" > "$REPORT"
echo "============================" >> "$REPORT"

for log_file in "$LOG_DIR"/*.log; do
    echo "File: $log_file" >> "$REPORT"
    
