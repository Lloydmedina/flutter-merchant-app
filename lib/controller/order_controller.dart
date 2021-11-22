import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:merchant/controller/loading_controller.dart';
import 'package:merchant/controller/profile_controller.dart';
import 'package:merchant/model/profile/profile.dart';
import 'package:merchant/order/orderDetail.dart';
import 'package:merchant/repository/order_repo.imp.dart';

class OrderController extends GetxController {
  OrderRepositoryImplementation order =
      Get.find<OrderRepositoryImplementation>();
  LoadingController loading = Get.find<LoadingController>();
  Rx<MerchantProfile> merchant_info = new MerchantProfile().obs;

  Rx<OrderDetails> order_info = new OrderDetails().obs;
  final profile = Get.find<ProfileController>();
  tStoreInfo() {}
  getStoreInfo() async {
    final box = GetStorage();

    String? acces_token = box.read("accessToken");
    String? merchant_id = merchant_info.value.merchantId;
    String? order_dateFrom = '2021-01-01';
    String? order_dateTo = '2021-12-31';
    String? order_status = '0';
    String? order_take = '50';
    String? order_skip = '0';
  }
}
