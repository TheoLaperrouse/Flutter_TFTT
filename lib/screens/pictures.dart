import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/models/post.dart';
//widgets
import 'package:flutter_tftt/widgets/navbar.dart';
import 'package:flutter_tftt/widgets/drawer.dart';
import 'package:flutter_tftt/widgets/photo-album.dart';

class PictureAlbum extends StatefulWidget {
  @override
  _PictureAlbum createState() => _PictureAlbum();
}

class _PictureAlbum extends State<PictureAlbum> {
  List<String> pictures = [];

  @override
  void initState() {
    super.initState();
    fetchPosts().then((result) {
      setState(() {
        pictures = result.map((res) => res.networkImg).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Album Photo",
        ),
        backgroundColor: MaterialColors.bgColorScreen,
        drawer: MaterialDrawer(currentPage: "Album Photo"),
        body: pictures.length > 0
            ? SizedBox(child: PhotoAlbum(imgArray: pictures))
            : Center(child: CircularProgressIndicator()));
  }
}
