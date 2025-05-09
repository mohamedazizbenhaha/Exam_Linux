# EXAMEN PRATIQUE LINUX

📅 **Durée** : 45 - 60 min  
📁 **Environnement fourni** : Un conteneur Docker interactif  
🐳 **Configuration** : Docker doit être installé sur votre machine.  
🔁 **À rendre via Git** :
- Structure complète du projet
- `commands.txt` : Historique nettoyé
- Scripts dans leurs fichiers respectifs (`.sh`)
- Fichiers de sortie demandés

Pour démarrer l'examen, exécutez la commande suivante dans votre terminal

```
docker run -it --name rh_exam mohamedazizbenhaha/linux_exam:v1 bash
```
- Cette commande va **télécharger l'environnement d'examen** et le lancer dans un conteneur Docker interactif.
- Le conteneur est nommé `rh_exam` pour faciliter son identification.

## ⚠️ Important
- **Ne fermez pas le conteneur** tant que vous n'avez pas soumis votre travail via Git. Une fois le conteneur fermé, **toutes les données seront perdues**.
- Assurez-vous d'avoir bien soumis votre travail avant de quitter l'examen.

---

## Structure des répertoires

```
/home/workspace/ExamLinux/ 
├── app/
│   ├── main.sh         (fourni - basic system checks)
│   ├── config.cfg      (fourni - fichier de config lourd)
│   └── readme.md       (fourni - doc app lourde)
├── data/
│   ├── logs/
│   │   └── app.log     (fourni - journal d'app)
│   │   └── auth.log    (fourni - journal d'auth)
│   │   └── backup.log  (fourni - journal du backup)
│   │   └── network.log (fourni - journal du network)
│   │   └── system.log  (fourni - journal du sys)
│   └── users.txt       (fourni - liste utilisateurs)
├── test/
│   ├── test1.txt       (vide)
│   └── test2.txt       (vide)
└── archive/
    └── sudoers_copy.txt      (vide)
```

## CONSIGNES D'EXAMEN

### Partie 0 – Préparation de l'environnement
- Créez un utilisateur nommé `student`.
- Définissez un mot de passe pour cet utilisateur.
- Ajoutez l'utilisateur `student` au groupe `sudo`.
- Configurez le système pour permettre à l'utilisateur `student` d'utiliser `sudo` sans mot de passe.
- Passez sous l'utilisateur `student` pour effectuer les tâches suivantes.

### Partie 1 – Permissions avancées
- Créez un répertoire securite/ dans le dossier de l'examen.
- À l'intérieur :
  - Créez un fichier confidentiel.txt contenant la phrase "This file is confidential!".
  - Créez un fichier public.txt contenant la phrase "This file is public!".
- Donnez les permissions suivantes :
  - confidentiel.txt : Accessible uniquement par le propriétaire.
  - public.txt : Lecture autorisée pour tous.
- Modifiez le groupe propriétaire de securite/ pour qu'il appartienne à ops.
- Appliquez le setgid sur securite/.
- Listez récursivement le dossier securite/ avec droits et groupes et redirigez la sortie dans permissions_check.txt.

### Partie 2 – Gestion Utilisateurs avancée
- Créez deux utilisateurs :
  - tester1 dans le groupe testers
  - tester2 dans les groupes users et testers
- Faites les configurations necessaires pour qu'un fichier bienvenue.txt soit automatiquement créé dans leur home lors de la création.
- Faites le modifications necessaires pour permettre aux membres de testers d'exécuter uniquement la commande "ping" sans mot de passe.
- Copiez le contenu de /etc/sudoers dans sudoers_copy.txt.

### Partie 3 – Liens, suppression et analyse
- Dans test/ :
  - Créez un lien symbolique shortcut_config pointant vers app/config.cfg.
  - Créez un lien physique hardlink_readme vers app/readme.md.
- Listez les inodes des fichiers créés et stockez-les dans logs/inodes_before.txt.
- Supprimez readme.md.
- Listez à nouveau les inodes et stockez-les dans logs/inodes_after.txt.

### Partie 4 – Manipulations texte et recherche ciblée
- Dans app.log :
  - Extrayez toutes les lignes contenant exactement 5 chiffres consécutifs.
  - Aujoutez les résultats à la fin du fichier test1.txt.
- Dans users.txt :
  - Extrayez tous les noms de famille commençant par D.
  - Sauvegardez dans test2.txt.
- Dans test/ :
  - Créez stats.txt contenant :
    - Nombre total de lignes dans app.log
    - Nombre total de mots dans app.log
    - Nombre de lignes contenant ERROR

### Partie 5 – Script d'analyse logs
Dans app/, écrivez un script analyse_logs.sh qui :
- Vérifie que l'utilisateur appartient au groupe sudo.
- Parcourt tous les fichiers .log dans data/logs
- Compte le nombre d'occurrences de ERROR, WARNING, INFO pour chaque fichier.
- Générez un fichier rapport_logs.txt structuré dans logs/ avec ces informations.

> 💡 Le chemin du dossier de logs doit être passé en argument au script.

### Partie 6 – Organisation et redirections complexes
Dans test/ :
- Créez fusion.txt contenant d'abord users.txt, puis app.log.
- Triez le contenu de fusion.txt et sauvegardez-le dans fusion_sorted.txt.
- Supprimez les doublons de fusion_sorted.txt pour obtenir fusion_unique.txt.

### Partie 7 – Historique des commandes
- Avant de finir l'examen, tapez :
  ```
  history > commands.txt
  ```
- Ouvrez commands.txt et supprimez toutes les lignes inutiles, tests ratés, erreurs. Gardez uniquement les commandes réellement utilisées.

> 💡 A partir de cette partie vous pouvez à nouveau utiliser root.

### Partie 8 – Remise du projet sur Git
Depuis votre dossier NomFamille_Classe/ :
```
git add .
git commit -m "Nom Prénom - Final Linux Exam Submission"
git checkout -b NomPrénom
git push -u origin NomPrénom
```
