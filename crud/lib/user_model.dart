// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
     this.name,
     this.department,
     this.city,
     this.state,
     this.mobile,
     this.image,
     this.dob,
     this.id,
    this.map,
  });

  String? name;
  String? department;
  String? city;
  String? state;
  String? mobile;
  String? image;
  DateTime? dob;
  String? id;
  Map? map;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    department: json["department"],
    city: json["city"],
    state: json["state"],
    mobile: json["mobile"],
    image: json["image"],
    dob: DateTime.parse(json["dob"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "department": department,
    "city": city,
    "state": state,
    "mobile": mobile,
    "image": image,
    "dob": dob.toString(),
    "id": id,
  };
}
