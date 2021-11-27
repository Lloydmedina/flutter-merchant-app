// To parse this JSON data, do
//
//     final merchantStore = merchantStoreFromJson(jsonString);

import 'dart:convert';

MerchantStoreInfo merchantStoreFromJson(String str) =>
    MerchantStoreInfo.fromJson(json.decode(str));

String merchantStoreInfoToJson(MerchantStoreInfo data) =>
    json.encode(data.toJson());

class MerchantStoreInfo {
  MerchantStoreInfo({
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
    //  this.latitude,
    //  this.longitude,
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
  //double? latitude = 0;
  // double? longitude = 0;
  String? status;

  factory MerchantStoreInfo.fromJson(Map<String, dynamic> json) =>
      MerchantStoreInfo(
        id: json["id"] == null ? null : json["id"],
        company: json["company"] == null ? null : json["company"],
        mainBranchId: json["mainBranchId"],
        categoryId: json["categoryId"] == null
            ? null
            : List<dynamic>.from(json["categoryId"].map((x) => x)),
        email: json["email"] == null ? null : json["email"],
        mobileNumber:
            json["mobileNumber"] == null ? null : json["mobileNumber"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        noOfEmployees:
            json["noOfEmployees"] == null ? null : json["noOfEmployees"],
        address1: json["address1"] == null ? null : json["address1"],
        address2: json["address2"] == null ? null : json["address2"],
        barangay: json["barangay"] == null ? null : json["barangay"],
        cityMunicipality:
            json["cityMunicipality"] == null ? null : json["cityMunicipality"],
        province: json["province"] == null ? null : json["province"],
        region: json["region"] == null ? null : json["region"],
        zipCode: json["zipCode"] == null ? null : json["zipCode"],
        landMark: json["landMark"] == null ? null : json["landMark"],
        imagePath: json["imagePath"],
        // latitude: json["latitude"] == null ? null : json["latitude"],
        // longitude: json["longitude"] == null ? null : json["longitude"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "company": company == null ? null : company,
        "mainBranchId": mainBranchId,
        "categoryId": categoryId == null
            ? null
            : List<dynamic>.from(categoryId!.map((x) => x)),
        "email": email == null ? null : email,
        "mobileNumber": mobileNumber == null ? null : mobileNumber,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "noOfEmployees": noOfEmployees == null ? null : noOfEmployees,
        "address1": address1 == null ? null : address1,
        "address2": address2 == null ? null : address2,
        "barangay": barangay == null ? null : barangay,
        "cityMunicipality": cityMunicipality == null ? null : cityMunicipality,
        "province": province == null ? null : province,
        "region": region == null ? null : region,
        "zipCode": zipCode == null ? null : zipCode,
        "landMark": landMark == null ? null : landMark,
        "imagePath": imagePath,
        // "latitude": latitude == null ? null : latitude,
        // "longitude": longitude == null ? null : longitude,
        "status": status == null ? null : status,
      };
}
