import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Picture> picturesFromJson(String str) =>
    List<Picture>.from(json.decode(str).map((x) => Picture.fromJson(x)));

String picturesToJson(List<Picture> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Future<List<String>> fetchPictureLinks() async {
  final response =
      await http.get(Uri.parse('https://thorigne-tt.net/wp-json/wp/v2/media'));
  if (response.statusCode == 200) {
    RegExp imageRegExp = new RegExp(r"\.(jpe?g|png)$");
    List<String> pictureLinks = await picturesFromJson(response.body)
        .where((media) => imageRegExp.hasMatch((media.pictureLink)))
        .map((picture) => picture.pictureLink)
        .toList();
    return pictureLinks;
  } else {
    throw Exception(
        'Impossible de charger les photos, vérifier votre connexion Internet');
  }
}

class Picture {
  Picture({
    @required this.id,
    @required this.date,
    @required this.pictureLink,
  });

  int id;
  DateTime date;
  String pictureLink;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        pictureLink: json["guid"]["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "rendered": pictureLink,
      };
}
