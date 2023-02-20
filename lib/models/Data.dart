import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SleepData {
  final DateTime dateTime;
  final String day;
  final int oders;
 charts.Color? barcolor;

  SleepData({
    required this.dateTime,
    required this.day,
    required this.oders,
    this.barcolor,
  }){
    barcolor = charts.ColorUtil.fromDartColor(Color.fromRGBO(134, 229, 255, 1));
  }
  static final List<SleepData> data=[
    SleepData(
      dateTime: DateTime.now(),
      day: "Mon",
      oders: 10,
    ),
    SleepData(
      dateTime: DateTime.now(),
      day: "Tue",
      oders: 4,
    ),
    SleepData(
      dateTime: DateTime.now(),
      day: "Wen",
      oders: 7,
    ),
    SleepData(
      dateTime: DateTime.now(),
      day: "Thu",
      oders: 2,
    ),
    SleepData(
      dateTime: DateTime.now(),
      day: "Fri",
      oders: 9,
    ),
    SleepData(
      dateTime: DateTime.now(),
      day: "Stu",
      oders: 9,
    ),
    SleepData(
      dateTime: DateTime.now(),
      day: "Sun",
      oders: 9,
    ),
  ];
}
