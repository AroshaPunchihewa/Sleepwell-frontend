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
    // bottomNavigationBar: BottomNavigationBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.alarm),
    //         label: 'Alarm',
    //       ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     //selectedItemColor: Colors.amber[800],
    //     onTap: (int index) {
    //       switch (index) {
    //         case 0:
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) =>  HomeScreen()),);
    //           // only scroll to top when current index is selected.
    //           if (_selectedIndex == index) {
    //             _homeController.animateTo(
    //               0.0,
    //               duration: const Duration(milliseconds: 500),
    //               curve: Curves.easeOut,
    //             );
    //           }
    //           break;
    //         case 1:
    //           Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) =>  HomeScreen()),);
    //           break;
    //       }
    //       setState(
    //         () {
    //           _selectedIndex = index;
    //         },
    //       );
    //     },
    //   ),
	appBar: AppBar(
		title: const Text('SleepWell Alarm'),
		centerTitle: true,
	),
	body: SingleChildScrollView(
      child: Center(
        child: Column(children: <Widget>[
        const SizedBox(height: 90),
     Image.asset("assets/images/Untitled-1.png",width: 200,height: 200,),
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
        // ElevatedButton(
        // onPressed: () {
          
        // 	// show alarm
        // 	FlutterAlarmClock.showAlarms();
        // },
        // child: const Text(
        // 	'Show Alarms',
        // 	style: TextStyle(fontSize: 20.0),
        // ),
        // ),
        // Container(
        // margin: const EdgeInsets.all(25),
        // child: TextButton(
        // 	child: const Text(
        // 		'Create timer',
        // 		style: TextStyle(fontSize: 20.0),
        // 	),
        // 	onPressed: () {
        // 		int minutes;
        // 		minutes = int.parse(minuteController.text);
            
        // 		// create timer
        // 		FlutterAlarmClock.createTimer(minutes);
        // 		showDialog(
        // 			context: context,
        // 			builder: (context) {
        // 			return const AboutDialog(
        // 				children: [
        // 				Center(
        // 					child: Text("Timer is set",
        // 						style: TextStyle(
        // 							fontSize: 20, fontWeight: FontWeight.bold)),
        // 				)
        // 				],
        // 			);
        // 			});
        // 	}),
        // ),
        // ElevatedButton(
        // onPressed: () {
          
        // 	// show timers
        // 	FlutterAlarmClock.showTimers();
        // },
        // child: const Text(
        // 	"Show Timers",
        // 	style: TextStyle(fontSize: 17),
        // ),
        // )
      ])),
    ),
	);
}
}
