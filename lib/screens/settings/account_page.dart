import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tftt/widgets/icon_widget.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
        title: "Paramètres utilisateur",
        subtitle: "",
        leading: IconWidget(
          icon: Icons.notifications,
          color: Colors.blue,
        ),
        child:
            SettingsScreen(children: [buildProfilType(), buildLicenceNum()]));
  }
}

Widget buildProfilType() => DropDownSettingsTile<String>(
      title: 'Type de Profil',
      settingKey: 'profileType',
      values: <String, String>{
        'joueur': 'Joueur',
        'entraineur': 'Entraineur',
        'bureau': 'Bureau',
      },
      selected: 'joueur',
      subtitle: "",
    );

Widget buildLicenceNum() => TextInputSettingsTile(
      title: 'Numéro De Licence',
      settingKey: 'numLicence',
      initialValue: '3524012',
      borderColor: Colors.blueAccent,
    );
