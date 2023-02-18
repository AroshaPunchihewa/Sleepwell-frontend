import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleepwellfrontend/data/barData.dart';

class BarChartWidget extends StatelessWidget {
  final double barWidth = 12;
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) => BarChart(
     BarChartData(
      maxY: 12,
      minY: 0,
      groupsSpace: 12,
      barTouchData: BarTouchData(enabled: true),
      barGroups: BarData.barData.map((data)=>BarChartGroupData(
        x: data.id,
        barRods: [
          BarChartRodData(toY: data.y,)
        ]
      ),
     ),
     )
  );
}