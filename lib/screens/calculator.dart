import 'package:flutter/material.dart';

import 'package:flutter_tftt/constants/Theme.dart';

//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

List<Map<String, double>> ecartPoints = [
  {"ecartMax": 24, "def_nor": -5, "vic_nor": 6, "def_anor": -5, "vic_anor": 6},
  {
    "ecartMax": 5.5,
    "def_nor": -4.5,
    "vic_nor": 2,
    "def_anor": 1,
    "vic_anor": 2
  },
  {
    "ecartMax": 49,
    "def_nor": -4.5,
    "vic_nor": 5,
    "def_anor": -6,
    "vic_anor": 7
  },
  {"ecartMax": 99, "def_nor": -4, "vic_nor": 5, "def_anor": -7, "vic_anor": 8},
  {"ecartMax": 149, "def_nor": -3, "vic_nor": 5, "def_anor": -7, "vic_anor": 8},
  {
    "ecartMax": 199,
    "def_nor": -2,
    "vic_nor": 3,
    "def_anor": -10,
    "vic_anor": 13
  },
  {
    "ecartMax": 299,
    "def_nor": -1,
    "vic_nor": 2,
    "def_anor": -12.5,
    "vic_anor": 2
  },
  {
    "ecartMax": 399,
    "def_nor": -0.5,
    "vic_nor": 1,
    "def_anor": -16,
    "vic_anor": 2
  },
  {
    "ecartMax": 499,
    "def_nor": -1,
    "vic_nor": 0.5,
    "def_anor": 1,
    "vic_anor": 2
  },
  {"ecartMax": 1000, "def_nor": 0, "vic_nor": 0, "def_anor": 1, "vic_anor": 2},
];

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
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
      drawer: MaterialDrawer(currentPage: "Calculator"),
      body: Container(
          child: WebView(
        initialUrl: Uri.dataFromString(
                '<html><body><iframe loading="lazy" src="https://www.pongiste.fr/include/pages/calculateur_points.php" width="100%" height="405px" scrolling="no" frameborder="0"></iframe></body></html>',
                mimeType: 'text/html')
            .toString(),
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
