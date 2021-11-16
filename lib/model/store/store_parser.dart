// To parse this JSON data, do
//
//     final merchantStore = merchantStoreFromJson(jsonString);

import 'dart:convert';

MerchantStore merchantStoreFromJson(String str) =>
    MerchantStore.fromJson(json.decode(str));

String merchantStoreToJson(MerchantStore data) => json.encode(data.toJson());

class MerchantStore {
  MerchantStore({
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

  factory MerchantStore.fromJson(Map<String, dynamic> json) => MerchantStore(
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
    this.id,
    this.company,
    this.mainBranchId,
    this.categoryId,
    this.email,
    this.mobileNumber,
    this.firstName,
    this.lastName,
    this.noOfEmployees,
    this.address1,
    this.address2,
    this.barangay,
    this.cityMunicipality,
    this.province,
    this.region,
    this.zipCode,
    this.landMark,
    this.imagePath,
    this.latitude,
    this.longitude,
    this.status,
  });

  String? id;
  String? company;
  dynamic mainBranchId;
  List<dynamic>? categoryId;
  String? email;
  String? mobileNumber;
  String? firstName;
  String? lastName;
  int? noOfEmployees;
  String? address1;
  String? address2;
  String? barangay;
  String? cityMunicipality;
  String? province;
  String? region;
  String? zipCode;
  String? landMark;
  dynamic imagePath;
  int? latitude;
  int? longitude;
  String? status;

  factory ResultObject.fromJson(Map<String, dynamic> json) => ResultObject(
        id: json["id"],
        company: json["company"],
        mainBranchId: json["mainBranchId"],
        categoryId: List<dynamic>.from(json["categoryId"].map((x) => x)),
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        noOfEmployees: json["noOfEmployees"],
        address1: json["address1"],
        address2: json["address2"],
        barangay: json["barangay"],
        cityMunicipality: json["cityMunicipality"],
        province: json["province"],
        region: json["region"],
        zipCode: json["zipCode"],
        landMark: json["landMark"],
        imagePath: json["imagePath"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company": company,
        "mainBranchId": mainBranchId,
        "categoryId": List<dynamic>.from(categoryId!.map((x) => x)),
        "email": email,
        "mobileNumber": mobileNumber,
        "firstName": firstName,
        "lastName": lastName,
        "noOfEmployees": noOfEmployees,
        "address1": address1,
        "address2": address2,
        "barangay": barangay,
        "cityMunicipality": cityMunicipality,
        "province": province,
        "region": region,
        "zipCode": zipCode,
        "landMark": landMark,
        "imagePath": imagePath,
        "latitude": latitude,
        "longitude": longitude,
        "status": status,
      };
}
