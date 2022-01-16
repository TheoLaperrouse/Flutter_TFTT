import 'package:flutter/material.dart';

import 'package:flutter_tftt/constants/Theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/widgets/input.dart';
import 'package:flutter_tftt/widgets/card-horizontal.dart';
import 'package:flutter_tftt/widgets/slider-product.dart';
import 'package:flutter_tftt/widgets/photo-album.dart';
import 'package:flutter_tftt/widgets/table-cell.dart';

List<Map<String, double>> ecartPoints = [
  {"ecartMax": 24, "def_nor": -5, "vic_nor": 6, "def_anor": -5, "vic_anor": 6},
  {
    "ecartMax": 5.5,
    "def_nor": -4.5,
    "vic_nor": 2,
    "def_anor": 1,
    "vic_anor": 2
  },
  {"ecartMax": 99, "def_nor": 1, "vic_nor": 2, "def_anor": 1, "vic_anor": 2},
  {"ecartMax": 199, "def_nor": 1, "vic_nor": 2, "def_anor": 1, "vic_anor": 2},
  {"ecartMax": 299, "def_nor": 1, "vic_nor": 2, "def_anor": 1, "vic_anor": 2},
  {"ecartMax": 399, "def_nor": 1, "vic_nor": 2, "def_anor": 1, "vic_anor": 2},
  {"ecartMax": 499, "def_nor": 1, "vic_nor": 2, "def_anor": 1, "vic_anor": 2},
  {"ecartMax": 1000, "def_nor": 1, "vic_nor": 2, "def_anor": 1, "vic_anor": 2},
];

class Components extends StatefulWidget {
  @override
  _ComponentsState createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  bool switchValueOne;
  bool switchValueTwo;

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Calculateur de Points",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Components"),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(right: 24, left: 24, bottom: 36),
        )));
  }
}
