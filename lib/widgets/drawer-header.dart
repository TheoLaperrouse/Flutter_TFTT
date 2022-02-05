import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/extensions/string-extension.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    Key key,
  }) : super(key: key);

  @override
  _DrawerHeaderState createState() => _DrawerHeaderState();
}

class _DrawerHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(color: MaterialColors.drawer),
        child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/img/logo-tftt.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
              child: Text("Théo Laperrouse",
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
                        child: Text("R3",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.purple),
                      child: Text(
                          Settings.getValue<String>('profileType', 'Joueur')
                              .capitalize(),
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text("1389",
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
        )));
  }
}
