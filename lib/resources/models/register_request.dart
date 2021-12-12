import 'dart:convert';

RegisterRequest loginRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String loginRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {

  String userName;
  String companyName;
  String email;
  String userPhone;
  String userPassword;


  RegisterRequest({
    required this.userName,
    required this.companyName,
    required this.email,
    required this.userPhone,
    required this.userPassword,
  });


  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
    userName: json["userName"],
    companyName: json["companyName"],
    email: json["email"],
    userPhone: json["userPhone"],
    userPassword: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "userName": userName,
    "companyName": companyName,
    "email": email,
    "userPhone": userPhone,
    "userPassword": userPassword,
  };


}
