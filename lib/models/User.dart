import 'dart:convert';

User? userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  User({
    this.objectId,
    this.name,
    this.age,
    this.password,
  });
  String? objectId;
  String? name;
  String? age;
  String? password;

  factory User.fromJson(Map<String, dynamic>json)=>User(
    objectId: json["objectId"],
    name: json["name"],
    age: json["age"],
    password: json["password"]
  );
}