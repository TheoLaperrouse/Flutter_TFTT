import 'package:flutter/cupertino.dart';
import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void pushNotification(Notification notification) async {
  var eventToSend = jsonEncode({
    "title": notification.title,
    "description": notification.description,
  });
  final response = await http.post(Uri.parse("${Api.apiBaseUrl}/notifications"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: eventToSend);
  if (response.statusCode == 200) {
  } else {
    throw Exception(
        'Impossible de push la notification, vérifier votre connexion Internet');
  }
}

class Notification {
  Notification({
    @required this.title,
    @required this.description,
  });

  String title;
  String description;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}
