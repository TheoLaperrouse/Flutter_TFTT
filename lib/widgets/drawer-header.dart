import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/extensions/string-extension.dart';
import 'package:flutter_tftt/utils/settings_key.dart';
import 'package:flutter_tftt/utils/globals.dart' as globals;

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
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: MaterialColors.label),
                          child: Text(
                              Settings.getValue<String>('team', 'r3')
                                  .capitalize(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.purple),
                        child: Text(
                            SettingsKey.profileType[Settings.getValue<String>(
                                'profileType', 'joueur')],
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
