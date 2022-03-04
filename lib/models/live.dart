import 'package:flutter_tftt/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_tftt/utils/globals.dart' as globals;

Live liveFromJson(String str) => Live.fromJson(json.decode(str));

Future<void> initLive() async {
  await fetchLive().then((result) {
    globals.live = result;
  });
}

Future<Live> fetchLive() async {
  final response = await http.get(Uri.parse("${Api.apiBaseUrl}/isLive"));
  if (response.statusCode == 200) {
    Live live = await liveFromJson(response.body);
    return live;
  } else {
    throw Exception(
        'Impossible de charger le live, vérifier votre connexion Internet');
  }
}

class Live {
  Live({
    this.liveId,
    this.isLive,
  });

  String liveId;
  bool isLive;

  factory Live.fromJson(Map<String, dynamic> json) => Live(
        liveId: json["liveId"],
        isLive: json["isLive"],
      );
  Map<String, dynamic> toJson() => {
        "liveId": liveId,
        "isLive": isLive,
      };
}
