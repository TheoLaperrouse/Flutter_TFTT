import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/screens/settings/account_page.dart';
import 'package:flutter_tftt/widgets/icon_widget.dart';

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
        body: ListView(padding: EdgeInsets.all(8), children: [
          AccountPage(),
          SettingsGroup(
            title: 'Notification',
            subtitle: "",
            children: <Widget>[buildNotification()],
          ),
        ]));
  }
}

Widget buildNotification() => SimpleSettingsTile(
      title: 'Type de Profil',
      subtitle: "",
      leading: IconWidget(
        icon: Icons.notifications,
        color: Colors.blue,
      ),
    );

Widget buildLicenceNum() => TextInputSettingsTile(
      title: 'Numéro De Licence',
      settingKey: 'numLicence',
      initialValue: '0',
    );
