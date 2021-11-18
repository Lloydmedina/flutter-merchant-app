import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:merchant/controller/profile_controller.dart';

class StoreController {
  final profile = Get.find<ProfileController>();
  tStoreInfo() {}
  getStoreInfo() async {
    final box = GetStorage();

    String? acces_token = box.read("accessToken");
    String? merchant_id = profile.merchant_info.value.merchantId;
  }
}
