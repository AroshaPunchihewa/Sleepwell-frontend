import 'package:collection/collection.dart';
import 'package:sleepwellfrontend/models/sleepTimeArr.dart';

class SleepAt{
  SleepArrModel? sleepArrModel;
  final double x;
  final double y;
  SleepAt({required this.x,required this.y});
}
List<SleepAt>get sleepAt{
  final listNew = <double>[7,4,8,9,1,6,9];
  final data = listNew;
  return data.mapIndexed(((index, element) => SleepAt(x: index.toDouble(), y: element) )).toList();
}

class Weakup{
  final double x;
  final double y;
  Weakup({required this.x,required this.y});
}
List<Weakup>get weakup{
  final data = <double>[6,5,8,9,1,6,9];
  return data.mapIndexed(((index, element) => Weakup(x: index.toDouble(), y: element) )).toList();
}