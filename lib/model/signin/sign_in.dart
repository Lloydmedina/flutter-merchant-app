// To parse this JSON data, do
//
//     final signIn = signInFromJson(jsonString);

import 'dart:convert';

SignIn signInFromJson(String str) => SignIn.fromJson(json.decode(str));

String signInToJson(SignIn data) => json.encode(data.toJson());

class SignIn {
  SignIn({this.email, this.password});

  String? email;
  String? password;
  //bool? socialId;

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
        email: json["mobileEmailSocialId"] == null
            ? null
            : json["mobileEmailSocialId"],
        password: json["password"] == null ? null : json["password"],
        //socialId: json["isSocial"] == null ? null : json["isSocial"],
      );

  Map<String, dynamic> toJson() => {
        "mobileEmailSocialId": email == null ? null : email,
        "password": password == null ? null : password,
        //"isSocial": socialId == null ? null : socialId,
      };
}
