import 'package:flutter/material.dart';

import 'package:flutter_tftt/constants/Theme.dart';

//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:table_calendar/table_calendar.dart';

class TableBooking extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<TableBooking> {
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
          title: "Réservation de tables",
        ),
        drawer: MaterialDrawer(currentPage: "Réservation de tables"),
        backgroundColor: MaterialColors.bgColorScreen,
        body: Container(
            child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        )));
  }
}
