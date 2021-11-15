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
on lance le script depuis un ordinateur sous Windows 10.

./script4.ps1 pour un lancement en silencieux  ./script4.ps1 > robo.txt pour récupérer le résultat
Pas d'argumentation à préciser 

Pour un lancement via le planificateur de tache de Windows 10.
Les seuls modifications doivent etre l'heure , date de lancemeent. 

***
# Installation / Explication 
étapes pour installer le script

Récupération du nom de l'ordinateur sur lequel fonctionne le script , grace à une variable d'environnement système.

Récupération de la liste des répertoires sous c:\users, la liste de répertoires corespond à tous les noms des utilisateurs qui se sont connectés à l'ordinateur.
Cela permet de ne pas oublier d'utilisateur.

Boucle ForEach pour lister les répertoires de sauvegarde, sur le serveur \\SRVACME
Création du répertoire manquant ou non en mode -Force 
Le répertoire est sur le serveur \\SRVACME\sav$\...
Le répertoire est caché.

Lancement de Robocopy avec les arguments suivants:
copie du répertoire Documents de l'utilisateur sur le serveur 
horodatage, chemin d'accès  et résultat détaillédans un journal sous \\SRVACME\sav$
le fichier de log porte le nom du PC sauvegardé, et il est incrémenté pour garder un historique sur plusieurs jours

Ajout d'une condition, qui teste s'il y a une erreur dans le déroulement du script.
Elle renvoi un code ok , si tout c'est dérouler correctement, ou un code 1 en cas d'erreur, avec l'explication de l'erreur $error[0] et éventuellement le code de la commande incorrecte, renvoi les Exit Code de la commande. 
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
