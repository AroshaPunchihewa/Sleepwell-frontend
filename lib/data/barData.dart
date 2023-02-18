import 'package:flutter/material.dart';
import 'package:sleepwellfrontend/models/Data.dart';

class BarData{
  static int interval=5;
  static List<Data> barData=[
    Data(
      id:0,
      name:'Mon',
      y:12,
      color: Color.fromRGBO(91, 192, 248, 1),
    ),
    Data(
      id:1,
      name:'Tus',
      y:6,
      color: Color.fromRGBO(91, 192, 248, 1),
    ),
    Data(
      id:2,
      name:'Wen',
      y:9,
      color: Color.fromRGBO(91, 192, 248, 1),
    ),
    Data(
      id:3,
      name:'Thur',
      y:3,
      color: Color.fromRGBO(91, 192, 248, 1),
    ),
    Data(
      id:4,
      name:'Fri',
      y:8,
      color: Color.fromRGBO(91, 192, 248, 1),
    ),
    Data(
      id:5,
      name:'Stu',
      y:12,
      color: Color.fromRGBO(91, 192, 248, 1),
    ),
    Data(
      id:6,
      name:'Sun',
      y:10,
      color: Color.fromRGBO(91, 192, 248, 1),
    ),
    
  ];
}