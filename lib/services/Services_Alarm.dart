import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sleepwellfrontend/models/User.dart';
import 'package:sleepwellfrontend/models/alarm.dart';
import 'package:sleepwellfrontend/models/sleepTimeArr.dart';

class ServiceAlarm{
  static Future<Alarm?> fetchAlarm() async {
    try{
      //var url = "http://10.0.2.2:8000/sleepWell/api/FindAlarmInfo?objectId=$objectId";
      var url = "http://10.0.2.2:8000/sleepWell/api/FindallAlarmsInfo";
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final alarm = alarmFromJson(response.body);
      print(alarm);
      return alarm;
    }catch(e){
      print(e);
      return null;
    }
  }
}
class ServiceSleepArr{
  static Future<SleepArrModel?> fetchSleepArr() async {
    try{
      //var url = "http://10.0.2.2:8000/sleepWell/api/FindAlarmInfo?objectId=$objectId";
      var url = "http://10.0.2.2:8000/sleepWell/api/FindSleepTimes";
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      final alarm = sleepArrFromJson(response.body);
      print(alarm);
      return alarm;
    }catch(e){
      print(e);
      return null;
    }
  }
}
