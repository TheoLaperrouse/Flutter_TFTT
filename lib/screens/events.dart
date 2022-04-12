import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/post.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/card-horizontal.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/utils/utils.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    fetchPosts().then((result) {
      setState(() {
        posts = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Événéments",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Événéments"),
        body: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: posts.length > 0
                ? SingleChildScrollView(
                    child: Column(
                    children: new List.generate(
                      posts.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: CardHorizontal(
                            cta: "Voir l'article",
                            title: posts[index].title,
                            networkImg: posts[index].networkImg,
                            tap: () async {
                              await Utils.launchLink(posts[index].link);
                            }),
                      ),
                    ),
                  ))
                : Center(child: CircularProgressIndicator())));
  }
}
