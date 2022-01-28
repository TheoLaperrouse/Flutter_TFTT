import 'package:flutter/material.dart';

class PhotoAlbum extends StatelessWidget {
  final List<String> imgArray;

  PhotoAlbum({@required this.imgArray});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
          primary: false,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: imgArray
              .map((item) => Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      image: DecorationImage(
                          image: AssetImage('assets/img/match.jpg'),
                          fit: BoxFit.cover))))
              .toList()),
    );
  }
}
