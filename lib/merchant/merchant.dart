// To parse this JSON data, do
//
//     final merchant = merchantFromJson(jsonString);

import 'dart:convert';

Merchant merchantFromJson(String str) => Merchant.fromJson(json.decode(str));

String merchantToJson(Merchant data) => json.encode(data.toJson());

class Merchant {
  Merchant({
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

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
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
