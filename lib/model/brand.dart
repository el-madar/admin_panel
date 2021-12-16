import 'dart:convert';

User userFromJson(String data) => User.fromJson(json.decode(data));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.brandUID,
    this.brandID,
    this.brandName,
    this.brandAddress,
    this.brandPhone
  });

  String? brandUID;
  int? brandID;
  String? brandName;
  String? brandAddress;
  String? brandPhone;


  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      brandUID: json["brandUID"],
      brandID: json["brandID"],
      brandName: json["brandName"],
      brandAddress: json["brandAddress"],
      brandPhone: json["brandPhone"],

    );
  }

  Map<String, dynamic> toJson() => {
    "brandUID": brandUID ??'',
    "brandID": brandID ,
    "brandName": brandName ??'',
    "brandAddress": brandAddress ??'',
    "brandPhone": brandPhone ??'',
  };
}
