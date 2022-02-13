import 'package:flutter/material.dart';
import 'package:flutter_tftt/constants/Theme.dart';
import 'package:flutter_tftt/utils/utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String categoryOne;
  final String categoryTwo;
  final bool searchBar;
  final bool backButton;
  final bool transparent;
  final bool rightOptions;
  final List<String> tags;
  final Function getCurrentPage;
  final bool isOnSearch;
  final TextEditingController searchController;
  final Function searchOnChanged;
  final bool searchAutofocus;
  final bool noShadow;
  final Color bgColor;

  Navbar(
      {this.title = "Home",
      this.categoryOne = "",
      this.categoryTwo = "",
      this.tags,
      this.transparent = false,
      this.rightOptions = true,
      this.getCurrentPage,
      this.searchController,
      this.isOnSearch = false,
      this.searchOnChanged,
      this.searchAutofocus = false,
      this.backButton = false,
      this.noShadow = false,
      this.bgColor = Colors.white,
      this.searchBar = false});

  final double _prefferedHeight = 150.0;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  String activeTag;

  void initState() {
    if (widget.tags != null && widget.tags.length != 0) {
      activeTag = widget.tags[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      decoration: BoxDecoration(
          color: !widget.transparent ? widget.bgColor : Colors.transparent,
          boxShadow: [
            BoxShadow(
                color: !widget.transparent && !widget.noShadow
                    ? Colors.black.withOpacity(0.6)
                    : Colors.transparent,
                spreadRadius: -10,
                blurRadius: 12,
                offset: Offset(0, 5))
          ]),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: Icon(
                            !widget.backButton
                                ? Icons.menu
                                : Icons.arrow_back_ios,
                            color: !widget.transparent
                                ? (widget.bgColor == Colors.white
                                    ? Colors.black
                                    : Colors.white)
                                : Colors.white,
                            size: 24.0),
                        onPressed: () {
                          if (!widget.backButton)
                            Scaffold.of(context).openDrawer();
                          else
                            Navigator.pop(context);
                        }),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(widget.title,
                          style: TextStyle(
                              color: !widget.transparent
                                  ? (widget.bgColor == Colors.white
                                      ? Colors.black
                                      : Colors.white)
                                  : Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await UtilsFunction.launchLink(
                            'https://www.instagram.com/thorignett/');
                      },
                      child: IconButton(
                          icon: Icon(Icons.photo_camera,
                              color: Colors.black, size: 22.0),
                          onPressed: null),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await UtilsFunction.launchLink(!kIsWeb
                            ? 'fb://page/251704445607468'
                            : 'https://www.facebook.com/Equipe-professionnelle-Thorign%C3%A9-Fouillard-TT-251704445607468');
                      },
                      child: IconButton(
                          icon: Icon(Icons.facebook,
                              color: MaterialColors.socialFacebook, size: 22.0),
                          onPressed: null),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await UtilsFunction.launchLink(
                            'https://ker-crea.fr/168-tftt');
                      },
                      child: IconButton(
                          icon: Icon(Icons.add_shopping_cart,
                              color: !widget.transparent
                                  ? (widget.bgColor == Colors.white
                                      ? Colors.black
                                      : Colors.white)
                                  : Colors.white,
                              size: 22.0),
                          onPressed: null),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
