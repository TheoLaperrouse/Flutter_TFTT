import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/match.dart';
import 'package:flutter_tftt/models/player.dart';
import 'package:flutter_tftt/widgets/card-match.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/widgets/profile-header.dart';

class Profile extends StatefulWidget {
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  List<Match> matches = [];
  int nbVictory;
  int nbDefeat;
  Player player;
  var numLic = Settings.getValue<String>('numLicence', '3524012');
  @override
  void initState() {
    super.initState();
    fetchPlayer(numLic).then((result) {
      setState(() {
        player = result;
      });
    });
    fetchMatches(numLic).then((result) {
      setState(() {
        matches = result;
        nbVictory = matches.where((match) => match.victoire).length;
        nbDefeat = matches.length - nbVictory;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Mon Profil",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Mon Profil"),
        body: matches.length > 0
            ? ListView(
                children: [
                  ProfileHeader(nbVictory: nbVictory, nbDefeat: nbDefeat),
                  Container(
                      child: SingleChildScrollView(
                          child: Column(
                              children: new List.generate(
                    matches.length,
                    (index) => CardMatch(
                        date: matches[index].date,
                        name: matches[index].nom,
                        victoire: matches[index].victoire,
                        classement: matches[index].classement),
                  ))))
                ],
              )
            : Center(child: CircularProgressIndicator()));
  }
}
