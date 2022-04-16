import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/utils/settings_key.dart';
import 'package:flutter_tftt/utils/globals.dart' as globals;
import 'package:flutter_tftt/utils/utils.dart';

String tagTitle() {
  String profile = SettingsKey
      .profileType[Settings.getValue<String>('profileType', 'joueur')];
  return '${profile}${globals.player.numClub == "03350060" && profile == "Joueur" ? ' TFTT' : ''}';
}

class DrawerHeaderWidget extends StatelessWidget {
  DrawerHeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 143,
      child: DrawerHeader(
          decoration: BoxDecoration(color: MaterialColors.drawer),
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
                child: Text("${globals.player.prenom} ${globals.player.nom}",
                    style: TextStyle(color: Colors.white, fontSize: 21)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: MaterialColors.label),
                          child: Text(
                              Utils.formatTeamName(globals.teamSettings[
                                  Settings.getValue<String>('team', '0')]),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.purple),
                        child: Text(tagTitle(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(globals.player.points.split(".")[0],
                              style: TextStyle(
                                  color: MaterialColors.warning, fontSize: 16)),
                        ),
                        Icon(Icons.leaderboard_outlined,
                            color: MaterialColors.warning, size: 20)
                      ],
                    )
                  ],
                ),
              )
            ],
          ))),
    );
  }
}
