import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tftt/models/player.dart';
import 'package:flutter_tftt/utils/globals.dart' as globals;

// screens
import 'package:flutter_tftt/screens/home.dart';
import 'package:flutter_tftt/screens/pictures.dart';
import 'package:flutter_tftt/screens/profile.dart';
import 'package:flutter_tftt/screens/settings.dart';
import 'package:flutter_tftt/screens/tablebooking.dart';
import 'package:flutter_tftt/screens/teams.dart';
import 'package:flutter_tftt/utils/notifications.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await initializeDateFormatting();
  await initSettings();
  await initPlayer();
  initializeNotification();
  runApp(ApplicationTFTT());
}

Future<void> initSettings() async {
  await Settings.init(
    cacheProvider: SharePreferenceCache(),
  );
}

Future<void> initPlayer() async {
  await fetchPlayer(Settings.getValue<String>('numLicence', '3524012'))
      .then((result) {
    globals.player = result;
  });
}

class ApplicationTFTT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Application TFTT",
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        routes: <String, WidgetBuilder>{
          "/home": (BuildContext context) => new Home(),
          // "/calculator": (BuildContext context) => new Calculator(),
          "/profile": (BuildContext context) => new Profile(),
          "/settings": (BuildContext context) => new SettingsPage(),
          "/tablebooking": (BuildContext context) => new TableBooking(),
          "/teams": (BuildContext context) => new Teams(),
          "/picturealbum": (BuildContext context) => new PictureAlbum(),
        });
  }
}
