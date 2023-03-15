import 'dart:convert';
import 'dart:ffi';

SleepArrModel? sleepArrFromJson(String str) => SleepArrModel.fromJson(json.decode(str));

class SleepArrModel {
  SleepArrModel({
    
    this.setTime,
    
  });
  
  Array? setTime;
 

  factory SleepArrModel.fromJson(Map<String, dynamic>json)=>SleepArrModel(
    
    setTime: json["startTime"],
   
  );
}