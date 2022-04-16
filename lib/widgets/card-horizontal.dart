import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';

class CardHorizontal extends StatelessWidget {
  CardHorizontal(
      {this.title = "Placeholder Title",
      this.cta = "",
      this.networkImg = null,
      this.assetImg = null,
      this.tap = defaultFunc,
      this.height = 130});

  final String cta;
  final String networkImg;
  final String assetImg;
  final Function tap;
  final String title;
  final double height;

  static void defaultFunc() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        margin: EdgeInsets.only(top: 10),
        child: GestureDetector(
          onTap: tap,
          child: Stack(clipBehavior: Clip.hardEdge, children: [
            Card(
              elevation: 0.7,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              child: Row(
                children: [
                  Flexible(flex: 1, child: Container()),
                  Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title,
                                style: TextStyle(
                                    color: MaterialColors.caption,
                                    fontSize: 16)),
                            Text(cta,
                                style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ))
                ],
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.04, -0.08),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    padding: EdgeInsets.all(4.0),
                    height: MediaQuery.of(context).size.height / 2,
                    width: 165,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset: Offset(0, 0))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        image: DecorationImage(
                            image: networkImg != null
                                ? NetworkImage(networkImg)
                                : AssetImage(
                                    assetImg ?? 'assets/img/match.jpg'),
                            fit: BoxFit.cover))),
              ),
            ),
          ]),
        ));
  }
}
