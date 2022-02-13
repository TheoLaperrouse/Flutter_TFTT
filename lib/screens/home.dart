import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/post.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/card-horizontal.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/utils/utils.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          title: "Application du TFTT",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Posts du TFTT"),
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
                            img: 'assets/img/match.jpg',
                            tap: () async {
                              await UtilsFunction.launchLink(posts[index].link);
                            }),
                      ),
                    ),
                  ))
                : Center(child: CircularProgressIndicator())));
  }
}
