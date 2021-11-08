// To parse this JSON data, do
//
//     final signIn = signInFromJson(jsonString);

import 'dart:convert';

SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn data) => json.encode(data.toJson());

class SignIn {
  SignIn({
    this.mobileNumber,
    this.password,
  });

  String? mobileNumber;
  String? password;

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        mobileNumber:
            json["mobileNumber"] == null ? null : json["mobileNumber"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber == null ? null : mobileNumber,
        "password": password == null ? null : password,
      };
}
