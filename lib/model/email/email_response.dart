// To parse this JSON data, do
//
//     final emailServicesResponse = emailServicesResponseFromJson(jsonString);

import 'dart:convert';

EmailServicesResponse emailServicesResponseFromJson(String str) =>
    EmailServicesResponse.fromJson(json.decode(str));

String emailServicesResponseToJson(EmailServicesResponse data) =>
    json.encode(data.toJson());

class EmailServicesResponse {
  EmailServicesResponse({
    this.resultEnum,
    this.resultMessage,
    this.resultObject,
    this.resultArray,
    this.resultVariable,
  });

  String? resultEnum;
  String? resultMessage;
  String? resultObject;
  dynamic resultArray;
  dynamic resultVariable;

  factory EmailServicesResponse.fromJson(Map<String, dynamic> json) =>
      EmailServicesResponse(
        resultEnum: json["resultEnum"] == null ? null : json["resultEnum"],
        resultMessage:
            json["resultMessage"] == null ? null : json["resultMessage"],
        resultObject:
            json["resultObject"] == null ? null : json["resultObject"],
        resultArray: json["resultArray"],
        resultVariable: json["resultVariable"],
      );

  Map<String, dynamic> toJson() => {
        "resultEnum": resultEnum == null ? null : resultEnum,
        "resultMessage": resultMessage == null ? null : resultMessage,
        "resultObject": resultObject == null ? null : resultObject,
        "resultArray": resultArray,
        "resultVariable": resultVariable,
      };
}
