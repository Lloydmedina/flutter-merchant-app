import 'package:get/get.dart';
import 'package:merchant/controller/auth_controller.dart';
import 'package:merchant/controller/loading_controller.dart';
import 'package:merchant/repository/auth_repo_imp.dart';
import 'package:merchant/repository/shared_preferences_imp.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepositoryImplementation());
    Get.lazyPut(() => SharedPreferencesImplementation());
    //Get.lazyPut(() => ProfileController());
    //Get.lazyPut(() => ProfileRepositoryImplementation());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => LoadingController());
  }
}
