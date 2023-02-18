import 'dart:convert';

Alarm? alarmFromJson(String str) => Alarm.fromJson(json.decode(str));

class Alarm {
  Alarm({
    this.objectId,
    this.name,
    this.setTime,
    this.endTime,
    this.setDate,
    this.endDate,
  });
  String? objectId;
  String? name;
  String? setTime;
  String? endTime;
  String? setDate;
  String? endDate;

  factory Alarm.fromJson(Map<String, dynamic>json)=>Alarm(
    objectId: json["objectId"],
    name: json["name"],
    setTime: json["setTime"],
    endDate: json["endTime"],
    setDate: json["setDate"],
    endTime: json["endDate"]
  );
}
