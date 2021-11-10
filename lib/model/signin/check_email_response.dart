// To parse this JSON data, do
//
//     final CheckMobileEmailResponse = CheckMobileEmailResponseFromJson(jsonString);

import 'dart:convert';

CheckEmailResponse CheckEmailResponseFromJson(String str) =>
    CheckEmailResponse.fromJson(json.decode(str));

String CheckEmailResponseToJson(CheckEmailResponse data) =>
    json.encode(data.toJson());

class CheckEmailResponse {
  CheckEmailResponse({
    this.resultEnum,
    this.resultMessage,
  });

  final String? resultEnum;
  final String? resultMessage;

  factory CheckEmailResponse.fromJson(Map<String, dynamic> json) =>
      CheckEmailResponse(
        resultEnum: json["resultEnum"] == null ? null : json["resultEnum"],
        resultMessage:
            json["resultMessage"] == null ? null : json["resultMessage"],
      );

  Map<String, dynamic> toJson() => {
        "resultEnum": resultEnum == null ? null : resultEnum,
        "resultMessage": resultMessage == null ? null : resultMessage,
      };
}
