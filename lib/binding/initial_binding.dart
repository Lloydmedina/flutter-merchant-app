import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:merchant/controller/auth_controller.dart';
import 'package:merchant/controller/loading_controller.dart';
import 'package:merchant/repository/auth_repo_imp.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepositoryImplementation(), fenix: true);
    //Get.lazyPut(() => ProfileRepositoryImplementation(), fenix: true);
    Get.put<LoadingController>(LoadingController(), permanent: true);
    Get.put(AuthController(), permanent: true);
    //Get.put<ProfileController>(ProfileController(), permanent: true);
    //Get.put<WalletController>(WalletController(), permanent: true);
    //et.put<WalletPageRepoImpl>(WalletPageRepoImpl(), permanent: true);
  }
}
