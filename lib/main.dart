import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tftt/models/live.dart';
import 'package:flutter_tftt/models/player.dart';
import 'package:flutter_tftt/models/team.dart';
import 'package:flutter_tftt/utils/globals.dart' as globals;

// screens
import 'package:flutter_tftt/screens/home.dart';
import 'package:flutter_tftt/screens/ordering.dart';
import 'package:flutter_tftt/screens/pictures.dart';
import 'package:flutter_tftt/screens/profile.dart';
import 'package:flutter_tftt/screens/settings.dart';
import 'package:flutter_tftt/screens/calendar.dart';
import 'package:flutter_tftt/screens/teams.dart';
import 'package:flutter_tftt/screens/club-events.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await initializeDateFormatting();
  await initSettings();
  await initPlayer();
  await initLive();
  await initTeams();
  //initializeNotification();
  runApp(ApplicationTFTT());
}

Future<void> initSettings() async {
  await Settings.init(
    cacheProvider: SharePreferenceCache(),
  );
}

Future<void> initTeams() async {
  await fetchTeams().then((result) {
    globals.teams = result;
    globals.teams.forEachIndexed((index, team) => {
          globals.teamName[index.toString()] = team.nom,
          globals.teamSettings[index.toString()] = Team(
              nom: team.nom,
              pouleid: team.pouleid,
              division: team.division,
              championnat: team.championnat)
        });
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
          "/profile": (BuildContext context) => new Profile(),
          "/events": (BuildContext context) => new ClubEvents(),
          "/ordering": (BuildContext context) => new OrderingForm(),
          "/settings": (BuildContext context) => new SettingsPage(),
          "/calendar": (BuildContext context) => new Calendar(),
          "/teams": (BuildContext context) => new Teams(),
          "/picturealbum": (BuildContext context) => new PictureAlbum(),
        });
  }
}
