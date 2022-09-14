import 'package:flutter/cupertino.dart';
import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tftt/utils/globals.dart' as globals;

TicketingData ticketingFromJson(String str) =>
    TicketingData.fromJson(json.decode(str));

Future<void> initTicketing() async {
  await fetchTicketing().then((result) {
    globals.ticketing = result;
  });
}

Future<TicketingData> fetchTicketing() async {
  final response = await http.get(Uri.parse("${Api.apiBaseUrl}/ticketing"));
  if (response.statusCode == 200) {
    return ticketingFromJson(response.body);
  } else {
    throw Exception(
        'Impossible de charger la billetterie, vérifier votre connexion Internet');
  }
}

class TicketingData {
  TicketingData({@required this.link, @required this.name});

  String name;
  String link;

  factory TicketingData.fromJson(Map<String, dynamic> json) => TicketingData(
        name: json["name"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {"name": name, "link": link};
}
