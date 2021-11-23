import 'dart:convert';

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import 'package:merchant/model/init_response_parser.dart';
import 'package:merchant/order/orderDetail.dart';
import 'package:merchant/repository/order_repo.dart';
import 'package:merchant/utils/api_config.dart';

class OrderRepositoryImplementation implements OrderRepository {
  final orderBaseUrl = 'https://booking-service-staging.azurewebsites.net';
  final headers = API_CONFIG.HEADERS;
  final merchant_order_storage = GetStorage('merchant_order_info');
  var client = http.Client();
  final logger = Logger();

  OrderRepositoryImplementation() {}

  Future<OrderDetails> getOrderInfo(
      String? merchant_id,
      String acces_token,
      String order_dateFrom,
      String order_dateTo,
      int order_status,
      int order_take,
      int order_skip) async {
    try {
      client = http.Client();
      final url = Uri.parse(
          '${orderBaseUrl}/api/v1/booking/${order_dateFrom}/${order_dateTo}/${order_status}/${order_take}/${order_skip}/${merchant_id}');
      final response = await client.get(url, headers: {
        ...headers,
        'Authorization': 'Bearer ${acces_token}',
      });
      final res = response.body;

      client.close();
      late var parsed_response;
      InitResponseParser init_parsed =
          InitResponseParser.fromJson(json.decode(res));
      if (init_parsed.resultEnum == "Success") {
        var jsonResponse = json.decode(res);
        parsed_response = OrderDetails.fromJson(jsonResponse["resultObject"]);
      } else {
        parsed_response = new OrderDetails();
      }
      return parsed_response;
    } on Exception catch (e) {
      logger.e(e);

      return new OrderDetails();
    }
  }
}
