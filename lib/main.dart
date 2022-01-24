import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

// screens
import 'package:flutter_tftt/screens/home.dart';
import 'package:flutter_tftt/screens/profile.dart';
import 'package:flutter_tftt/screens/settings.dart';
import 'package:flutter_tftt/screens/onboarding.dart';
import 'package:flutter_tftt/screens/calculator.dart';
import 'package:flutter_tftt/screens/tablebooking.dart';
import 'package:flutter_tftt/screens/teams.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await initializeDateFormatting();
  await initSettings();
  runApp(ApplicationTFTT());
}

Future<void> initSettings() async {
  await Settings.init(
    cacheProvider: SharePreferenceCache(),
  );
}

class ApplicationTFTT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Application TFTT",
        debugShowCheckedModeBanner: false,
        initialRoute: "/onboarding",
        routes: <String, WidgetBuilder>{
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/home": (BuildContext context) => new Home(),
          "/calculator": (BuildContext context) => new Calculator(),
          "/profile": (BuildContext context) => new Profile(),
          "/settings": (BuildContext context) => new SettingsPage(),
          "/tablebooking": (BuildContext context) => new TableBooking(),
          "/teams": (BuildContext context) => new Teams(),
        });
  }
}
