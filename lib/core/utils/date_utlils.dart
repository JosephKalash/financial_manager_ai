import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

abstract class DateUtils {
  static TimeOfDay parseStringToTime(String time) =>
      TimeOfDay(hour: int.parse(time.split(':').first), minute: int.parse(time.split(':')[1]));

  static TimeOfDay? dateToTime(DateTime? date) => date == null ? null : TimeOfDay.fromDateTime(date);

  static TimeOfDay? parseStringToTimeOr(String? time) =>
      time == null ? null : TimeOfDay(hour: int.parse(time.split(':').first), minute: int.parse(time.split(':')[1]));

  static double timeToDouble(TimeOfDay? time) {
    if (time == null) return 0;
    return time.hour + time.minute / 60;
  }

  static DateTime? parseDateOr(String? date) => date == null ? null : DateTime.tryParse(date)?.toLocal();
  static DateTime parseDate(String date) => DateTime.parse(date).toLocal();
  static String? dateToString(DateTime? date) => date?.toUtc().toIso8601String();

  static String formatDate(DateTime date, {String? pattern}) => DateFormat(pattern ?? 'd/M/y').format(date);
  static String? formatDateOr(DateTime? date, {String? pattern}) =>
      date == null ? null : DateFormat(pattern ?? 'd/M/y').format(date);

  static String getDateFormatLabel(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (isSameDate(date, today)) {
      return 'today'.tr();
    } else if (date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day) {
      return 'yesterday'.tr();
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  static bool isSameDate(DateTime date, DateTime date2) =>
      date.year == date2.year && date.month == date2.month && date.day == date2.day;

  static String getDateFormatStartWithTime(DateTime date, BuildContext context, {bool withYesterdayWord = false}) {
    final now = DateTime.now();
    final today = now;
    final yesterday = today.subtract(const Duration(days: 1));

    if (date.year == today.year && date.month == today.month && date.day == today.day) {
      return TimeOfDay.fromDateTime(date).format(context);
    } else if (date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day) {
      return withYesterdayWord ? '${'yesterday'.tr()} ' : TimeOfDay.fromDateTime(date).format(context);
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
