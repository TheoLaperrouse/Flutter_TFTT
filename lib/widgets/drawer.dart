import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_tftt/constants/Theme.dart';

import 'package:flutter_tftt/widgets/drawer-tile.dart';

class MaterialDrawer extends StatelessWidget {
  final String currentPage;

  MaterialDrawer({this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          child: Column(children: [
        DrawerHeader(
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                            Settings.getValue<String>(
                                'profileType', 'Entraineur'),
                            style: TextStyle(
                                color: MaterialColors.muted, fontSize: 16)),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text("1389",
                                style: TextStyle(
                                    color: MaterialColors.warning,
                                    fontSize: 16)),
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
        Expanded(
            child: ListView(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8),
          children: [
            DrawerTile(
                icon: Icons.home,
                onTap: () {
                  if (currentPage != "Posts du TFTT")
                    Navigator.pushReplacementNamed(context, '/home');
                },
                iconColor: Colors.black,
                title: "Posts du TFTT",
                isSelected: currentPage == "Posts du TFTT" ? true : false),
            DrawerTile(
                icon: Icons.account_circle,
                onTap: () {
                  if (currentPage != "Mon profil")
                    Navigator.pushReplacementNamed(context, '/profile');
                },
                iconColor: Colors.black,
                title: "Mon profil",
                isSelected: currentPage == "Mon profil" ? true : false),
            DrawerTile(
                icon: Icons.table_view,
                onTap: () {
                  if (currentPage != "Calculator")
                    Navigator.pushReplacementNamed(context, '/calculator');
                },
                iconColor: Colors.black,
                title: "Calcul de Points",
                isSelected: currentPage == "Calculator" ? true : false),
            DrawerTile(
                icon: Icons.group,
                onTap: () {
                  if (currentPage != "Les Équipes")
                    Navigator.pushReplacementNamed(context, '/teams');
                },
                iconColor: Colors.black,
                title: "Les Équipes",
                isSelected: currentPage == "Les Équipes" ? true : false),
            DrawerTile(
                icon: Icons.book_online_outlined,
                onTap: () {
                  if (currentPage != "Réservation de tables")
                    Navigator.pushReplacementNamed(context, '/tablebooking');
                },
                iconColor: Colors.black,
                title: "Réservation de tables",
                isSelected:
                    currentPage == "Réservation de tables" ? true : false),
            DrawerTile(
                icon: Icons.photo_camera,
                onTap: () {
                  if (currentPage != "Album Photo")
                    Navigator.pushReplacementNamed(context, '/picturealbum');
                },
                iconColor: Colors.black,
                title: "Album Photo",
                isSelected: currentPage == "Album Photo" ? true : false),
            DrawerTile(
                icon: Icons.settings,
                onTap: () {
                  if (currentPage != "Paramètres")
                    Navigator.pushReplacementNamed(context, '/settings');
                },
                iconColor: Colors.black,
                title: "Paramètres",
                isSelected: currentPage == "Paramètres" ? true : false),
          ],
        ))
      ])),
    );
  }
}
