import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:sleepwellfrontend/models/User.dart';
import 'package:sleepwellfrontend/services/Services_User.dart';
import 'package:sleepwellfrontend/widget/button.dart';
import 'package:sleepwellfrontend/widget/summeryBox.dart';

class HomeScreen extends StatefulWidget {
  User user;
   HomeScreen({super.key,required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime now = DateTime.now();
  
  User? user;
  @override
  void initState() {
    // TODO: implement initState
    getVehicleService();
  }

  getVehicleService() async {
    user = (await ServiceUser.fetchUser("003"));
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMEd().format(now);
    String time = DateFormat.jm().format(DateTime.now());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home,color: Colors.black,),
        label: 'Calls',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bar_chart,color: Colors.black,),
        label: 'Camera',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications,color: Colors.black,),
        label: 'Chats',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.emoji_events_rounded,color: Colors.black,),
        label: 'Chats',
      ),
      
    ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: Column(
            children: [
              Column(
                children:[
              Row(
                
                children:[
                  Row(
                    
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text("Good Morning!",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                      ),
                      SizedBox(width: 10,),
                      Text(user!.name.toString(),style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      

                    ]
                  ),
                  const Spacer(),
                  Image.asset("assets/images/propic.jpeg",width: 60,height: 60,),

                ]
              ),
              
             Row(
              children:[
                Column(
                  children:[
              Padding(
                padding: EdgeInsets.only(left:8),
                child: Text(time),
              ),
              
                  ]
                )
              ]
             ),
             Row(
              children:[
                Column(
                  children:[
              
              Padding(
                padding: EdgeInsets.only(left:8),
             child: Text(formattedDate),
              )
                  ]
                )
              ]
             )
                ]
              ),
              SizedBox(height: 30,),
               Text("Next Alarm"),
                Text("06:00 AM",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.alarm,size: 15,),
                    SizedBox(width: 10,),
                     Text("Alarm off"),
                  ],
                ),
                SizedBox(height: 20,),
                CommonButton(
                  icone: Icons.add_circle,
                  buttonText: "Alarm",
                  buttonWidth: 150,
                  buttonHight: 55,
                  backgroundColor: Color.fromARGB(255, 157, 113, 223),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: Text("How do you feel",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon( 
                          Icons.sentiment_satisfied_alt_outlined,
                          color: Colors.black,
                          size: 44,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), 
                          padding: EdgeInsets.all(20),
                        ),
                        
                      ),
                      SizedBox(width: 15,),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon( 
                          Icons.sentiment_dissatisfied ,
                          color: Colors.black,
                          size: 44,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), 
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                      SizedBox(width: 15,),
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon( 
                          Icons.sentiment_dissatisfied_outlined,
                          color: Colors.black,
                          size: 44,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(), 
                          padding: EdgeInsets.all(20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(right: 235),
                    child: Text("Summary",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      children: [
                        SummeryBox(
                          topic: "Sleep Score",
                          info: "100",
                        ),
                        Spacer(),
                        SummeryBox(
                          topic: "Average mood",
                          info: "hi",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Row(
                      children: [
                        SummeryBox(
                          topic: "Sleep duration",
                          info: "9"
                        ),
                        Spacer(),
                        SummeryBox(
                          topic: "Sleep duration",
                          info: "5",
                        ),
                      ],
                    ),
                  ),

            ],

          ),
        )
        ),
    );
  }
}

