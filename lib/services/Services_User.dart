import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sleepwellfrontend/models/User.dart';

class ServiceUser{
  static Future<User?> fetchUser(String objectId) async {
    try{
      var url = "http://localhost:8000/sleepWell/api/FindUserInfo?objectId=$objectId";
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final user = userFromJson(response.body);
      print(user);
      return user;
    }catch(e){
      print(e);
      return null;
    }
  }
}