import 'package:flutter/material.dart';
import 'package:flutter_tftt/models/event.dart';
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

  static String formatTeamName(String teamName) {
    teamName = teamName.split(' n°')[0].replaceFirst(' Dames', '');
    if (teamName.length > 12) {
      return '${teamName.substring(0, 3)}.${teamName.substring(teamName.length - 1)}';
    } else {
      return teamName;
    }
  }

  static int compareTimeOfDay(DateTime dateTimeA, DateTime dateTimeB) {
    DateTime timeOfDayA =
        new DateTime(0, 0, 0, dateTimeA.hour, dateTimeA.minute);
    DateTime timeOfDayB =
        new DateTime(0, 0, 0, dateTimeB.hour, dateTimeB.minute);
    return timeOfDayA.compareTo(timeOfDayB);
  }

  static bool canAddEvent(List<Event> events, TimeOfDay startDateHour,
      TimeOfDay endDateHour, selectedDay) {
    DateTime startDate = Utils.timeOfDayToDateTime(selectedDay, startDateHour);
    DateTime endDate = Utils.timeOfDayToDateTime(selectedDay, endDateHour);
    return events.every((event) =>
        startDate.isAfter(event.endDate) && endDate.isBefore(event.startDate));
  }

  static DateTime getDay(selectedDay) {
    return new DateTime.utc(
        selectedDay.year, selectedDay.month, selectedDay.day);
  }
}
