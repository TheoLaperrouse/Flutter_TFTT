import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tftt/utils/globals.dart' as globals;

class ProfileHeader extends StatelessWidget {
  ProfileHeader({this.nbVictory = 0, this.nbDefeat = 0});

  final int nbVictory;
  final int nbDefeat;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
            "${globals.player.prenom} ${globals.player.nom} (${Settings.getValue<String>('numLicence', '3524012')})",
            style:
                TextStyle(height: 2, fontWeight: FontWeight.bold, fontSize: 20))
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        buildButton(context, globals.player.points.split('.')[0], "points"),
        buildButton(context, nbVictory.toString(), "victoires"),
        buildButton(context, nbDefeat.toString(), "défaites"),
        buildButton(
            context,
            (nbVictory / (nbVictory + nbDefeat) * 100).toStringAsFixed(2),
            "% de victoires"),
      ])
    ]);
  }
}

Widget buildButton(BuildContext context, String value, String text) {
  return MaterialButton(
    onPressed: () {},
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          height: 2,
        ),
        Text(text, style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
  );
}
