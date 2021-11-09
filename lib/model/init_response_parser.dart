// To parse this JSON data, do
//
//     final initResponseParser = initResponseParserFromJson(jsonString);

import 'dart:convert';

InitResponseParser initResponseParserFromJson(String str) =>
    InitResponseParser.fromJson(json.decode(str));

String initResponseParserToJson(InitResponseParser data) =>
    json.encode(data.toJson());

class InitResponseParser {
  InitResponseParser({
    this.resultEnum,
    this.resultMessage,
  });

  final String? resultEnum;
  final String? resultMessage;

  factory InitResponseParser.fromJson(Map<String, dynamic> json) =>
      InitResponseParser(
        resultEnum: json["resultEnum"] == null ? null : json["resultEnum"],
        resultMessage:
            json["resultMessage"] == null ? null : json["resultMessage"],
      );

  Map<String, dynamic> toJson() => {
        "resultEnum": resultEnum == null ? null : resultEnum,
        "resultMessage": resultMessage == null ? null : resultMessage,
      };
}
