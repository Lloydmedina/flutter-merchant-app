import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'package:logger/logger.dart';
import 'package:merchant/controller/loading_controller.dart';
import 'package:merchant/controller/store_controller.dart';

import 'package:merchant/model/profile/profile.dart';
import 'package:merchant/model/store/store.dart';
import 'package:merchant/order/orderDetail.dart';
import 'package:merchant/repository/order_repo.imp.dart';
import 'package:merchant/repository/profile_repo.dart';
import 'package:merchant/repository/profile_repo_imp.dart';
import 'package:merchant/repository/store_repo_imp.dart';
import 'package:merchant/repository/store_repo.dart';

class ProfileController extends GetxController {
  ProfileRepository profile = Get.find<ProfileRepositoryImplementation>();
  StoreRepositoryImplementation store =
      Get.find<StoreRepositoryImplementation>();
  OrderRepositoryImplementation order =
      Get.find<OrderRepositoryImplementation>();
  LoadingController loading = Get.find<LoadingController>();
  //StoreController store = Get.find<StoreController>();
  Rx<MerchantProfile> merchant_info = new MerchantProfile().obs;
  Rx<MerchantStoreInfo> store_info = new MerchantStoreInfo().obs;
  OrderDetails order_info = new OrderDetails();

  int selected = 0;
  final logger = Logger();

  ProfileController() {}

  getProfileInfo() async {
    loading.showLoading();
    final box = GetStorage();
    String? userid = box.read("userId");
    String? access_token = box.read("accessToken");

    final get_profile_result =
        await profile.getMerchantInfo(userid, access_token);
    merchant_info = get_profile_result.obs;
    getStoreInfo();
  }

  getStoreInfo() async {
    loading.showLoading();
    final box = GetStorage();

    String? acces_token = box.read("accessToken");
    String? merchant_id = merchant_info.value.merchantId;

    final get_store_result =
        await store.getMerchantStoreInfo(merchant_id, acces_token);
    store_info = get_store_result.obs;
    loading.hideLoading();
  }

  setStatus(data) {
    print(data);
    getOrderInfo(data);
  }

  getOrderInfo(status) async {
    loading.showLoading();
    final box = GetStorage();
    DateTime dnow = new DateTime.now();
    String acces_token = box.read("accessToken");
    String? merchant_id = merchant_info.value.merchantId;
    String order_dateFrom = '2021-11-01';
    String order_dateTo = DateFormat('yyyy-MM-dd').format(dnow);
    String order_status = status;
    int order_take = 100;
    int order_skip = 0;

    final get_order_result = await order.getOrderInfo(merchant_id, acces_token,
        order_dateFrom, order_dateTo, order_status, order_take, order_skip);
    order_info = get_order_result;

    update();
  }
}
