// To parse this JSON data, do
//
//     final emailServicesResponse = emailServicesResponseFromJson(jsonString);

import 'dart:convert';

EmailServicesParser EmailServicesParserFromJson(String str) =>
    EmailServicesParser.fromJson(json.decode(str));

String EmailServicesParserToJson(EmailServicesParser data) =>
    json.encode(data.toJson());

class EmailServicesParser {
  EmailServicesParser({
    this.receipientEmail,
    this.receipientName,
    this.subject,
    this.header,
    this.body,
    this.linkUrl,
  });

  String? receipientEmail;
  String? receipientName;
  String? subject;
  String? header;
  String? body;
  String? linkUrl;

  factory EmailServicesParser.fromJson(Map<String, dynamic> json) =>
      EmailServicesParser(
        receipientEmail:
            json["receipientEmail"] == null ? null : json["receipientEmail"],
        receipientName:
            json["receipientName"] == null ? null : json["receipientName"],
        subject: json["subject"] == null ? null : json["subject"],
        header: json["header"] == null ? null : json["header"],
        body: json["body"] == null ? null : json["body"],
        linkUrl: json["linkUrl"] == null ? null : json["linkUrl"],
      );

  Map<String, dynamic> toJson() => {
        "receipientEmail": receipientEmail == null ? null : receipientEmail,
        "receipientName": receipientName == null ? null : receipientName,
        "subject": subject == null ? null : subject,
        "header": header == null ? null : header,
        "body": body == null ? null : body,
        "linkUrl": linkUrl == null ? null : linkUrl,
      };
}
