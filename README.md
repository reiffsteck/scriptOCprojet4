# scriptOCprojet4
sauvegarde des repertoires des utilisateurs de différents ordinateurs sur le serveur SRVACME 

Récupération du nom de l'ordinateur sur lequel fonctionne le script , grace à une variable d'environnement système

Récupération de la liste des répertoires sous c:\users, la liste de répertoires corespond à tous les noms des utilisateurs qui se sont connectés à l'ordinateur.
Cela permet de ne pas oublier d'utilisateur.

Boucle ForEach pour excécuter un test de validation des répertoires de sauvegarde, sur le serveur \\SRVACME
Le répertoire est sur 
