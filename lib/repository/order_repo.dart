import 'package:merchant/order/orderDetail.dart';

abstract class OrderRepository {
  Future<OrderDetails>? getOrderInfo(
      String merchant_id,
      String acces_token,
      String order_dateFrom,
      String order_dateTo,
      String order_status,
      int order_take,
      int order_skip);
}
