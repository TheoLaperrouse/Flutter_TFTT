import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/team.dart';
import 'package:flutter_tftt/screens/team-rank.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/card-horizontal.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/utils/globals.dart' as globals;

class Teams extends StatefulWidget {
  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  List<Team> teams = globals.teams;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Application du TFTT",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Les Équipes"),
        body: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: teams.length > 0
                ? SingleChildScrollView(
                    child: Column(
                    children: new List.generate(
                      teams.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CardHorizontal(
                            cta: "Voir les résultats de l'équipe",
                            title: teams[index].nom,
                            tap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TeamRank(
                                          pouleid: teams[index].pouleid,
                                          division: teams[index].division)));
                            }),
                      ),
                    ),
                  ))
                : Center(child: CircularProgressIndicator())));
  }
}
