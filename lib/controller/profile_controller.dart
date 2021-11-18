import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:merchant/controller/loading_controller.dart';
import 'package:merchant/controller/store_controller.dart';

import 'package:merchant/model/profile/profile.dart';
import 'package:merchant/model/store/store.dart';
import 'package:merchant/repository/profile_repo.dart';
import 'package:merchant/repository/profile_repo_imp.dart';
import 'package:merchant/repository/store_repo_imp.dart';
import 'package:merchant/repository/store_repo.dart';

class ProfileController {
  ProfileRepository profile = Get.find<ProfileRepositoryImplementation>();
  StoreRepositoryImplementation store =
      Get.find<StoreRepositoryImplementation>();
  LoadingController loading = Get.find<LoadingController>();
  //StoreController store = Get.find<StoreController>();
  Rx<MerchantProfile> merchant_info = new MerchantProfile().obs;
  Rx<MerchantStoreInfo> store_info = new MerchantStoreInfo().obs;

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
}
