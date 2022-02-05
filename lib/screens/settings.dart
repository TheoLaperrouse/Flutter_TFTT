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
      body: SafeArea(
        child: ListView(
          children: [
            SettingsGroup(title: "Paramètres utilisateur", children: [
              buildProfileType(),
              buildLicenceNum(),
              buildTeam(),
              buildNotification()
            ]),
          ],
        ),
      ),
    );
  }
}

Widget buildProfileType() => DropDownSettingsTile<String>(
      title: 'Type de Profil',
      settingKey: 'profileType',
      values: <String, String>{
        'joueur': 'Joueur',
        'entraineur': 'Entraîneur',
        'bureau': 'Bureau',
      },
      selected: 'joueur',
    );

Widget buildLicenceNum() => TextInputSettingsTile(
      title: 'Numéro De Licence',
      settingKey: 'numLicence',
      initialValue: '0',
    );
Widget buildTeam() => DropDownSettingsTile<String>(
      title: 'Èquipe',
      settingKey: 'team',
      values: <String, String>{
        // 'joueur': 'Joueur',
        // 'entraineur': 'Entraîneur',
        // 'bureau': 'Bureau',
      },
      selected: '',
    );
Widget buildNotification() => SwitchSettingsTile(
      title: 'Activer/Désactiver les notifications',
      settingKey: 'enableNotification',
      enabledLabel: 'Activé',
      disabledLabel: 'Désactivé',
      leading: Icon(Icons.notifications),
    );
