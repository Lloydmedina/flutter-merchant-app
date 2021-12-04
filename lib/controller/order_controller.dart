import 'package:get/get.dart';

import 'package:logger/logger.dart';
import 'package:get_storage/get_storage.dart';
import 'package:merchant/model/order_response.dart';
import 'package:merchant/model/profile/profile.dart';

import 'package:signalr_core/signalr_core.dart';

class OrderController extends GetxController {
  //BookingResponse bookings = new BookingResponse();
  Rx<MerchantProfile> merchant_info = new MerchantProfile().obs;
  Rx<BookingResponse> cpo = new BookingResponse().obs;
  BookingResponse mao = new BookingResponse();
  BookingResponse mor = new BookingResponse();
  BookingResponse rpo = new BookingResponse();
  List<BookingResponse> orderList = <BookingResponse>[].obs;
  int selected = 0;
  final logger = Logger();
  late HubConnection connection;
  final orderBaseUrl = 'https://booking-service-staging.azurewebsites.net';

  OrderController() {}
  @override
  void onInit() {
    super.onInit();
    connection = HubConnectionBuilder()
        .withUrl(
            'https://booking-service-staging.azurewebsites.net/booking-hub',
            HttpConnectionOptions(
              logging: (level, message) => print(message),
            ))
        .build();
    stream();
    connection.start();
    print("connection started");
  }

  stream() {
    connection.on('RiderAcceptedOrder', (message) {
      print("RiderAcceptedOrder: $message");
      orderCheccker(message);
    });
    connection.on('MerchantAcceptedOrder', (message) {
      print("MerchantAcceptOrder: $message");
      orderCheccker(message);
    });
    connection.on('RiderPickupOrder', (message) {
      print("RiderPickupOrder: $message");
      orderCheccker(message);
    });
    connection.on('RiderIsArrived', (message) {
      print("RiderIsArrived: $message");
      orderCheccker(message);
    });
    connection.on('RiderDropOff', (message) {
      print("RiderDropOff: $message");
      orderCheccker(message);
    });
    connection.on('CancelledByMerchant', (message) {
      print("CancelledByMerchant: $message");
      orderCheccker(message);
    });
    connection.on('CancelledByRider', (message) {
      print("CancelledByRider: $message");
      orderCheccker(message);
    });
    connection.on('CancelledByConsumer', (message) {
      print('CancelledByConsumer: $message');
      orderCheccker(message);
    });

    connection.on('ConsumerPlaceOrder', (message) {
      orderCheccker(message);
    });
    connection.on('RiderInStore', (message) {
      print("RiderInStore: $message");
      orderCheccker(message);
    });
  }

  orderCheccker(message) {
    final box = GetStorage();
    for (var msg in message!) {
      if (msg["merchant"]["id"] == box.read("merchantId")) {
        final results = BookingResponse.fromJson(message![0]);
        if (results.status == "CPO") {
          orderList.add(results);
        } else {
          var isExist = orderList
              .where((element) => element.bookingId == msg["bookingId"]);

          if (isExist.isNotEmpty) {
            BookingResponse trans = isExist.first;
            trans.status = results.status;
            trans.rider = results.rider;
            orderList[orderList.indexWhere(
                (element) => element.bookingId == msg["bookingId"])] = trans;

            print("#################### status updated - " + msg["status"]);
          }
        }
        update();
      }
    }
  }

  String getStatus(String status) {
    String retStatus = "";
    switch (status) {
      case "CPO":
        retStatus = "Incomming Order";
        break;
      case "RAO":
        retStatus = "Rider Accepted Order";
        break;
      case "AAR":
      case "MAO":
      case "AAO":
        retStatus = "Order in proccess";
        break;
      case "MOR":
        retStatus = "Order in proccess";
        break;
      case "RIS":
        retStatus = "Rider arrived";
        break;
      case "RPO":
        retStatus = "Rider on the way";
        break;
      case "OAS":
        retStatus = "Rider on the way";
        break;
      case "RIA":
        retStatus = "Rider arrived";
        break;
      case "RDO":
        retStatus = "COMPLETED";
        break;
      case "CBC":
      case "CBR":
      case "CBM":
        retStatus = "CANCELLED";
        break;
    }
    return retStatus;
  }
}
