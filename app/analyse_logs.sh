#!/bin/bash

if ! groups $USER | grep -q sudo; then
  echo "Vous devez être dans le groupe sudo pour exécuter ce script."
  exit 1
fi

log_dir="$1"
output="logs/rapport_logs.txt"
echo "Rapport de logs" > $output

for log in "$log_dir"/*.log; do
  echo "Fichier: $(basename "$log")" >> $output
  echo "ERROR: $(grep -c 'ERROR' "$log")" >> $output
  echo "WARNING: $(grep -c 'WARNING' "$log")" >> $output
  echo "INFO: $(grep -c 'INFO' "$log")" >> $output
  echo "--------------------------" >> $output
done

