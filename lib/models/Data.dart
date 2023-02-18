import 'package:flutter/material.dart';

class Data {
  final int? id;
  final String? name;
  final double? y;
  final Color? color;

  const Data({
    @required this.name,
    @required this.id,
    @required this.y,
    @required this.color,
  });
}