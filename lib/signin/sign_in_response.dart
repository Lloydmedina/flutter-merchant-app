// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromJson(jsonString);

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromJson(json.decode(str));

String signInResponseToJson(SignInResponse data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    this.resultEnum,
    this.resultMessage,
    this.resultObject,
    this.resultArray,
    this.resultVariable,
  });

  final String? resultEnum;
  final String? resultMessage;
  final ResultObject? resultObject;
  final dynamic resultArray;
  final dynamic resultVariable;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        resultEnum: json["resultEnum"] == null ? null : json["resultEnum"],
        resultMessage:
            json["resultMessage"] == null ? null : json["resultMessage"],
        resultObject: json["resultObject"] == null
            ? null
            : ResultObject.fromJson(json["resultObject"]),
        resultArray: json["resultArray"],
        resultVariable: json["resultVariable"],
      );

  Map<String, dynamic> toJson() => {
        "resultEnum": resultEnum == null ? null : resultEnum,
        "resultMessage": resultMessage == null ? null : resultMessage,
        "resultObject": resultObject == null ? null : resultObject?.toJson(),
        "resultArray": resultArray,
        "resultVariable": resultVariable,
      };
}

Future<void> saveToLocalStorage(String key, String value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(key, value);
}

class ResultObject {
  ResultObject({
    this.accessToken,
    this.refreshToken,
    this.userId,
  });

  final String? accessToken;
  final String? refreshToken;
  final String? userId;

  factory ResultObject.fromJson(Map<String, dynamic> json) => ResultObject(
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
        refreshToken:
            json["refreshToken"] == null ? null : json["refreshToken"],
        userId: json["userId"] == null ? null : json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken == null ? null : accessToken,
        "refreshToken": refreshToken == null ? null : refreshToken,
        "userId": userId == null ? null : userId,
      };
}
