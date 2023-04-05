import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:sleepwellfrontend/models/Data.dart';
import 'package:sleepwellfrontend/models/sleepAt.dart';

import 'package:sleepwellfrontend/widget/button.dart';
import 'package:sleepwellfrontend/widget/common_button.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            /*Padding(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 10),
              child: Row(
                
                children: [
                  CommonButtonOnly(buttonText: 'Daily',buttonWidth: 100,textColor: Colors.white,),
                  Spacer(),
                  CommonButtonOnly(buttonText: 'Weekly',buttonWidth: 100,textColor: Colors.white,),
                  Spacer(),
                  CommonButtonOnly(buttonText: 'Monthly',buttonWidth: 100,textColor: Colors.white,)
                ],
              ),
            ),*/
            SizedBox(height: 20,),
            
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left:8.0),
                    child: Text("Weekly sleep trends",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.arrow_left_sharp),
                Text('jan 2 - jan 8',style: TextStyle(fontSize: 20),),
                Icon(Icons.arrow_right_sharp)
              ],
            ),
            SizedBox(height: 15,),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left:8.0),
                    child: Text("Sleep duration",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
             //    BarChartWidget()
             SizedBox(
              height: 250,
              width: 400,
              child: CustomBarChart(
                sleepData: SleepData.data
                )
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left:8.0),
                    child: Text("Sleep at",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              SleepAtLineChartWidget(sleepAtPoint: sleepAt,),
              //SleepAtChart(sleepAtPoint: sleepAt),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left:8.0),
                    child: Text("Weakup at",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              
              SizedBox(height: 10,),
              WeakUpLineChartWidget(sleepAtPoint: weakup,),
             // SleepAtChart(sleepAtPoint: sleepAt),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left:8.0),
                    child: Text("Sleep qulity",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              SleepQuality()
              
          ]),
        ),
      ),
    );
  }
}
class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key,required this.sleepData
  });
  final List<SleepData>sleepData;


  @override
  Widget build(BuildContext context) {
    List<charts.Series<SleepData,String>> series = [
      charts.Series(
        id: 'sleep',
        data: sleepData,
        domainFn:(series,_)=>series.day.toString(),
        measureFn:(series,_)=>series.oders,
        colorFn:(series,_)=>series.barcolor!,
      )
    ];
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
class SleepAtChart extends StatelessWidget {
  final List<SleepAt> sleepAtPoint;
  const SleepAtChart({super.key,required this.sleepAtPoint});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(lineBarsData: [
        LineChartBarData(
          spots: sleepAtPoint.map((sleepAtpoin) => FlSpot(sleepAtpoin.x, sleepAtpoin.y)).toList(),
          isCurved: false,
          dotData: FlDotData(show: true)
        )
      ])),
    );
  }
}

class SleepQuality extends StatefulWidget {
 SleepQuality({super.key});

  @override
  State<SleepQuality> createState() => _SleepQualityState();
}

class _SleepQualityState extends State<SleepQuality> {
  List<Color> gradientColors=[
  const  Color.fromRGBO(91, 192, 248, 1),
    const  Color.fromRGBO(134, 229, 255, 1),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 450,
      child: Container(
        child:LineChart(
          LineChartData(
            maxX:8,
            maxY: 9,
            minX: 0,
            minY: 0,
            lineBarsData: [
              LineChartBarData(
                spots: [
                    FlSpot(0, 0),
                    FlSpot(5, 7),
                    FlSpot(6, 8),
                    FlSpot(7, 5),

                ],
                isCurved: true,
                barWidth: 5,
                belowBarData: BarAreaData(
                  show: true,
                  //color: gradientColors.map((e)=>e.withOpacity(0.3)).toList()
                  color: const  Color.fromRGBO(134, 229, 255, 1),
                )
              )
            ]
          )
        )
      ),
    );
  }
}
/*------------------sleep chart--------------------------------*/

class SleepAtLineChartWidget extends StatelessWidget {
  final List<SleepAt> sleepAtPoint;

  const SleepAtLineChartWidget({super.key,required this.sleepAtPoint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 320,
      child: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: sleepAtPoint.map((sleepAtpoin) => FlSpot(sleepAtpoin.x, sleepAtpoin.y)).toList(),
                 //spots: sleepAtPoint.map((sleepAtpoin) => FlSpot(sleepAtpoin.x, sleepAtpoin.y)).toList(),
                  isCurved: false,
                  dotData: FlDotData(
                    show: false,
                  ),
                  color: Color.fromRGBO(134, 229, 255, 1)
                ),
              ],
              borderData: FlBorderData(
                  border: const Border(bottom: BorderSide(), left: BorderSide())),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
            ),
        ),
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'Mon';
          break;
        case 1:
          text = 'Tue';
          break;
        case 2:
          text = 'Wen';
          break;
        case 3:
          text = 'Thu';
          break;
        case 4:
          text = 'Fri';
          break;
        case 5:
          text = 'Stu';
          break;
        case 6:
          text = 'Sun';
          break;
      }

      return Text(text);
    },
  );
}

/*------------------weakup chart--------------------------------*/

class WeakUpLineChartWidget extends StatelessWidget {
  final List<Weakup> sleepAtPoint;

  const WeakUpLineChartWidget({super.key,required this.sleepAtPoint});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 320,
      child: AspectRatio(
        aspectRatio: 2,
        child: LineChart(
          LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: sleepAtPoint.map((sleepAtpoin) => FlSpot(sleepAtpoin.x, sleepAtpoin.y)).toList(),
                 //spots: sleepAtPoint.map((sleepAtpoin) => FlSpot(sleepAtpoin.x, sleepAtpoin.y)).toList(),
                  isCurved: false,
                  dotData: FlDotData(
                    show: false,
                  ),
                  color: Color.fromRGBO(134, 229, 255, 1)
                ),
              ],
              borderData: FlBorderData(
                  border: const Border(bottom: BorderSide(), left: BorderSide())),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
            ),
        ),
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'Mon';
          break;
        case 1:
          text = 'Tue';
          break;
        case 2:
          text = 'Wen';
          break;
        case 3:
          text = 'Thu';
          break;
        case 4:
          text = 'Fri';
          break;
        case 5:
          text = 'Stu';
          break;
        case 6:
          text = 'Sun';
          break;
      }

      return Text(text);
    },
  );
}