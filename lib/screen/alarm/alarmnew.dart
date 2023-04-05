import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import '../home/homeScreen.dart';


class AlarmNewP extends StatefulWidget {
 final Function myCallback;
const AlarmNewP({super.key, required this.myCallback});

@override
State<AlarmNewP> createState() => _AlarmNewPState();
}

class _AlarmNewPState extends State<AlarmNewP> {
int _selectedIndex = 1;
 final ScrollController _homeController = ScrollController();
// creating text ediiting controller to take hour
// and minute as input
TextEditingController hourController = TextEditingController();
TextEditingController minuteController = TextEditingController();
@override
Widget build(BuildContext context) {
	return Scaffold(
    
	appBar: AppBar(
		title: const Text('SleepWell Alarm'),
		centerTitle: true,
	),
	body: SingleChildScrollView(
      child: Center(
        child: Column(children: <Widget>[
        const SizedBox(height: 90),
    
      Icon(Icons.alarm,size: 200,color: Color.fromRGBO(91, 192, 248, 1),),
     
     const SizedBox(height: 30),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromRGBO(134, 229, 255, 1),
            borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: TextField(
            controller: hourController,
            keyboardType: TextInputType.number,
            ),
          ),
          ),
          const SizedBox(width: 20),
          Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color.fromRGBO(134, 229, 255, 1),
            borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: TextField(
            controller: minuteController,
            keyboardType: TextInputType.number,
            ),
          ),
          ),
        ],
        ),
     SizedBox(height: 20,),
     Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          height: 20,
          width: 70,
          
          child: Center(
            child: Text(
            
            "hours",style: TextStyle(color: Color.fromRGBO(91, 192, 248, 1),fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ),
          ),
          const SizedBox(width: 20),
          Container(
          height: 20,
          width: 70,
          
          child: Center(
            child: Text(
            
            "min",style: TextStyle(color: Color.fromRGBO(91, 192, 248, 1),fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ),
          ),
        ],
        ),
        Container(
        margin: const EdgeInsets.all(25),
        child: ElevatedButton(
          child: const Text(
          'Set alarm',
          style: TextStyle(fontSize: 20.0),
          ),
          onPressed: () {
       widget.myCallback();
  
          int hour;
          int minutes;
          hour = int.parse(hourController.text);
          
          minutes = int.parse(minuteController.text);
          
          // creating alarm after converting hour
          // and minute into integer
          FlutterAlarmClock.createAlarm(hour, minutes);
          },
        ),
        ),
        
        
          
      ])),
    ),
	);
}
}
