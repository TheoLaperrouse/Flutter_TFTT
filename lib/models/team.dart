import 'package:flutter/cupertino.dart';
import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Team> teamsFromJson(String str) =>
    List<Team>.from(json.decode(str).map((x) => Team.fromJson(x)));

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
    @required this.pouleid,
    @required this.division,
    @required this.championnat,
  });

  String nom;
  String pouleid;
  String division;
  String championnat;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        nom: json["nom"],
        pouleid: json["pouleid"],
        division: json["division"],
        championnat: json["championnat"],
      );
}
