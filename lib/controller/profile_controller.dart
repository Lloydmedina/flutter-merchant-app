import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:merchant/controller/loading_controller.dart';
import 'package:merchant/model/profile/profile.dart';
import 'package:merchant/repository/profile_repo.dart';
import 'package:merchant/repository/profile_repo_imp.dart';

class ProfileController {
  ProfileRepository profile = Get.find<ProfileRepositoryImplementation>();
  LoadingController loading = Get.find<LoadingController>();

  Rx<MerchantProfile> merchant_info = new MerchantProfile().obs;

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
    loading.hideLoading();
  }
}
