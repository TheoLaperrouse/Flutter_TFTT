import 'package:flutter/material.dart';

import 'package:flutter_tftt/constants/Theme.dart';

//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/card-horizontal.dart';
import 'package:flutter_tftt/widgets/drawer.dart';

final List<Map<String, String>> homeCards = [
  {
    "id": "1",
    "title": "Équipe Féminine : Nouvel effectif",
    "image": "assets/img/effectif_feminin.jpg",
  },
  {
    "id": "2",
    "title": "Metz-Thorigné 25 Décembre 19h30",
    "image": "assets/img/match.jpg",
  },
  {
    "id": "3",
    "title": "Tour de N2 Jeunes 29-30 Janvier",
    "image": "assets/img/effectif_feminin.jpg",
  },
  {
    "id": "4",
    "title": "Équipe Féminine : Nouvel effectif",
    "image": "assets/img/effectif_feminin.jpg",
  },
  {
    "id": "5",
    "title": "Metz-Thorigné 25 Décembre 19h30",
    "image": "assets/img/match.jpg",
  },
  {
    "id": "6",
    "title": "Tour de N2 Jeunes 29-30 Janvier",
    "image": "assets/img/effectif_feminin.jpg",
  }
];

class Home extends StatelessWidget {
  // final GlobalKey _scaffoldKey = new GlobalKey();
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
          child: SingleChildScrollView(
            child: Column(
              children: new List.generate(
                homeCards.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: CardHorizontal(
                      cta: "Voir l'article",
                      title: homeCards[index]["title"],
                      img: homeCards[index]['image'],
                      tap: () {
                        Navigator.pushReplacementNamed(
                            context, "/post/${homeCards[index]['image']}");
                      }),
                ),
              ),
            ),
          ),
        ));
  }
}
