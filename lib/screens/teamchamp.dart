import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Championnat",
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "Championnat"),
      body: Container(
          child: WebView(
        initialUrl: Uri.dataFromString(
                '<html><body><iframe src="https://www.pongiste.fr/include/pages/equipes.php?cx_poule=155696&amp;D1=37493&amp;organisme_pere=43&amp;poule=1&amp;num_club=03350060&amp;color=5E9DC8&amp;taille=&amp;nomequipe=THORIGNE%20TT%209&amp;nomequipe=THORIGNE%20TT%209&amp;num_phase=all&amp;numpoule=1&amp;division=D35_Division+1+Ph1&amp;phase=1" width="100%" height="100%" frameborder="0" scrolling="no"><span data-mce-type="bookmark" style="display: inline-block; width: 0px; overflow: hidden; line-height: 0;" class="mce_SELRES_start">﻿</span><span data-mce-type="bookmark" style="display: inline-block; width: 0px; overflow: hidden; line-height: 0;" class="mce_SELRES_start">﻿</span></iframe>',
                mimeType: 'text/html')
            .toString(),
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
