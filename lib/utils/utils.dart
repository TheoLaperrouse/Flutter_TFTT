import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void launchLink(url) async {
    await launch(url);
  }

  static DateTime timeOfDayToDateTime(DateTime selectedDay, TimeOfDay t) {
    return new DateTime(
        selectedDay.year, selectedDay.month, selectedDay.day, t.hour, t.minute);
  }

  static TimeOfDay dateTimeToTimeOfDay(DateTime dateTime) {
    return new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  static int compareTimeOfDay(DateTime dateTimeA, DateTime dateTimeB) {
    DateTime timeOfDayA =
        new DateTime(0, 0, 0, dateTimeA.hour, dateTimeA.minute);
    DateTime timeOfDayB =
        new DateTime(0, 0, 0, dateTimeB.hour, dateTimeB.minute);
    return timeOfDayA.compareTo(timeOfDayB);
  }

  static DateTime getDay(selectedDay) {
    return new DateTime.utc(
        selectedDay.year, selectedDay.month, selectedDay.day);
  }
}
