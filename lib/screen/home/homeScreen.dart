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
import 'package:sleepwellfrontend/screen/alarm/alarmnew.dart';
import 'package:sleepwellfrontend/services/Services_Predict.dart';
import 'package:sleepwellfrontend/services/Services_User.dart';
import 'package:sleepwellfrontend/widget/button.dart';
import 'package:sleepwellfrontend/widget/summeryBox.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  //User user;
  // HomeScreen({super.key,required this.user});
   const HomeScreen({super.key});
   

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

  int awakeTime = 0;
  int lightTime = 0;
  int deepTime = 0;
  int deepTimeMin=0;
  int lightTimeMin=0;
  int awakeTimeMin=0;



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
      // print(noiseReading.toString());
       //print(noicePass.toString());

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
//print(myArray);

printMA=myArray;

}
List<List<int>> array2D = [];
void btnStart(){
  print("MEKA WEDA MACHNG");
  deepTime = 0;
  awakeTime =0;
  lightTime =0;
  deepTimeMin=0;
  lightTimeMin=0;
  awakeTimeMin=0;
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
  List<String> stringList = jsonData.cast<String>().toList();

  
  for (int i=0;i<stringList.length;i++){
  if (stringList[i]=="LIGHT SLEEP") {
    lightTime +=5;
  } else if(stringList[i]=="DEEP SLEEP"){
     deepTime +=5;
  }else if(stringList[i]=="AWAKE"){
     awakeTime +=5;
  }
  
}

deepTimeMin=deepTime~/60;
print(deepTime);
lightTimeMin=lightTime~/60;
awakeTimeMin=awakeTime~/60;
  // Print the response data
  //print(jsonData);
  return (stringList);
  // Print the response data
  
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
  
 int _selectedIndex = 0;
 final ScrollController _homeController = ScrollController();

  
  @override
  Widget build(BuildContext context) {
        DateTime now = DateTime.now();
        var timeNow = int.parse(DateFormat('kk').format(now));
        late String greetingMessage = '';
        if((timeNow < 10) && (timeNow>4)){
             greetingMessage="Good Morning";
        }else if((timeNow>=10) && (timeNow<18)){
             greetingMessage="Good Afternoon";
        }else if((timeNow<=22) && (timeNow>18)){
             greetingMessage="Good Night";
        }  
        
        
    


    final userAccelerometer = _userAccelerometerValues //--
        ?.map((double v) => v.toStringAsFixed(1)) //--
        .toList();
    String formattedDate = DateFormat.yMMMEd().format(now);
    String time = DateFormat.jm().format(DateTime.now());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Alarm',
          ),
        ],
        currentIndex: _selectedIndex,
       // selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          switch (index) {
            case 0:
              // only scroll to top when current index is selected.
              if (_selectedIndex == index) {
                _homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
            case 1:
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  AlarmNewP(myCallback: btnStart,)),
            );
              break;
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    
      body: SingleChildScrollView(
        child: GestureDetector(
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
            
              
              child: Column(
                
                children: [
                  
                  SizedBox(height: 30,),
                  
                  
                  Padding(
                            padding: EdgeInsets.only(left: 8),
                            
                            child: Text("$greetingMessage",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Column(
                      children:[
                  
                    Text(time),
                 
                  
                      ]
                    )
                  ]
                 ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Column(
                      children:[
                  
                 // Padding(
                   // padding: EdgeInsets.only(left:8),
                 Text(formattedDate),
                 // )
                      ]
                    )
                  ]
                 ),
                    

                SizedBox(height: 20,),
                CommonButton(
                      
                      onTap: (){ 
                        btnStart();
           },
                      icone: Icons.add_circle,
                      buttonText: "Start Sleep Tracking",
                      buttonWidth: 250,
                      buttonHight: 55,
                      backgroundColor: Color.fromRGBO(255, 201, 60, 1),
                      ),
                      SizedBox(height: 20,),
                      CommonButton(
                      
                      onTap: ()async {
                               List<String> stringList=await sendRequest(array2D);
                               //print(array2D);
                               //print(stringList);
                              String string = stringList.join(', ');
                              //showDialog(context: context, builder: (context)=>AlertDialog(content: Text("hihih"+string),));
                              showDialog(context: context, builder: (context)=>AlertDialog(content: Text("hihih"+stringList.toString()),));
                            btnStop();},
                      icone: Icons.stop,
                      buttonText: "Stop Sleep Tracking",
                      buttonWidth: 250,
                      buttonHight: 55,
                      backgroundColor: Color.fromRGBO(255, 122, 60, 1),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 10),),
                         Text("How do you feel",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ]
                      ),
                      SizedBox(height: 20,),
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
                               //print(array2D);
                               //print(stringList);
                              String string = stringList.join(', ');
                              //showDialog(context: context, builder: (context)=>AlertDialog(content: Text("hihih"+string),));
                              showDialog(context: context, builder: (context)=>AlertDialog(content: Text("hihih"+stringList.toString()),));
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
                      SizedBox(height: 40,),
                      
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 10),),
                         //Text("$array2D",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                         Text("Sleep Type and Time Duration",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ]
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25),
                        child: Row(
                          children: [
                            SummeryBox(
                              topic: "Light Sleep (min)",
                             // info: "$ligthpass",
                             info: "$lightTimeMin",
                            ),
                            Spacer(),
                            SummeryBox(
                              topic: "Deep Sleep (min)",
                              info: "$deepTimeMin",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 25,right: 25),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SummeryBox(
                              topic: "Awake (min)",
                             // info: "$noicePass",
                             info: "$awakeTimeMin",
                            ),
                           
                          ],
                        ),
                      ),
        
                ],
        
              ),
            
            ),
        ),
      ),
    );
  }
  
}

