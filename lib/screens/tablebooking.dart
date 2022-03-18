import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/RecurringEvents.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/event.dart';
import 'package:flutter_tftt/screens/event-form.dart';
import 'package:flutter_tftt/utils/utils.dart';
//widgets
import 'package:flutter_tftt/widgets/card-horizontal.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TableBooking extends StatefulWidget {
  @override
  _TableBookingState createState() => _TableBookingState();
}

class _TableBookingState extends State<TableBooking> {
  Map<DateTime, List<Event>> selectedEvents = {};
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = Utils.getDay(DateTime.now());
  DateTime focusedDay = Utils.getDay(DateTime.now());
  TimeOfDay startDate = TimeOfDay.now();
  TimeOfDay endDate;
  String typeBooking;

  List<Event> eventsList;
  @override
  void initState() {
    super.initState();
    fetchEvents().then((result) {
      setState(() {
        result.forEach((event) => {
              if (selectedEvents[Utils.getDay(event.startDate)] != null)
                {selectedEvents[Utils.getDay(event.startDate)].add(event)}
              else
                {
                  selectedEvents[Utils.getDay(event.startDate)] = [event]
                }
            });
      });
    });
  }

  List<Event> _getEventsfromDay(DateTime date) {
    List<Event> dayEvents = recurringEvents[date.weekday];
    if (dayEvents != [] || selectedEvents[date] != null) {
      List<Event> events = [...dayEvents, ...(selectedEvents[date] ?? [])];
      events.sort((a, b) => Utils.compareTimeOfDay(a.startDate, b.startDate));
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
            focusedDay: Utils.getDay(selectedDay),
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
                selectedDay = Utils.getDay(selectDay);
                focusedDay = Utils.getDay(focusDay);
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
            calendarBuilders: CalendarBuilders(
              singleMarkerBuilder: (context, date, event) {
                if (event.type != 'Entraînement') {
                  return Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: date == selectedDay
                            ? Colors.white
                            : eventMarker.colors[event.type]),
                    width: 5.0,
                    height: 5.0,
                    margin: const EdgeInsets.symmetric(horizontal: 1.5),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              ..._getEventsfromDay(selectedDay).map((Event event) => CardHorizontal(
                  title:
                      '${event.title} : \n${DateFormat('kk:mm').format(event.startDate)} - ${DateFormat('kk:mm').format(event.endDate)}',
                  height: 110)),
            ],
          )))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: MaterialColors.drawer,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventForm(
                    selectedDay: selectedDay,
                    dayEvents: _getEventsfromDay(selectedDay)))),
        label: Text("Ajouter une événement"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
