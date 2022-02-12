import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/team.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/card-horizontal.dart';
import 'package:flutter_tftt/widgets/drawer.dart';

class Teams extends StatefulWidget {
  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  List<String> teams = [];

  @override
  void initState() {
    super.initState();
    fetchTeams("03350060").then((result) {
      setState(() {
        teams = result.map((team) => team.nomEquipe).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Application du TFTT",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Posts du TFTT"),
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
                            title: teams[index],
                            img: 'assets/img/match.jpg',
                            tap: () {
                              //UtilsFunction.launchLink(posts[index].link);
                            }),
                      ),
                    ),
                  ))
                : Center(child: CircularProgressIndicator())));
  }
}
