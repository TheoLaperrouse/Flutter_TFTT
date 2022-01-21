# Flutter TFTT

## Principe et Technos

Application pour le club de Tennis de table de Thorigné Fouillard développé en Flutter à l'aide de FireBase

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
flutter run
```

## Librairies

- scrollable_positioned_list: ^0.1.7
- carousel_slider: ^2.2.1
- font_awesome_flutter: ^8.8.1
- table_calendar: ^3.0.3
- webview_flutter: ^3.0.0
- url_launcher: ^5.2.7
- flutter_settings_screens: ^0.2.2+1 
- http: ^0.13.4

À ajouter :

- flutter_lints: 

## À faire

- Compos d'équipes
- Place dématérialisée match de Pro
- Commande matériel
- Réservation de séance Indiv
- Planning

## Idées

- Anniversaires des Licenciés en récupérant les infos du SPID
- Back qui appelle l'API de la Fédé pour récupération des derniers matchs
- Ajout du classement de la ProB 

