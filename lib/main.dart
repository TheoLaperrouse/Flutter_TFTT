import 'package:flutter/material.dart';

// screens
import 'package:flutter_tftt/screens/home.dart';
import 'package:flutter_tftt/screens/profile.dart';
import 'package:flutter_tftt/screens/settings.dart';
import 'package:flutter_tftt/screens/components.dart';
import 'package:flutter_tftt/screens/onboarding.dart';
import 'package:flutter_tftt/screens/calculator.dart';
import 'package:flutter_tftt/screens/tablebooking.dart';

void main() => runApp(MaterialKitPROFlutter());

class MaterialKitPROFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Material Kit PRO Flutter",
        debugShowCheckedModeBanner: false,
        initialRoute: "/onboarding",
        routes: <String, WidgetBuilder>{
          "/onboarding": (BuildContext context) => new Onboarding(),
          "/home": (BuildContext context) => new Home(),
          "/components": (BuildContext context) => new Components(),
          "/calculator": (BuildContext context) => new Calculator(),
          "/profile": (BuildContext context) => new Profile(),
          "/settings": (BuildContext context) => new Settings(),
          "/tablebooking": (BuildContext context) => new TableBooking(),
        });
  }
}
