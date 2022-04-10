import 'package:flutter/material.dart';

class CardMatch extends StatelessWidget {
  CardMatch({
    this.date = "",
    this.name = "Théo Laperrouse",
    this.classement = "500",
    this.victoire = false,
  });

  final String date;
  final String name;
  final String classement;
  final bool victoire;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Stack(clipBehavior: Clip.hardEdge, children: [
        Card(
          color: victoire
              ? Color.fromARGB(255, 29, 148, 33)
              : Color.fromARGB(255, 194, 35, 24),
          elevation: 0.7,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          child: Center(
              child: Text(
                  this.date + " " + this.name + ' (' + this.classement + ')')),
        ),
      ]),
    );
  }
}
