import 'package:flutter/cupertino.dart';
import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Match> matchesFromJson(String str) =>
    List<Match>.from(json.decode(str).map((x) => Match.fromJson(x)));

String matchesToJson(List<Match> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List<Match>> fetchMatches(numLic) async {
  final response =
      await http.get(Uri.parse("${Api.apiBaseUrl}/players/matches/$numLic"));
  if (response.statusCode == 200) {
    List<Match> matches = await matchesFromJson(response.body).toList();
    return matches;
  } else {
    throw Exception(
        'Impossible de charger les matches, vérifier votre connexion Internet');
  }
}

class Match {
  Match({
    @required this.date,
    @required this.nom,
    @required this.classement,
    @required this.victoire,
  });

  String date;
  String nom;
  String classement;
  bool victoire;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        date: json["date"],
        nom: json["nom"],
        classement: json["classement"],
        victoire: json["victoire"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "nom": nom,
        "classement": classement,
        "victoire": victoire,
      };
}
