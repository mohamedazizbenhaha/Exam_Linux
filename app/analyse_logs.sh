#!/bin/bash

if [ $# -ne 2 ]; then
    echo "entrer deux argument utilisateur et chemin_dossier_logs"
    exit 1
fi

UTILISATEUR=$1
DOSSIER_LOGS=$2
FICHIER_RAPPORT="./rapport_logs.txt"


if groups "$UTILISATEUR" | grep -qw "sudo"; then
    echo " L'utilisateur $UTILISATEUR appartient au groupe sudo."
else
    echo " L'utilisateur $UTILISATEUR n'appartient PAS au groupe sudo."
    exit 2
fi

if [ ! -d "$DOSSIER_LOGS" ]; then
    echo " Le dossier de logs $DOSSIER_LOGS n'existe pas."
    exit 4
fi

> "$FICHIER_RAPPORT"  # Réinitialiser le rapport


for fichier in "$DOSSIER_LOGS"/*.log; do
    [ -e "$fichier" ] || continue

    nb_error=$(grep -c "ERROR" "$fichier")
    nb_warning=$(grep -c "WARNING" "$fichier")
    nb_info=$(grep -c "INFO" "$fichier")

    echo "Fichier : $(basename "$fichier")" >> "$FICHIER_RAPPORT"
    echo "  - ERROR   : $nb_error" >> "$FICHIER_RAPPORT"
    echo "  - WARNING : $nb_warning" >> "$FICHIER_RAPPORT"
    echo "  - INFO    : $nb_info" >> "$FICHIER_RAPPORT"
done

echo "Rapport généré avec succès dans $(realpath "$FICHIER_RAPPORT")"

