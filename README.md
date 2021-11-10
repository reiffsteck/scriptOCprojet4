# scriptOCprojet4
sauvegarde des repertoires des utilisateurs de différents ordinateurs sur le serveur SRVACME .
***
# Pour Commencer
Ce script a été réalisé dans le cadre d'un projet "script 4" projet 7 pour OpenClassrooms.
***
# Pré-requis
serveur Windows 2019 avec Active Directory 

Création d'un répertoire caché sur un serveur \\SRVACME à la racine de préférence ,ce qui donne \\SRVACME\sav$

PC sous Windows 10 Pro.

Utilisation de Robocopy pour effectuer la sauvegarde.

Utilisation du planificateur de taches pour lancer le script à une heure donnée.
***
# Démarrage
comment on lance le script
./scrip4.ps1 pour un lancement en manuel
Pas d'argumentation à préciser 
Les seuls modifications doivent etre l'heure , date de lancemeent. Il est de base fait pour etre excécuter par le planificateur de taches
***
# Installation / Explication 
étapes pour installer le script

Récupération du nom de l'ordinateur sur lequel fonctionne le script , grace à une variable d'environnement système.

Récupération de la liste des répertoires sous c:\users, la liste de répertoires corespond à tous les noms des utilisateurs qui se sont connectés à l'ordinateur.
Cela permet de ne pas oublier d'utilisateur.

Boucle ForEach pour excécuter un test de validation de l'existence des répertoires de sauvegarde, sur le serveur \\SRVACME
Si le test renvoi False , cela provoque la création du répertoire manquant
Le répertoire est sur le serveur \\SRVACME\sav$\...
Le répertoire est caché.

Lancement de Robocopy avec les arguments suivants:
copie du répertoire Documents de l'utilisateur sur le serveur 
horodatage, chemin d'accès  et résultat détaillédans un journal sous \\SRVACME\sav$
le fichier de log porte le nom du PC sauvegardé, et il est incrémenté pour garder un historique sur plusieurs jours
***

# Fabriqué 
PowerShell
Visual Studio Code
***
# Contributeurs et Auteur
REIFFSTECK Laurent Auteur 
BINAND Olivier Mentor OpenClassrooms
***
# Licence
libre de droit
