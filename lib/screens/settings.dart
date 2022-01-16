import 'package:flutter/material.dart';

import 'package:flutter_tftt/constants/Theme.dart';

//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/table-cell.dart';

import 'package:flutter_tftt/widgets/drawer.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool switchValueOne;
  bool switchValueTwo;

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Paramètres",
        ),
        drawer: MaterialDrawer(currentPage: "Paramètres"),
        backgroundColor: MaterialColors.bgColorScreen,
        body: Container(
            child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Paramètres de profil",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("These are the most important settings",
                        style: TextStyle(
                            color: MaterialColors.caption, fontSize: 14)),
                  ),
                ),
                TableCellSettings(
                    title: "Notifications",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/pro');
                    }),
                SizedBox(height: 36.0),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text("Privacy Settings",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Third most important settings",
                        style: TextStyle(color: MaterialColors.caption)),
                  ),
                ),
                TableCellSettings(
                    title: "User Agreement",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/pro');
                    }),
                TableCellSettings(
                    title: "Privacy",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/pro');
                    }),
                TableCellSettings(
                    title: "About",
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/pro');
                    }),
              ],
            ),
          ),
        )));
  }
}
