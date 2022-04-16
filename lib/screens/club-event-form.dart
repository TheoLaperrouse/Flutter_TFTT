import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/clubEvent.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/widgets/navbar.dart';

class ClubEventForm extends StatefulWidget {
  final ClubEvent clubEvent;
  const ClubEventForm({
    Key key,
    @required this.clubEvent,
  }) : super(key: key);

  @override
  _ClubEventFormState createState() => _ClubEventFormState();
}

class _ClubEventFormState extends State<ClubEventForm> {
  final _name = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: widget.clubEvent.title,
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Calendrier"),
        body: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 60,
              ),
              TextFormField(
                controller: _name,
                maxLines: 1,
                decoration: const InputDecoration(
                    labelText: 'Nom & Prénom',
                    hintText: 'Nom & Prénom pour remise à la réception',
                    border: OutlineInputBorder()),
              ),
              Text(
                  'Bénévoles déjà inscrits : ${widget.clubEvent.volunteers.toString()}'),
              ElevatedButton(
                onPressed: () => '',
                child: Text("Participer à l'événement"),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ));
  }
}
