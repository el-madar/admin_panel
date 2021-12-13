import 'dart:convert';

User userFromJson(String data) => User.fromJson(json.decode(data));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userUID,
    this.userID,
    this.userName,
    this.userEmail,
    this.userCity,
    this.userPhone,
    this.userDateBirth,
    this.userRoleName,
    this.token
  });

  String? userUID;
  int? userID;
  String? userName;
  String? userCity;
  String? userEmail;
  String? userPhone;
  String? userDateBirth;
  String? userRoleName;
  String? token;


  factory User.fromJson(Map<String, dynamic> json) => User(
    userUID: json["userUID"],
    userID: json["userID"],
    userName: json["name"],
    userCity: json["userCity"],
    userEmail: json["email"],
    userPhone: json["userPhone"],
    userDateBirth: json["userDateBirth"],
    token: json["api_token"],
    userRoleName: json["userRoleName"],
  );


  Map<String, dynamic> toJsonUpdate() => {
    "userUID": userUID,
    "userID": userID,
    "name": userName,
    "userCity": userCity,
    "email": userEmail,
    "userPhone": userPhone,
    "userDateBirth": userDateBirth,
    "api_token": token,
    "userRoleName": userRoleName,
  };

  Map<String, dynamic> toJson() => {
    "userUID": userUID ??'',
    "userID": userID ??'',
    "name": userName ??'',
    "userCity": userCity ??'',
    "email": userEmail ??'',
    "userPhone": userPhone ??'',
    "userDateBirth": userDateBirth ??'',
    "api_token": token,
    "userRoleName": userRoleName ??'',
  };
}
