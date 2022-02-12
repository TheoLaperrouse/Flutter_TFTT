import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/event.dart';
//widgets
import 'package:flutter_tftt/widgets/card-horizontal.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:table_calendar/table_calendar.dart';

class TableBooking extends StatefulWidget {
  @override
  _TableBookingState createState() => _TableBookingState();
}

class _TableBookingState extends State<TableBooking> {
  Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TimeOfDay startDate = TimeOfDay.now();
  TimeOfDay endDate;

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: startDate,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (newTime != null) {
      setState(() {
        startDate = newTime;
      });
    }
  }

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Réservation Table",
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "Réservation Table"),
      body: Column(
        children: [
          TableCalendar(
            availableCalendarFormats: {
              CalendarFormat.month: 'Mois',
              CalendarFormat.twoWeeks: '2 Semaines',
              CalendarFormat.week: 'Semaine'
            },
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            locale: 'fr-FR',
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            eventLoader: _getEventsfromDay,
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: MaterialColors.drawer,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => CardHorizontal(
              title: event.title,
              img: 'assets/img/match.jpg',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: MaterialColors.drawer,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Réserver une table"),
            content: Column(children: [
              ElevatedButton(
                onPressed: _selectTime,
                child: Text("Choisir l'heure du début de la séance"),
              ),
              SizedBox(height: 8),
              Text(
                'Début : ${startDate.format(context)}',
              ),
            ]),
            actions: [
              TextButton(
                child: Text("Annuler"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Valider"),
                onPressed: () {
                  endDate = TimeOfDay(
                      hour: startDate.hour + 1, minute: startDate.minute);
                  var event = Event(
                      title:
                          'Réservation Table : \n ${startDate.format(context)} - ${endDate.format(context)}');
                  if (selectedEvents[selectedDay] != null) {
                    selectedEvents[selectedDay].add(event);
                  } else {
                    selectedEvents[selectedDay] = [event];
                  }

                  Navigator.pop(context);
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Ajouter une réservation de table"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
