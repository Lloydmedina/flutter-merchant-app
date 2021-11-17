// To parse this JSON data, do
//
//     final merchantProfile = merchantProfileFromJson(jsonString);

import 'dart:convert';

MerchantProfile merchantProfileFromJson(String str) =>
    MerchantProfile.fromJson(json.decode(str));

String merchantProfileToJson(MerchantProfile data) =>
    json.encode(data.toJson());

class MerchantProfile {
  MerchantProfile({
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

  factory MerchantProfile.fromJson(Map<String, dynamic> json) =>
      MerchantProfile(
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
