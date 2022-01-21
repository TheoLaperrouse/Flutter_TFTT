import 'package:url_launcher/url_launcher.dart';

class UtilsFunction {
  static void launchLink(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Impossible de lancer le lien.";
    }
  }
}
