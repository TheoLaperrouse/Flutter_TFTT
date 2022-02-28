import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/event.dart';
import 'package:flutter_tftt/utils/utils.dart';
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
  Map<DateTime, List<Event>> selectedEvents = {};
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = UtilsFunction.getDay(DateTime.now());
  DateTime focusedDay = UtilsFunction.getDay(DateTime.now());
  TimeOfDay startDate = TimeOfDay.now();
  TimeOfDay endDate;
  String typeBooking;

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

  List<Event> eventsList;
  @override
  void initState() {
    super.initState();
    fetchEvents().then((result) {
      setState(() {
        result.forEach((event) => {
              if (selectedEvents[UtilsFunction.getDay(event.startDate)] != null)
                {
                  selectedEvents[UtilsFunction.getDay(event.startDate)]
                      .add(event)
                }
              else
                {
                  selectedEvents[UtilsFunction.getDay(event.startDate)] = [
                    event
                  ]
                }
            });
      });
    });
  }

  List<Event> _getEventsfromDay(DateTime date) {
    if (selectedEvents[date] != null) {
      var events = selectedEvents[date];
      events.sort((a, b) => a.startDate.compareTo(b.startDate));
      return events;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Calendrier",
      ),
      backgroundColor: MaterialColors.bgColorScreen,
      drawer: MaterialDrawer(currentPage: "Calendrier"),
      body: Column(
        children: [
          TableCalendar(
            availableCalendarFormats: {
              CalendarFormat.month: 'Mois',
              CalendarFormat.twoWeeks: '2 Semaines',
              CalendarFormat.week: 'Semaine'
            },
            focusedDay: UtilsFunction.getDay(selectedDay),
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
                selectedDay = UtilsFunction.getDay(selectDay);
                focusedDay = UtilsFunction.getDay(focusDay);
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            eventLoader: _getEventsfromDay,
            calendarStyle: CalendarStyle(
              markerSize: 12,
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
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              ..._getEventsfromDay(selectedDay).map(
                (Event event) => CardHorizontal(
                  title: event.title,
                ),
              ),
            ],
          )))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: MaterialColors.drawer,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Réserver une table"),
            content: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _selectTime,
                    child: Text("Heure de début de l'événement"),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text("Annuler"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Valider"),
                onPressed: () async {
                  endDate = TimeOfDay(
                      hour: this.startDate.hour + 1,
                      minute: this.startDate.minute);
                  var event = Event(
                      startDate: UtilsFunction.timeOfDayToDateTime(
                          this.selectedDay, this.startDate),
                      endDate: UtilsFunction.timeOfDayToDateTime(
                          this.selectedDay, this.endDate),
                      type: 'Réservation de Table',
                      title:
                          'Réservation de Table : \n ${startDate.format(context)} - ${endDate.format(context)}');
                  DateTime formattedDay = UtilsFunction.getDay(selectedDay);
                  if (selectedEvents[formattedDay] != null) {
                    selectedEvents[formattedDay].add(event);
                  } else {
                    selectedEvents[formattedDay] = [event];
                  }
                  await postEvent(event);
                  // Refresh list
                  setState(() {
                    selectedDay = formattedDay;
                  });
                  Navigator.pop(context);
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
