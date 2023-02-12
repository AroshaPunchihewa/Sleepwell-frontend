import 'package:flutter/material.dart';
import 'package:sleepwellfrontend/models/User.dart';
import 'package:sleepwellfrontend/screen/home/homeScreen.dart';

class NavigationServices {
  NavigationServices(this.context);

  final BuildContext context;

  Future<dynamic> _pushMaterialPageRoute(Widget widget,
      {bool fullscreenDialog = false}) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget, fullscreenDialog: fullscreenDialog),
    );
  }

  Future<dynamic> gotoHomeScreen(User user) async {
    return await _pushMaterialPageRoute(HomeScreen(user: user,));
  }
}