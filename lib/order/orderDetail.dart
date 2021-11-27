// To parse this JSON data, do
//
//     final orderDetails = orderDetailsFromJson(jsonString);

import 'dart:convert';

import 'dart:ffi';

OrderDetails orderDetailsFromJson(String str) =>
    OrderDetails.fromJson(json.decode(str));

String orderDetailsToJson(OrderDetails data) => json.encode(data.toJson());

class OrderDetails {
  OrderDetails({
    this.resultEnum,
    this.resultMessage,
    this.resultObject,
    this.resultArray,
    this.resultVariable,
  });

  String? resultEnum;
  String? resultMessage;
  List<ResultObject>? resultObject;
  dynamic resultArray;
  dynamic resultVariable;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        resultEnum: json["resultEnum"] == null ? null : json["resultEnum"],
        resultMessage:
            json["resultMessage"] == null ? null : json["resultMessage"],
        resultObject: json["resultObject"] == null
            ? null
            : List<ResultObject>.from(
                json["resultObject"].map((x) => ResultObject.fromJson(x))),
        resultArray: json["resultArray"],
        resultVariable: json["resultVariable"],
      );

  Map<String, dynamic> toJson() => {
        "resultEnum": resultEnum == null ? null : resultEnum,
        "resultMessage": resultMessage == null ? null : resultMessage,
        "resultObject": resultObject == null
            ? null
            : List<dynamic>.from(resultObject!.map((x) => x.toJson())),
        "resultArray": resultArray,
        "resultVariable": resultVariable,
      };
}

class ResultObject {
  ResultObject({
    this.id,
    this.guid,
    this.referenceNo,
    this.date,
    this.time,
    this.starTime,
    this.endTime,
    //this.latitude,
    //this.longitude,
    this.duration,
    this.kms,
    this.fees,
    this.remarks,
    this.merchantGuid,
    this.merchantName,
    this.merchantAddress,
    this.riderGuid,
    this.riderName,
    this.riderContactno,
    this.clientGuid,
    this.clientName,
    this.clientEmailAddress,
    this.clientContactno,
    this.clientAddress,
    this.clientAddressDetail,
    this.status,
    this.items,
    this.detailStatus,
    this.acceptedMerchant,
  });

  int? id;
  String? guid;
  String? referenceNo;
  String? date;
  String? time;
  DateTime? starTime;
  DateTime? endTime;
  //Double? latitude;
  //Double? longitude;
  double? duration;
  double? kms;
  double? fees;
  String? remarks;
  String? merchantGuid;
  String? merchantName;
  String? merchantAddress;
  dynamic riderGuid;
  dynamic riderName;
  dynamic riderContactno;
  String? clientGuid;
  String? clientName;
  String? clientEmailAddress;
  String? clientContactno;
  dynamic clientAddress;
  dynamic clientAddressDetail;
  String? status;
  List<Item>? items;
  List<DetailStatus>? detailStatus;
  String? acceptedMerchant;

