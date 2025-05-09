#!/bin/bash

if groups $USER | grep -q '\bsudo\b'; then
    log_dir="$1"
    output="../data/logs/rapport_logs.txt"
    > "$output"
    for logfile in "$log_dir"/*.log; do
        echo "Fichier : $(basename "$logfile")" >> "$output"
        echo "ERROR   : $(grep -c 'ERROR' "$logfile")" >> "$output"
        echo "WARNING : $(grep -c 'WARNING' "$logfile")" >> "$output"
        echo "INFO    : $(grep -c 'INFO' "$logfile")" >> "$output"
        echo "---" >> "$output"
    done
else
    echo "Vous devez être dans le groupe sudo pour exécuter ce script."
    exit 1
fi
