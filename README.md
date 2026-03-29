# Yogishift

Yogishift est mon projet de fin d’année.
L’idée est de créer une plateforme autour du yoga qui permet de consulter des offres, connecter des studios et des professeurs, et gérer différentes interactions comme dans une vraie application métier.

Ce projet m’a permis de travailler sur une architecture complète avec un front, un back et une base de données.

Stack technique

Le front est développé avec React et Vite pour avoir une interface rapide et moderne.
Le back est construit avec Symfony pour gérer l’API et la logique métier.
La base de données est en MySQL.
L’ensemble du projet est lancé avec Docker pour simplifier l’installation et garantir que tout fonctionne de la même façon sur toutes les machines.

Objectifs du projet

L’objectif principal est de mettre en place une application complète avec une architecture claire front / back.
J’ai aussi voulu apprendre à connecter une API à une base de données réelle et structurer les données correctement.
Le projet inclut la mise en place de routes API, la récupération des données côté front et une organisation propre du code.
L’idée est de se rapprocher d’un projet professionnel, avec des outils et une logique utilisés en entreprise.

Installation du projet

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
