import 'package:get/get.dart';

class LoadingController {
  RxBool isLoading = false.obs;

  LoadingController() {}
  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
