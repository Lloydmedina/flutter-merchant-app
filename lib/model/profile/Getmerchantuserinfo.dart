// To parse this JSON data, do
//
//     final getmerchantuserinfo = getmerchantuserinfoFromJson(jsonString);

import 'dart:convert';

Getmerchantuserinfo getmerchantuserinfoFromJson(String str) =>
    Getmerchantuserinfo.fromJson(json.decode(str));

String getmerchantuserinfoToJson(Getmerchantuserinfo data) =>
    json.encode(data.toJson());

class Getmerchantuserinfo {
  Getmerchantuserinfo({
    this.resultEnum,
    this.resultMessage,
    this.resultObject,
    this.resultArray,
    this.resultVariable,
  });

  String? resultEnum;
  String? resultMessage;
  ResultObject? resultObject;
  dynamic resultArray;
  dynamic resultVariable;

  factory Getmerchantuserinfo.fromJson(Map<String, dynamic> json) =>
      Getmerchantuserinfo(
        resultEnum: json["resultEnum"],
        resultMessage: json["resultMessage"],
        resultObject: ResultObject.fromJson(json["resultObject"]),
        resultArray: json["resultArray"],
        resultVariable: json["resultVariable"],
      );

  Map<String, dynamic> toJson() => {
        "resultEnum": resultEnum,
        "resultMessage": resultMessage,
        "resultObject": resultObject!.toJson(),
        "resultArray": resultArray,
        "resultVariable": resultVariable,
      };
}

class ResultObject {
  ResultObject({
    this.userId,
    this.merchantId,
    this.mobileNumber,
    this.email,
    this.firstName,
    this.lastName,
    this.roleId,
    this.status,
  });

  String? userId;
  String? merchantId;
  String? mobileNumber;
  String? email;
  String? firstName;
  String? lastName;
  String? roleId;
  String? status;

  factory ResultObject.fromJson(Map<String, dynamic> json) => ResultObject(
        userId: json["userId"],
        merchantId: json["merchantId"],
        mobileNumber: json["mobileNumber"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        roleId: json["roleId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "merchantId": merchantId,
        "mobileNumber": mobileNumber,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "roleId": roleId,
        "status": status,
      };
}
