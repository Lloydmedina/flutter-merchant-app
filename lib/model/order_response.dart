// To parse this JSON data, do
//
//     final bookingResponse = bookingResponseFromJson(jsonString);

import 'dart:convert';

BookingResponse bookingResponseFromJson(String str) =>
    BookingResponse.fromJson(json.decode(str));

String bookingResponseToJson(BookingResponse data) =>
    json.encode(data.toJson());

class BookingResponse {
  BookingResponse(
      {this.bookingId,
      this.bookingReference,
      this.bookingDate,
      this.status,
      this.remarks,
      this.isExpired,
      this.orders,
      this.merchant,
      this.rider,
      this.consumer});

  String? bookingId;
  String? bookingReference;
  DateTime? bookingDate;
  String? status;
  String? remarks;
  bool? isExpired;
  List<Order>? orders;
  Merchant? merchant;
  Rider? rider;
  Consumer? consumer;

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      BookingResponse(
        bookingId: json["bookingId"] == null ? null : json["bookingId"],
        bookingReference:
            json["bookingReference"] == null ? null : json["bookingReference"],
        bookingDate: json["bookingDate"] == null
            ? null
            : DateTime.parse(json["bookingDate"]),
        status: json["status"] == null ? null : json["status"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        isExpired: json["isExpired"] == null ? null : json["isExpired"],
        orders: json["orders"] == null
            ? null
            : List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        merchant: json["merchant"] == null
            ? null
            : Merchant.fromJson(json["merchant"]),
        rider: json["rider"] == null ? null : Rider.fromJson(json["rider"]),
        consumer: json["consumer"] == null
            ? null
            : Consumer.fromJson(json["consumer"]),
      );

  Map<String, dynamic> toJson() => {
        "bookingId": bookingId == null ? null : bookingId,
        "bookingReference": bookingReference == null ? null : bookingReference,
        "bookingDate":
            bookingDate == null ? null : bookingDate!.toIso8601String(),
        "status": status == null ? null : status,
        "remarks": remarks == null ? null : remarks,
        "isExpired": isExpired == null ? null : isExpired,
        // "orders": orders == null
        //     ? null
        //     : List<dynamic>.from(orders!.map((x) => x.toJson())),
        "merchant": merchant == null ? null : merchant!.toJson(),
        "rider": rider == null ? null : rider!.toJson(),
        "consumer": consumer == null ? null : consumer!.toJson(),
      };
}

class Merchant {
  Merchant({
    this.id,
    this.name,
    this.address,
    this.longitude,
    this.latitude,
  });

  String? id;
  String? name;
  String? address;
  String? longitude;
  String? latitude;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        address: json["address"] == null ? null : json["address"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        latitude: json["latitude"] == null ? null : json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "address": address == null ? null : address,
        "longitude": longitude == null ? null : longitude,
        "latitude": latitude == null ? null : latitude,
      };
}

class Order {
  Order({
    this.productId,
    this.description,
    this.qty,
    this.amount,
  });

  String? productId;
  String? description;
  String? qty;
  String? amount;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        productId: json["productId"] == null ? null : json["productId"],
        description: json["description"] == null ? null : json["description"],
        qty: json["qty"] == null ? null : json["qty"],
        amount: json["amount"] == null ? null : json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId == null ? null : productId,
        "description": description == null ? null : description,
        "qty": qty == null ? null : qty,
        "amount": amount == null ? null : amount,
      };
}

class Rider {
  Rider({
    this.id,
    this.name,
    this.riderContactno,
    this.email,
    this.longitude,
    this.latitude,
  });

  String? id;
  String? name;
  String? riderContactno;
  String? email;
  String? longitude;
  String? latitude;

  factory Rider.fromJson(Map<String, dynamic> json) => Rider(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        riderContactno:
            json["riderContactno"] == null ? null : json["riderContactno"],
        email: json["email"] == null ? null : json["email"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        latitude: json["latitude"] == null ? null : json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "riderContactno": riderContactno == null ? null : riderContactno,
        "email": email == null ? null : email,
        "longitude": longitude == null ? null : longitude,
        "latitude": latitude == null ? null : latitude,
      };
}

class Consumer {
  Consumer({
    this.id,
    this.name,
    this.contactNo,
    this.address,
    this.longitude,
    this.latitude,
  });

  String? id;
  String? name;
  String? contactNo;
  String? address;
  String? longitude;
  String? latitude;

  factory Consumer.fromJson(Map<String, dynamic> json) => Consumer(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        contactNo: json["contactNo"] == null ? null : json["contactNo"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        latitude: json["latitude"] == null ? null : json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "contactNo": contactNo == null ? null : contactNo,
        "longitude": longitude == null ? null : longitude,
        "latitude": latitude == null ? null : latitude,
      };
}
