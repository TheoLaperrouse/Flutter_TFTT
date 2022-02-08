import 'package:flutter/material.dart';

class CardMatch extends StatelessWidget {
  CardMatch({
    this.name = "Gwendal Labrue",
    this.result = "Défaite",
  });

  final String name;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Stack(clipBehavior: Clip.hardEdge, children: [
        Card(
          elevation: 0.7,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0))),
          child: Row(
            children: [
              Flexible(flex: 1, child: Text(this.result)),
            ],
          ),
        ),
      ]),
    );
  }
}
