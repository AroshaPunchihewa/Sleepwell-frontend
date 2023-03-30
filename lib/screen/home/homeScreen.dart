import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:light/light.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sleepwellfrontend/models/User.dart';
import 'package:sleepwellfrontend/rout/routsname.dart';
import 'package:sleepwellfrontend/screen/alarm/alarmScreen.dart';
import 'package:sleepwellfrontend/services/Services_Predict.dart';
import 'package:sleepwellfrontend/services/Services_User.dart';
import 'package:sleepwellfrontend/widget/button.dart';
import 'package:sleepwellfrontend/widget/summeryBox.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  //User user;
  // HomeScreen({super.key,required this.user});
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<double>? _userAccelerometerValues;
  late double _userAccelerometerValuesY;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
    StreamSubscription<NoiseReading>? _noiseSubscription;
   late int noiseReadingInt;
      bool _isRecording = false;
        late NoiseMeter _noiseMeter;
         int _tappedValue=0;

         int minth = 0;
         bool isTimerRunning = false;
Timer? timer;



  List<List<int>> myArray = List.generate(100, (_) => List.filled(4, 0));


  String _noiceString = 'Unknown';
  var printMA;


  //----------light sens-------------------
  String _luxString = 'Unknown';
  late Light _light;
  late StreamSubscription _subscription;
  late int ligthpass=1;
  late int noicePass=1;
  late int _userAccelerometerValuesYPass=1;
 
  void onData(int luxValue) async {
    Timer.periodic(Duration(), (timer) async {
    
    print("Lux value: $luxValue");
    setState(() {
      if(luxValue>=100){
        ligthpass = 3;
      }else if(luxValue>=50&&luxValue<100){
        ligthpass = 2;
      }else{
        ligthpass = 1;
      }
      _luxString="$luxValue";
      
      
      
    });
     // _luxString = "$luxValue";

    });
  }
  void onDataNoice(NoiseReading noiseReading) async {
    Timer.periodic(Duration(), (timer) async {
    
    
    setState(() {
      
      if (!this._isRecording) {
        this._isRecording = true;
      }
    //  noiseReadingInt = noiseReading.meanDecibel.toDouble().toInt();
      if (noiseReading.meanDecibel.isNaN || noiseReading.meanDecibel.isInfinite) {
  // Set a default value if meanDecibel is not a valid number
  noiseReadingInt = 0;
} else {
  noiseReadingInt = noiseReading.meanDecibel.toInt();
}
       if(noiseReadingInt>=100){
        noicePass = 3;
      }else if(noiseReadingInt>=50&&noiseReadingInt<100){
        noicePass = 2;
      }else{
        noicePass = 1;
      }
       print(noiseReading.toString());
       print(noicePass.toString());

     _noiceString = noiseReading.meanDecibel.toString();
      
    });
     // _luxString = "$luxValue";

    });
  }


  void stopListening() {
    _subscription.cancel();
  }

  void startListening() {
    _light = new Light();
    try {
      _subscription = _light.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
      print(exception);
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    startListening();
  }
  //------------end of light sens----------------
  
  DateTime now = DateTime.now();
  
  User? user;

  @override
  void dispose() {
    super.dispose();
    _noiseSubscription?.cancel();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  

  

  void onError(Object error) {
    print(error.toString());
    _isRecording = false;
  }

  void start() async {
    try {
      _noiseSubscription = _noiseMeter.noiseStream.listen(onDataNoice);
    } catch (err) {
      print(err);
    }
  }
  @override
void passArray(int arrlight,int arrAcc,int arrNoice,int arrTap,int minth){
  List<List<int>> myArray = List.generate(minth+1, (_) => List.filled(4, 0));

    
      myArray[minth][0] = arrlight;
    
      myArray[minth][1] = arrAcc;
   
      myArray[minth][2] = arrNoice;
      myArray[minth][3] = arrTap;
    
  


// Print the array
print(myArray);

printMA=myArray;

}
List<List<int>> array2D = [];
@override
void btnStart(){
  array2D.clear();
  isTimerRunning = true;
  timer=Timer.periodic(Duration(seconds: 5), (timer) {

      setState(() {
        minth++;
              passArray(ligthpass,_userAccelerometerValuesYPass,noicePass,_tappedValue,minth);
              List<int> data = [ligthpass,_userAccelerometerValuesYPass,noicePass,_tappedValue];
              array2D.add(data);

      });
    });
}
void btnStop() {
  if (timer != null) {
    timer!.cancel();
    isTimerRunning = false;
  }
}
Future<List<String>> sendRequest(List<List<int>> data) async {
  final url = Uri.parse('http://10.0.2.2:5000/predict');

  // Define the request body as a list of lists
  final body = data;

  // Define the headers for the request
  final headers = {'Content-Type': 'application/json'};

  // Make the API call

  final response = await http.post(url, headers: headers, body: jsonEncode(body));

  // Get the response data as a JSON object
  final jsonData = jsonDecode(response.body);

  // Print the response data
  print(jsonData);
  return (jsonData);
}

  @override
  void initState() {
    // Timer.periodic(Duration(seconds: 5), (timer) {

    //   setState(() {
    //     minth++;
    //           passArray(ligthpass,_userAccelerometerValuesYPass,noicePass,_tappedValue,minth);
    //           List<int> data = [ligthpass,_userAccelerometerValuesYPass,noicePass,_tappedValue];
    //           array2D.add(data);

    //   });
    // });
    _noiseMeter = new NoiseMeter(onError);
    start();
    // TODO: implement initState
   // getVehicleService();
    initPlatformState();
    _streamSubscriptions.add(
      userAccelerometerEvents.listen(
        (UserAccelerometerEvent event) {
          setState(() {
            _userAccelerometerValues = <double>[event.x, event.y, event.z];
            _userAccelerometerValuesY = event.y;
            if(_userAccelerometerValuesY>=1.000||_userAccelerometerValuesY<=-1.000){
        _userAccelerometerValuesYPass = 3;
      }else if(_userAccelerometerValuesY>=0.200||_userAccelerometerValuesY<=-0.200){
        _userAccelerometerValuesYPass = 2;
      }else{
        _userAccelerometerValuesYPass = 1;
      }
            
          });
        },
      ),
    );
  }
  


  // getVehicleService() async {
  //   user = (await ServiceUser.fetchUser("005"));
  //   setState(() {});
  // }
  @override
  Widget build(BuildContext context) {


    final userAccelerometer = _userAccelerometerValues //--
        ?.map((double v) => v.toStringAsFixed(1)) //--
        .toList();
    String formattedDate = DateFormat.yMMMEd().format(now);
    String time = DateFormat.jm().format(DateTime.now());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home,color: Colors.black,),
        label: 'home',
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
      body: GestureDetector(
        onTapDown: (_) {
        setState(() {
          _tappedValue = 1;
        });
      },
      onTapCancel: () {
        setState(() {
          _tappedValue = 0;
        });
      },
      onTapUp: (_) {
        setState(() {
          _tappedValue = 0;
        });
      },
        child: SafeArea(
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
                        //Text(user!.name.toString(),style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                        
      
                      ]
                    ),
                    const Spacer(),
                    CircleAvatar(
                      child:ClipOval(
                      child: Image.asset("assets/images/propic.jpeg",width: 60,height: 60,fit: BoxFit.cover,)
                      ),
                    )
      
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
                    onTap: (){NavigationServices(context).gotoAlarmScreen();},
                    icone: Icons.add_circle,
                    buttonText: "Alarm",
                    buttonWidth: 150,
                    buttonHight: 55,
                    backgroundColor: Color.fromRGBO(255, 201, 60, 1),
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
                          onPressed: btnStart,
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
                          onPressed: btnStop,
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
                          //onPressed: ()  {print("wada oiiiiii");},
                          onPressed: ()async {
                             List<String> stringList=await sendRequest(array2D);
                            String string = stringList.join(', ');
                            showDialog(context: context, builder: (context)=>AlertDialog(content: Text("hihih"+string),));
                          },
                          child: Icon( 
                            Icons.close,
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
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 235),
                    //   child: Text("Summary",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    // ),
                     Padding(
                      padding: const EdgeInsets.only(right: 235),
                      child: Text("$array2D",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      child: Row(
                        children: [
                          SummeryBox(
                            topic: "light",
                            info: "$ligthpass",
                          ),
                          Spacer(),
                          SummeryBox(
                            topic: "acceloro",
                            info: "$_userAccelerometerValuesYPass",
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
                            topic: "Noice",
                            info: "$noicePass",
                          ),
                          Spacer(),
                          SummeryBox(
                            topic: "taps",
                            info: "$_tappedValue",
                          ),
                        ],
                      ),
                    ),
      
              ],
      
            ),
          )
          ),
      ),
    );
  }
}

