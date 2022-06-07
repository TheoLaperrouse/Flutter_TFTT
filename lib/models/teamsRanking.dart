import 'package:flutter/cupertino.dart';
import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<TeamRanking> teamsRankingFromJson(String str) => List<TeamRanking>.from(
    json.decode(str).map((x) => TeamRanking.fromJson(x)));

Future<List<TeamRanking>> fetchTeamsRanking(pouleid, division) async {
  final response = await http.get(Uri.parse(
      "${Api.apiBaseUrl}/teams/ranking/cx_poule=$pouleid/D1=$division"));
  if (response.statusCode == 200) {
    return teamsRankingFromJson(response.body);
  } else {
    throw Exception(
        'Impossible de charger le classement de la poule, vérifier votre connexion Internet');
  }
}

class TeamRanking {
  TeamRanking(
      {@required this.name,
      @required this.ranking,
      @required this.victory,
      @required this.defeat});

  String name;
  String ranking;
  String victory;
  String defeat;

  factory TeamRanking.fromJson(Map<String, dynamic> json) => TeamRanking(
      name: json["name"],
      ranking: json["ranking"],
      victory: json["victory"],
      defeat: json["defeat"]);
}
