import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

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
    userName: json["userName"],
    userCity: json["userCity"],
    userEmail: json["userEmail"],
    userPhone: json["userPhone"],
    userDateBirth: json["userDateBirth"],
    token: json["api_token"],
    userRoleName: json["userRoleName"],
  );


  Map<String, dynamic> toJsonUpdate() => {
    "userUID": userUID,
    "userID": userID,
    "userName": userName,
    "userCity": userCity,
    "userEmail": userEmail,
    "userPhone": userPhone,
    "userDateBirth": userDateBirth,
    "api_token": token,
    "userRoleName": userRoleName,
  };

  Map<String, dynamic> toJson() => {
    "userUID": userUID ??'',
    "userID": userID ??'',
    "userName": userName ??'',
    "userCity": userCity ??'',
    "userEmail": userEmail ??'',
    "userPhone": userPhone ??'',
    "userDateBirth": userDateBirth ??'',
    "api_token": token,
    "userRoleName": userRoleName ??'',
  };
}