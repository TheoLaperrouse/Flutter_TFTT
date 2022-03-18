import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/team.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/card-horizontal.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import '../utils/utils.dart';
import 'package:flutter_tftt/utils/globals.dart' as globals;

String baseUrl =
    "https://www.pongiste.fr/include/pages/equipes.php?cx_poule=207068&D1=37884&organisme_pere=1&poule=1&num_club=03350060&color=5E9DC8&taille=&nomequipe=T.T%20THORIGNE-FOUILLARD%201&nomequipe=T.T%20THORIGNE-FOUILLARD%201&num_phase=all&numpoule=1&division=FED_PRO+B+Messieurs&phase=1";

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
                              Utils.launchLink(baseUrl);
                            }),
                      ),
                    ),
                  ))
                : Center(child: CircularProgressIndicator())));
  }
}
