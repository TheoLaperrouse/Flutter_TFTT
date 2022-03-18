import 'package:flutter/cupertino.dart';
import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Team> teamsFromJson(String str) =>
    List<Team>.from(json.decode(str).map((x) => Team.fromJson(x)));

String teamsToJson(List<Team> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List<Team>> fetchTeams() async {
  final response = await http.get(
    Uri.parse("${Api.apiBaseUrl}/teams"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    List<Team> teams = await teamsFromJson(response.body).toList();
    return teams;
  } else {
    throw Exception(
        'Impossible de charger les équipes, vérifier votre connexion Internet');
  }
}

class Team {
  Team({
    @required this.nom,
    @required this.championnat,
    @required this.lien,
  });

  String nom;
  String championnat;
  String lien;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        nom: json["nom"],
        lien: json["lien"],
        championnat: json["championnat"],
      );

  Map<String, dynamic> toJson() => {
        "nom": nom,
        "lien": lien,
        "championnat": championnat,
      };
}
