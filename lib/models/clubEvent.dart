import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<ClubEvent> eventFromJson(String str) =>
    List<ClubEvent>.from(json.decode(str).map((x) => ClubEvent.fromJson(x)));

String eventToJson(List<ClubEvent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List<ClubEvent>> fetchClubEvents() async {
  final response = await http.get(Uri.parse("${Api.apiBaseUrl}/club_events"));
  if (response.statusCode == 200) {
    List<ClubEvent> clubEvents = await eventFromJson(response.body).toList();
    return clubEvents;
  } else {
    throw Exception(
        'Impossible de charger les événements, vérifier votre connexion Internet');
  }
}

void postClubEvent(ClubEvent event) async {
  var eventToSend = jsonEncode({
    "title": event.title,
    "description": event.description,
    "volunteers": event.volunteers,
    "startDate": event.startDate.toString(),
    "endDate": event.endDate.toString(),
  });
  final response = await http.post(Uri.parse("${Api.apiBaseUrl}/club_events"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: eventToSend);
  if (response.statusCode == 200) {
  } else {
    throw Exception(
        'Impossible de charger les événements du club, vérifier votre connexion Internet');
  }
}

class ClubEvent {
  ClubEvent(
      {this.startDate,
      this.endDate,
      this.description,
      this.title,
      this.volunteers});

  DateTime startDate;
  DateTime endDate;
  String title;
  String description;
  List<dynamic> volunteers;

  factory ClubEvent.fromJson(Map<String, dynamic> json) => ClubEvent(
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        volunteers: json["volunteers"],
        title: json["title"],
        description: json["description"],
      );
  Map<String, dynamic> toJson() => {
        "startDate": startDate,
        "endDate": endDate,
        "volunteers": volunteers,
        "title": title,
        "description": description,
      };
}
