import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Ordering> orderingFromJson(String str) =>
    List<Ordering>.from(json.decode(str).map((x) => Ordering.fromJson(x)));

String orderingToJson(List<Ordering> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List<Ordering>> fetchOrderings() async {
  final response = await http.get(Uri.parse("${Api.apiBaseUrl}/orderings"));
  if (response.statusCode == 200) {
    List<Ordering> orderings = await orderingFromJson(response.body).toList();
    return orderings;
  } else {
    throw Exception(
        'Impossible de charger les événements, vérifier votre connexion Internet');
  }
}

void postOrdering(Ordering ordering) async {
  var orderingToSend = jsonEncode({
    "name": ordering.name,
    "ordering": ordering.ordering,
  });
  final response = await http.post(Uri.parse("${Api.apiBaseUrl}/ordering"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: orderingToSend);
  if (response.statusCode == 200) {
  } else {
    throw Exception(
        'Impossible de charger les événements, vérifier votre connexion Internet');
  }
}

class Ordering {
  Ordering({this.name, this.ordering});

  String name;
  String ordering;

  factory Ordering.fromJson(Map<String, dynamic> json) => Ordering(
        name: json["name"],
        ordering: json["ordering"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "ordering": ordering,
      };
}
