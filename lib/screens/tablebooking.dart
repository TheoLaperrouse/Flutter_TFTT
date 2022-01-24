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
  CalendarFormat _calendarFormat = CalendarFormat.twoWeeks;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  void initState() {
    setState(() {});
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
            child: Column(children: [
          SizedBox(
            width: 100,
            height: 40,
          ),
          TableCalendar(
              calendarFormat: _calendarFormat,
              locale: 'fr_FR',
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              rowHeight: 70,
              headerVisible: false)
        ])));
  }
}
