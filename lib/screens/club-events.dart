import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/clubEvent.dart';
import 'package:flutter_tftt/screens/club-event-form.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/card-horizontal.dart';
import 'package:flutter_tftt/widgets/drawer.dart';

class ClubEvents extends StatefulWidget {
  @override
  _ClubEventsState createState() => _ClubEventsState();
}

class _ClubEventsState extends State<ClubEvents> {
  List<ClubEvent> clubEvents = [];

  @override
  void initState() {
    super.initState();
    fetchClubEvents().then((result) {
      setState(() {
        clubEvents = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Événements TFTT",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Événements TFTT"),
        body: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: clubEvents.length > 0
                ? SingleChildScrollView(
                    child: Column(
                    children: new List.generate(
                      clubEvents.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CardHorizontal(
                            title: clubEvents[index].title,
                            cta:
                                '${clubEvents[index].volunteers.length.toString()} Bénévole',
                            tap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ClubEventForm(
                                            clubEvent: clubEvents[index],
                                          )));
                            }),
                      ),
                    ),
                  ))
                : Center(child: CircularProgressIndicator())));
  }
}
