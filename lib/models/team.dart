import 'package:flutter/cupertino.dart';
import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Team> teamsFromJson(String str) =>
    List<Team>.from(json.decode(str).map((x) => Team.fromJson(x)));

String teamsToJson(List<Team> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List<Team>> fetchTeams(numClub) async {
  final response =
      await http.get(Uri.parse("${Api.apiBaseUrl}/teams/$numClub"));
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
    @required this.nomEquipe,
    @required this.championnat,
    @required this.lien,
  });

  String nomEquipe;
  String championnat;
  String lien;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        nomEquipe: json["equipe"],
        lien: json["lien"],
        championnat: json["championnat"],
      );

  Map<String, dynamic> toJson() => {
        "nomEquipe": nomEquipe,
        "lien": lien,
        "championnat": championnat,
      };
}
