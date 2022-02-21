import 'package:url_launcher/url_launcher.dart';

class UtilsFunction {
  static void launchLink(url) async {
    await launch(url);
  }

  static DateTime timeOfDayToDateTime(selectedDay, t) {
    return new DateTime(
        selectedDay.year, selectedDay.month, selectedDay.day, t.hour, t.minute);
  }

  static DateTime getDay(selectedDay) {
    return new DateTime.utc(
        selectedDay.year, selectedDay.month, selectedDay.day);
  }
}
