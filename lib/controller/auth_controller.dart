import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:merchant/controller/loading_controller.dart';
import 'package:merchant/controller/profile_controller.dart';
import 'package:merchant/model/signin/sign_in.dart';
import 'package:merchant/model/signin/sign_in_response.dart';
import 'package:merchant/repository/auth_repo.dart';
import 'package:merchant/repository/auth_repo_imp.dart';

class AuthController {
  AuthRepository auth = Get.find<AuthRepositoryImplementation>();
  ProfileController profile = Get.find<ProfileController>();
  LoadingController _loading = Get.find<LoadingController>();

  final sign_in_email = TextEditingController();
  final sign_in_password = TextEditingController();
  bool socialId = false;

  SignInResponse sign_in_response = new SignInResponse();

  final logger = Logger();

  AuthController() {}

  signIn() async {
    _loading.showLoading();
    final result = await auth.signIn(new SignIn(
      email: sign_in_email.text,
      password: sign_in_password.text,
      socialId: socialId,
    ));
    final box = GetStorage();
    box.write('accessToken', result?.resultObject?.accessToken);
    box.write('userId', result?.resultObject?.userId);
    // print(box.read('token'));

    sign_in_response = result!;
    profile.getProfileInfo();
    _loading.hideLoading();
  }

  signOut() async {
    // _loading.showLoading();

    final box = GetStorage();
    box.erase();
    print(box.read('token'));
    Get.toNamed("/login");
    _loading.hideLoading();
  }

  Future<bool> tryAutoLogin() async {
    bool isLogin = await auth.checkIsLogin();
    if (isLogin) {
      return true;
    }
    return false;
  }
}
