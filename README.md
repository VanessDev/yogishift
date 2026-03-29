Yogishift

Yogishift est mon projet de fin d’année.
L’objectif est de créer une plateforme autour du yoga qui permet de consulter des offres, gérer des profils et connecter différents acteurs du milieu.

Le projet est construit avec un front en React, un back en Symfony et une base de données MySQL.
Tout est lancé avec Docker pour simplifier l’installation.

Je vais expliquer comment installer et lancer le projet étape par étape.

D’abord, il faut récupérer le projet sur ton ordinateur.
Dans ton terminal, tu écris :

git clone https://github.com/VanessDev/yogishift.git

Ensuite tu entres dans le dossier :

cd yogishift

Avant de continuer, il faut vérifier que Docker est installé et lancé sur ton ordinateur.
Si Docker Desktop n’est pas ouvert, il faut le démarrer.

Une fois que c’est bon, tu peux lancer tout le projet avec :

docker compose up -d --build

Cette commande va créer et démarrer tous les services nécessaires : le front, le back et la base de données.
La première fois, ça peut prendre un peu de temps.

Quand tout est lancé, tu peux accéder au projet.

Le front est disponible ici :

http://localhost:5173

Le back (API Symfony) est disponible ici :

http://localhost:8000

Pour tester l’API, tu peux ouvrir cette route :

http://localhost:8000/api/jobs

Tu verras les données en format JSON.

Si tu veux exécuter des commandes Symfony, tu peux entrer dans le conteneur backend :

docker compose exec backend bash

Puis par exemple :

php bin/console

Pour arrêter le projet :

docker compose down

Ce projet utilise Docker pour garantir que tout fonctionne de la même façon sur toutes les machines, sans configuration complexe.

Il s’inscrit dans une logique de développement moderne avec séparation front / back, utilisation d’une API et gestion de base de données relationnelle.
