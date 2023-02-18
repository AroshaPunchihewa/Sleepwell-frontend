import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleepwellfrontend/widget/button.dart';
import 'package:sleepwellfrontend/widget/common_button.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(children: [
          Padding(
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
          ),
          SizedBox(height: 20,),
          
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text("Weekly sleep trends",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_left_sharp),
              Text('jan 2 - jan 8',style: TextStyle(fontSize: 20),),
              Icon(Icons.arrow_right_sharp)
            ],
          ),
          SizedBox(height: 15,),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text("Sleep duration",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                ),
              ],
            ),


            
        ]),
      ),
    );
  }
}