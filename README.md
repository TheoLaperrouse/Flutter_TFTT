# Flutter TFTT

## Principe et Technos

Application pour le club de Tennis de table de Thorigné Fouillard développé en Flutter à l'aide de FireBase

## Mise en place environnement Dev

Installer lefthook et exécuter cette ligne de commande :
```
lefthook install
```

LeftHook permet d'exécuter des commandes avant les commandes (comme husky pour JS).
Ici, commande pour analiser et lint le code avant un commit (voir lefthook.yml)

## Fonctionnalités Principales

Cette application devra contenir plusieurs fonctionnalités :
- Une vue Accueil/Posts qui référencera les différents posts du TFTT
- Une vue Profil où l'utilisateur aura accès à ses informations sportives.
- Une vue Calculateur de Points où le joueur pourra calculer ces points après un match
- Une vue Réservation de Tables qui permettra à un utilisateur de réserver une table

## Mémo Dev

Analyse les fichiers :
```sh
flutter analyze
```

Build de l'application :
```sh
flutter create . 
```

Lance l'application en vue Web :
```
flutter run -d chrome --web-renderer html
```
Il y a des problèmes avec la récupération des images depuis l'appli web, du à un bug connu, pas de Headers pour NetworkImage voir ici:

https://github.com/flutter/flutter/issues/57187 & https://api.flutter.dev/flutter/painting/NetworkImage/headers.html

Build de l'application pour release sur PlayStore :
```
flutter build appbundle --release
```

Build de l'application pour release sur Github :
```
flutter create .
flutter build web --web-renderer html --release
```
Le dossier build/web peut alors être exporter sur la github page via la branche gh-page

## À faire

### Front

- Compos d'équipes
- Place dématérialisée match de Pro
- Renommer les types dans les events
- Faire un profil plus joli avec des Card plus estéthiques
- Trouver des images adéquates pour les événements
- Live redirection => vers le live
- Modal à la première utilisation pour renseigner les settings
- Tableau de clé-valeur Equipe - Label (BDD ou Constant)

### Back

- Ajouter Évenements Récurrents

## Idées

- Anniversaires des Licenciés en récupérant les infos du SPID
- Back qui appelle l'API de la Fédé pour récupération des derniers matchs
- Ajout du classement de la ProB