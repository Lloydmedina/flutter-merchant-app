// To parse this JSON data, do
//
//     final riderSharedPrefCredential = riderSharedPrefCredentialFromJson(jsonString);

import 'dart:convert';

MerchantSharedPrefCredential riderSharedPrefCredentialFromJson(String str) =>
    MerchantSharedPrefCredential.fromJson(json.decode(str));

String riderSharedPrefCredentialToJson(MerchantSharedPrefCredential data) =>
    json.encode(data.toJson());

class MerchantSharedPrefCredential {
  MerchantSharedPrefCredential({
    this.accessToken,
    this.refreshToken,
    this.userId,
  });

  final String? accessToken;
  final String? refreshToken;
  final String? userId;

  factory MerchantSharedPrefCredential.fromJson(Map<String, dynamic> json) =>
      MerchantSharedPrefCredential(
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
