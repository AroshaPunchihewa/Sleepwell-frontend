import 'package:collection/collection.dart';

class SleepAt{
  final double x;
  final double y;
  SleepAt({required this.x,required this.y});
}
List<SleepAt>get sleepAt{
  final data = <double>[2,5,8,9,1,6,9];
  return data.mapIndexed(((index, element) => SleepAt(x: index.toDouble(), y: element) )).toList();
}