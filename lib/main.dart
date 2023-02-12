import 'package:flutter/material.dart';
import 'package:sleepwellfrontend/models/User.dart';
import 'package:sleepwellfrontend/rout/routsname.dart';
import 'package:sleepwellfrontend/screen/SignUp/signupScreen.dart';
import 'package:sleepwellfrontend/screen/SignUp/welcomeScreen.dart';
import 'package:sleepwellfrontend/screen/home/homeScreen.dart';
import 'package:sleepwellfrontend/screen/profile/profileScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
                    

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var user = User();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home:HomeScreen(user:user), //Arosha

      home:const WelComeScreen(),     //sasni
      //home:SignUpScreen(),      //sasni

     // home:ProfileScreen(),     //naflan

      debugShowCheckedModeBanner: false,
    );
  }
}

