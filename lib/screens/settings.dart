import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'package:flutter_tftt/constants/Theme.dart';

//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Paramètres",
        ),
        drawer: MaterialDrawer(currentPage: "Paramètres"),
        backgroundColor: MaterialColors.bgColorScreen,
        body: Container(
            child: SettingsGroup(
          title: 'Paramètres Utilisateur',
          children: <Widget>[
            RadioSettingsTile<String>(
              title: 'Type de Profil',
              settingKey: 'profileType',
              values: <String, String>{
                'joueur': 'Joueur',
                'entraineur': 'Entraineur',
                'bureau': 'Bureau',
              },
              selected: 'player',
            ),
            TextInputSettingsTile(
              title: 'Numéro De Licence',
              settingKey: 'numLicence',
              initialValue: '0',
              borderColor: Colors.blueAccent,
            )
          ],
        )));
  }
}
