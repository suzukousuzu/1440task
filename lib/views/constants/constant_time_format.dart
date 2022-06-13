import 'dart:core';

import 'package:intl/intl.dart';


class DateTimeFormat {
  static const List<String> weekday = ['', '月', '火', '水', '木', '金', '土', '日'];

  static String allDateTime(final DateTime datetime) {
    if (datetime == null) {
      return '';
    }
    final formatter = DateFormat('yyyy/MM/dd (E) HH:mm', "ja_JP");
    return formatter.format(datetime);
  }

  static String dateTime(final DateTime? datetime) {
    if (datetime == null) {
      return '';
    }
    final formatter = DateFormat('MM/dd (E) HH:mm', "ja_JP");
    return formatter.format(datetime);
  }

  static String yearDate(final DateTime datetime) {
    if (datetime == null) {
      return '';
    }
    final formatter = DateFormat('yyyy/MM/dd', "ja_JP");
    return formatter.format(datetime);
  }

  static String yearDateWeekdayJP(final DateTime? datetime) {
    if (datetime == null) {
      return '';
    }
    final formatter = DateFormat('yyyy年M月d日(${weekday[datetime.weekday]})', "ja_JP");
    return formatter.format(datetime);
  }


  static String dateWeekdayJP(final DateTime? datetime) {
    if (datetime == null) {
      return '';
    }
    final formatter = DateFormat('MM月dd日(${weekday[datetime.weekday]})', "ja_JP");
    return formatter.format(datetime);
  }

  static String onlyDate(final DateTime? datetime) {
    if (datetime == null) {
      return '';
    }
    final formatter = DateFormat('MM/dd (E)', "ja_JP");
    return formatter.format(datetime);
  }

  static String onlyTime(final DateTime? datetime) {
    if (datetime == null) {
      return '';
    }
    final formatter = DateFormat('HH:mm', "ja_JP");
    return formatter.format(datetime);
  }

  static String standardDate(final DateTime? datetime) {
    if (datetime == null) {
      return '';
    }
    final formatter = DateFormat('yyyy-MM-dd', "ja_JP");
    return formatter.format(datetime);
  }


}