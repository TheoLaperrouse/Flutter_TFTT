import 'package:flutter/material.dart';

import 'package:flutter_tftt/constants/Theme.dart';

//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
          child: Expanded(
              child: WebView(
            initialUrl: Uri.dataFromString(
                    '<html><body><iframe loading="lazy" src="https://www.pongiste.fr/include/pages/calculateur_points.php" width="100%" height="405px" scrolling="no" frameborder="0"></iframe></body></html>',
                    mimeType: 'text/html')
                .toString(),
            javascriptMode: JavascriptMode.unrestricted,
          )),
        ));
  }
}
