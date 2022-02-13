import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Event> eventFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

String eventToJson(List<Event> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List<Event>> fetchEvents() async {
  final response = await http.get(Uri.parse("${Api.apiBaseUrl}/events"));
  if (response.statusCode == 200) {
    List<Event> events = await eventFromJson(response.body).toList();
    return events;
  } else {
    throw Exception(
        'Impossible de charger les événements, vérifier votre connexion Internet');
  }
}

void postEvent(Event event) async {
  var eventToSend = jsonEncode({
    "type": event.type,
    "title": event.title,
    "startDate": event.startDate.toString(),
    "endDate": event.endDate.toString(),
  });
  final response = await http.post(Uri.parse("${Api.apiBaseUrl}/events"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: eventToSend);
  if (response.statusCode == 200) {
  } else {
    throw Exception(
        'Impossible de charger les événements, vérifier votre connexion Internet');
  }
}

class Event {
  Event({this.startDate, this.endDate, this.type, this.title});

  DateTime startDate;
  DateTime endDate;
  String type;
  String title;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        type: json["type"],
        title: json["title"],
      );
  Map<String, dynamic> toJson() => {
        "startDate": startDate,
        "endDate": endDate,
        "type": type,
        "title": title,
      };
}
