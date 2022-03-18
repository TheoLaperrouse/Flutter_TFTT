import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/event.dart';
import 'package:flutter_tftt/utils/utils.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:intl/intl.dart';

formatDate(eventType, startDate, endDate, selectedDay) {
  return '${eventType} : L${DateFormat('e dd/MM kk:mm').format(Utils.timeOfDayToDateTime(selectedDay, startDate))} à ${DateFormat('kk:mm').format(Utils.timeOfDayToDateTime(selectedDay, endDate))}';
}

class EventForm extends StatefulWidget {
  final DateTime selectedDay;
  final List<Event> dayEvents;
  const EventForm({
    Key key,
    @required this.selectedDay,
    @required this.dayEvents,
  }) : super(key: key);

  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  String dropdownValue = 'Réservation de Table';
  TimeOfDay startDate = TimeOfDay.now();
  TimeOfDay endDate = TimeOfDay.now();

  void _selectTime(bool isStartDate) async {
    debugPrint(widget.dayEvents.toString());
    final TimeOfDay newTime = await showTimePicker(
        context: context,
        builder: (context, childWidget) {
          return MediaQuery(
              child: childWidget,
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true));
        },
        initialTime: startDate,
        initialEntryMode: TimePickerEntryMode.input,
        cancelText: "Annuler",
        confirmText: "Valider",
        hourLabelText: "Heures",
        minuteLabelText: "Minutes",
        helpText: "Entrer l'heure");
    if (newTime != null) {
      setState(() {
        if (isStartDate) {
          startDate = newTime;
        } else {
          endDate = newTime;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Création d'un Événement",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Calendrier"),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () => _selectTime(true),
                child: Text("Début de l'événement"),
              ),
              ElevatedButton(
                onPressed: () => _selectTime(false),
                child: Text("Fin de l'événement"),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                elevation: 16,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Réservation de Table', 'Séance Individuelle']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Text(formatDate(
                  dropdownValue, startDate, endDate, widget.selectedDay)),
              // if (!Utils.canAddEvent(
              //     widget.dayEvents, startDate, endDate, widget.selectedDay))
              //   Text('Événement impossible à créer',
              //       style: TextStyle(color: Colors.red)),
              ElevatedButton(
                onPressed: () async {
                  await postEvent(new Event(
                    startDate: Utils.timeOfDayToDateTime(
                        widget.selectedDay, startDate),
                    endDate:
                        Utils.timeOfDayToDateTime(widget.selectedDay, endDate),
                    type: this.dropdownValue,
                    title: this.dropdownValue,
                  ));
                  Navigator.pushReplacementNamed(context, '/tablebooking');
                },
                child: Text("Créer l'événement"),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ));
  }
}
