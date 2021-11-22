import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:merchant/controller/auth_controller.dart';
import 'package:merchant/controller/loading_controller.dart';
import 'package:merchant/controller/order_controller.dart';
import 'package:merchant/controller/profile_controller.dart';
import 'package:merchant/controller/store_controller.dart';
import 'package:merchant/repository/auth_repo_imp.dart';
import 'package:merchant/repository/order_repo.imp.dart';
import 'package:merchant/repository/profile_repo_imp.dart';
import 'package:merchant/repository/store_repo_imp.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepositoryImplementation(), fenix: true);
    Get.lazyPut(() => ProfileRepositoryImplementation(), fenix: true);
    Get.lazyPut(() => StoreRepositoryImplementation(), fenix: true);
    Get.lazyPut(() => OrderRepositoryImplementation(), fenix: true);
    Get.put<LoadingController>(LoadingController(), permanent: true);
    Get.put<ProfileController>(ProfileController(), permanent: true);
    Get.put<StoreController>(StoreController(), permanent: true);
    Get.put<OrderController>(OrderController(), permanent: true);
    Get.put(AuthController(), permanent: true);

    //Get.put<WalletController>(WalletController(), permanent: true);
    //et.put<WalletPageRepoImpl>(WalletPageRepoImpl(), permanent: true);
  }
}
