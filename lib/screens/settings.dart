import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/player.dart';
import 'package:flutter_tftt/utils/settings_key.dart';
import 'package:flutter_tftt/utils/globals.dart' as globals;
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';

Map<String, String> teamName = globals.teamSettings;

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
      body: SettingsGroup(title: "Paramètres utilisateur", children: [
        buildProfileType(),
        buildLicenceNum(),
        buildTeam(),
        buildNotification()
      ]),
    );
  }
}

Widget buildProfileType() => DropDownSettingsTile<String>(
      title: 'Type de Profil',
      settingKey: 'profileType',
      values: SettingsKey.profileType,
      selected: 'joueur',
    );

Widget buildLicenceNum() => TextInputSettingsTile(
      title: 'Numéro De Licence',
      settingKey: 'numLicence',
      initialValue: '3524012',
      onChange: (numLic) =>
          {fetchPlayer(numLic).then((result) => globals.player = result)},
    );
Widget buildTeam() => DropDownSettingsTile<String>(
      title: 'Équipe',
      settingKey: 'team',
      values: teamName,
      selected: '0',
    );
Widget buildNotification() => SwitchSettingsTile(
    title: 'Activer/Désactiver les notifications',
    settingKey: 'notificationEnabled',
    enabledLabel: 'Activé',
    disabledLabel: 'Désactivé',
    leading: Icon(Icons.notifications),
    onChange: (notificationEnabled) => {
          AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
            if (!isAllowed) {
              AwesomeNotifications().requestPermissionToSendNotifications();
            }
          })
        });