  factory ResultObject.fromJson(Map<String, dynamic> json) => ResultObject(
        id: json["id"] == null ? null : json["id"],
        guid: json["guid"] == null ? null : json["guid"],
        referenceNo: json["referenceNo"] == null ? null : json["referenceNo"],
        date: json["date"] == null ? null : json["date"],
        time: json["time"] == null ? null : json["time"],
        starTime:
            json["starTime"] == null ? null : DateTime.parse(json["starTime"]),
        endTime:
            json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        //latitude: json["latitude"] == null ? null : json["latitude"],
        // longitude: json["longitude"] == null ? null : json["longitude"],
        duration: json["duration"] == null ? null : json["duration"],
        kms: json["kms"] == null ? null : json["kms"],
        fees: json["fees"] == null ? null : json["fees"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        merchantGuid:
            json["merchantGUID"] == null ? null : json["merchantGUID"],
        merchantName:
            json["merchantName"] == null ? null : json["merchantName"],
        merchantAddress:
            json["merchantAddress"] == null ? null : json["merchantAddress"],
        riderGuid: json["riderGUID"],
        riderName: json["riderName"],
        riderContactno: json["riderContactno"],
        clientGuid: json["clientGUID"] == null ? null : json["clientGUID"],
        clientName: json["clientName"] == null ? null : json["clientName"],
        clientEmailAddress: json["clientEmailAddress"] == null
            ? null
            : json["clientEmailAddress"],
        clientContactno:
            json["clientContactno"] == null ? null : json["clientContactno"],
        clientAddress: json["clientAddress"],
        clientAddressDetail: json["clientAddressDetail"],
        status: json["status"] == null ? null : json["status"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        detailStatus: json["detailStatus"] == null
            ? null
            : List<DetailStatus>.from(
                json["detailStatus"].map((x) => DetailStatus.fromJson(x))),
        acceptedMerchant:
            json["acceptedMerchant"] == null ? null : json["acceptedMerchant"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "guid": guid == null ? null : guid,
        "referenceNo": referenceNo == null ? null : referenceNo,
        "date": date == null ? null : date,
        "time": time == null ? null : time,
        "starTime": starTime == null ? null : starTime!.toIso8601String(),
        "endTime": endTime == null ? null : endTime!.toIso8601String(),
        // "latitude": latitude == null ? null : latitude,
        //"longitude": longitude == null ? null : longitude,
        "duration": duration == null ? null : duration,
        "kms": kms == null ? null : kms,
        "fees": fees == null ? null : fees,
        "remarks": remarks == null ? null : remarks,
        "merchantGUID": merchantGuid == null ? null : merchantGuid,
        "merchantName": merchantName == null ? null : merchantName,
        "merchantAddress": merchantAddress == null ? null : merchantAddress,
        "riderGUID": riderGuid,
        "riderName": riderName,
        "riderContactno": riderContactno,
        "clientGUID": clientGuid == null ? null : clientGuid,
        "clientName": clientName == null ? null : clientName,
        "clientEmailAddress":
            clientEmailAddress == null ? null : clientEmailAddress,
        "clientContactno": clientContactno == null ? null : clientContactno,
        "clientAddress": clientAddress,
        "clientAddressDetail": clientAddressDetail,
        "status": status == null ? null : status,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "detailStatus": detailStatus == null
            ? null
            : List<dynamic>.from(detailStatus!.map((x) => x.toJson())),
        "acceptedMerchant": acceptedMerchant == null ? null : acceptedMerchant,
      };
}

class DetailStatus {
  DetailStatus({
    this.bookingId,
    this.statusId,
    this.statusDescription,
    this.type,
    this.remarks,
    this.riderGuid,
    this.riderName,
    this.riderContactno,
    this.id,
    this.guid,
    this.dateCreated,
    this.createdBy,
  });

  String? bookingId;
  String? statusId;
  String? statusDescription;
  String? type;
  String? remarks;
  dynamic riderGuid;
  dynamic riderName;
  dynamic riderContactno;
  int? id;
  String? guid;
  DateTime? dateCreated;
  dynamic createdBy;

  factory DetailStatus.fromJson(Map<String, dynamic> json) => DetailStatus(
        bookingId: json["bookingId"] == null ? null : json["bookingId"],
        statusId: json["statusId"] == null ? null : json["statusId"],
        statusDescription: json["statusDescription"] == null
            ? null
            : json["statusDescription"],
        type: json["type"] == null ? null : json["type"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        riderGuid: json["riderGUID"],
        riderName: json["riderName"],
        riderContactno: json["riderContactno"],
        id: json["id"] == null ? null : json["id"],
        guid: json["guid"] == null ? null : json["guid"],
        dateCreated: json["dateCreated"] == null
            ? null
            : DateTime.parse(json["dateCreated"]),
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toJson() => {
        "bookingId": bookingId == null ? null : bookingId,
        "statusId": statusId == null ? null : statusId,
        "statusDescription":
            statusDescription == null ? null : statusDescription,
        "type": type == null ? null : type,
        "remarks": remarks == null ? null : remarks,
        "riderGUID": riderGuid,
        "riderName": riderName,
        "riderContactno": riderContactno,
        "id": id == null ? null : id,
        "guid": guid == null ? null : guid,
        "dateCreated":
            dateCreated == null ? null : dateCreated!.toIso8601String(),
        "createdBy": createdBy,
      };
}

class Item {
  Item({
    this.itemGuid,
    this.itemDescription,
    this.uoM,
    this.price,
    this.qunatity,
    this.totalAmount,
    this.remarks,
    this.itemDetails,
  });

  String? itemGuid;
  String? itemDescription;
  dynamic uoM;
  double? price;
  double? qunatity;
  double? totalAmount;
  String? remarks;
  List<dynamic>? itemDetails;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemGuid: json["itemGUID"] == null ? null : json["itemGUID"],
        itemDescription:
            json["itemDescription"] == null ? null : json["itemDescription"],
        uoM: json["uoM"],
        price: json["price"] == null ? null : json["price"],
        qunatity: json["qunatity"] == null ? null : json["qunatity"],
        totalAmount: json["totalAmount"] == null ? null : json["totalAmount"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        itemDetails: json["itemDetails"] == null
            ? null
            : List<dynamic>.from(json["itemDetails"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "itemGUID": itemGuid == null ? null : itemGuid,
        "itemDescription": itemDescription == null ? null : itemDescription,
        "uoM": uoM,
        "price": price == null ? null : price,
        "qunatity": qunatity == null ? null : qunatity,
        "totalAmount": totalAmount == null ? null : totalAmount,
        "remarks": remarks == null ? null : remarks,
        "itemDetails": itemDetails == null
            ? null
            : List<dynamic>.from(itemDetails!.map((x) => x)),
      };
}
