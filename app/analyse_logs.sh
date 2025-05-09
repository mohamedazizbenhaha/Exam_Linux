#!/bin/bash

# V√©rification des arguments
if [ $# -ne 3 ]; then
    echo "Usage: $0 <utilisateur> <chemin_dossier_logs> <chemin_dossier_rapport>"
    exit 1
fi

UTILISATEUR=$1
DOSSIER_LOGS=$2
DOSSIER_RAPPORT=/home/workspace/ExamLinux/data/logs
FICHIER_RAPPORT="$DOSSIER_RAPPORT/rapport_logs.txt"

# V√©rifier si l'utilisateur appartient au groupe sudo
if id "$UTILISATEUR" &>/dev/null; then
    if id -nG "$UTILISATEUR" | grep -qw "sudo"; then
        echo "úî L'utilisateur $UTILISATEUR appartient au groupe sudo."
    else
        echo "ùå L'utilisateur $UTILISATEUR n'appartient PAS au groupe sudo."
        exit 2
    fi
else
    echo "ùå L'utilisateur $UTILISATEUR n'existe pas."
    exit 3
fi


if [ ! -d "$DOSSIER_LOGS" ]; then
    echo "ùå Le dossier de logs $DOSSIER_LOGS n'existe pas."
    exit 4
fi

mkdir -p "$DOSSIER_RAPPORT" 
"$FICHIER_RAPPORT"         


# Parcourir les fichiers .log
for fichier in "$DOSSIER_LOGS"/*.log; do
    [ -e "$fichier" ] || continue  

    nb_error=$(grep -c "ERROR" "$fichier")
    nb_warning=$(grep -c "WARNING" "$fichier")
    nb_info=$(grep -c "INFO" "$fichier")

    echo "Fichier : $(basename "$fichier")" >> "$FICHIER_RAPPORT"
    echo "  - ERROR   : $nb_error" >> "$FICHIER_RAPPORT"
    echo "  - WARNING : $nb_warning" >> "$FICHIER_RAPPORT"
    echo "  - INFO    : $nb_info" >> "$FICHIER_RAPPORT"
    echo  >> "$FICHIER_RAPPORT"
done

echo "úÖ Rapport g√©n√©r√© avec succ√®s dans $FICHIER_RAPPORT"
