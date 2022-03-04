import 'package:flutter_tftt/models/event.dart';

// Each internal Array is a weekDay (recurringEvents[1] => Lundi)
List<List<Event>> recurringEvents = [
  [],
  [],
  [
    Event(
        startDate: new DateTime(0, 0, 0, 17),
        endDate: new DateTime(0, 0, 0, 18, 30),
        title: "Entraînement Jeune",
        type: "Entraînement"),
    Event(
        startDate: new DateTime(0, 0, 0, 18, 30),
        endDate: new DateTime(0, 0, 0, 20, 30),
        title: "Entraînement Loisirs / Compétition",
        type: "Entraînement")
  ],
  [
    Event(
        startDate: new DateTime(0, 0, 0, 10),
        endDate: new DateTime(0, 0, 0, 12),
        title: "Entrainement Jeunes/Handisport",
        type: "Entraînement"),
    Event(
        startDate: new DateTime(0, 0, 0, 14),
        endDate: new DateTime(0, 0, 0, 17, 30),
        title: "Entrainement Jeunes",
        type: "Entraînement"),
    Event(
        startDate: new DateTime(0, 0, 0, 19),
        endDate: new DateTime(0, 0, 0, 21),
        title: "Entrainement Loisirs encadré",
        type: "Entraînement")
  ],
  [
    Event(
        startDate: new DateTime(0, 0, 0, 14),
        endDate: new DateTime(0, 0, 0, 15, 30),
        title: "Entraînement Handisport",
        type: "Entraînement"),
    Event(
        startDate: new DateTime(0, 0, 0, 17),
        endDate: new DateTime(0, 0, 0, 18),
        title: "Entraînement Jeunes",
        type: "Entraînement"),
    Event(
        startDate: new DateTime(0, 0, 0, 19),
        endDate: new DateTime(0, 0, 0, 20, 30),
        title: "Entraînement Loisirs",
        type: "Entraînement")
  ],
  [
    Event(
        startDate: new DateTime(0, 0, 0, 17, 0),
        endDate: new DateTime(0, 0, 0, 19, 30),
        title: "Entraînement Jeunes",
        type: "Entraînement")
  ],
  [],
  []
];
