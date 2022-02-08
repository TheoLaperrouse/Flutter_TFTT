import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Mon Profil",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Mon Profil"),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage("assets/img/user.jpg"),
                      fit: BoxFit.fitWidth)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.9),
                  ])),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.50,
              ),
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text("Théo Laperrouse",
                        style: TextStyle(fontSize: 28, color: Colors.white)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 8,
                            blurRadius: 10,
                            offset: Offset(0, 0))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.0),
                        topRight: Radius.circular(13.0),
                      )),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.58,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text("1472",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 6,
                                ),
                                Text("Points",
                                    style:
                                        TextStyle(color: MaterialColors.muted))
                              ],
                            ),
                            Column(
                              children: [
                                Text("7",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 6,
                                ),
                                Text("Victoires",
                                    style:
                                        TextStyle(color: MaterialColors.muted))
                              ],
                            ),
                            Column(
                              children: [
                                Text("2",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 6,
                                ),
                                Text("Défaites",
                                    style:
                                        TextStyle(color: MaterialColors.muted))
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("2",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(
                              height: 6,
                            ),
                            Text("Défaites",
                                style: TextStyle(color: MaterialColors.muted))
                          ],
                        )
                      ],
                    ),
                  )),
            )
          ],
        ));
  }
}
