import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:merchant/controller/loading_controller.dart';
import 'package:merchant/model/signin/sign_in.dart';
import 'package:merchant/model/signin/sign_in_response.dart';
import 'package:merchant/repository/auth_repo.dart';
import 'package:merchant/repository/auth_repo_imp.dart';

class AuthController {
  AuthRepository auth = Get.find<AuthRepositoryImplementation>();
  // ProfileController profile = Get.find<ProfileController>();
  LoadingController _loading = Get.find<LoadingController>();

  //ProfileController profile = new ProfileController();

// login
  final sign_in_mobile_number = TextEditingController();
  final sign_in_email = TextEditingController();
  final sign_in_password = TextEditingController();
  bool socialId = false;
// forgot
  final forgot_mobile_number = TextEditingController();
  TextEditingController forgot_code = TextEditingController();
  final forgot_password = TextEditingController();
  final forgot_confirm_password = TextEditingController();

// sign up
  final sign_up_mobile_number = TextEditingController();
  TextEditingController sign_up_code = TextEditingController();
  final sign_up_email = TextEditingController();
  final sign_up_password = TextEditingController();
  final sign_up_first_name = TextEditingController();
  final sign_up_middle_name = TextEditingController();
  final sign_up_last_name = TextEditingController();
  final sign_up_confirm_password = TextEditingController();
  final sign_up_birth_date = TextEditingController();

  SignInResponse sign_in_response = new SignInResponse();
  // SignUpResponse sign_up_response = new SignUpResponse();
  // late CheckMobileEmailResponse check_mobile_email_response;
  // late CheckMobileEmailResponse registration_check_mobile_email_response;
  // late ForgotPasswordResponse forgot_password_response;
  // late ForgotPasswordResponse response;
  // late VerifyMobileEmailResponse forgot_verified_number_response =
  //     new VerifyMobileEmailResponse();
  // late VerifyMobileEmailResponse sign_up_verified_number_response =
  //     new VerifyMobileEmailResponse();

  final logger = Logger();

  AuthController() {}

  signIn() async {
    _loading.showLoading();
    final result = await auth.signIn(new SignIn(
      email: sign_in_mobile_number.text,
      password: sign_in_password.text,
    ));
    final box = GetStorage();
    box.write('accessToken', result?.resultObject?.accessToken);
    box.write('userId', result?.resultObject?.userId);
    print(box.read('token'));

    sign_in_response = result!;
    _loading.hideLoading();
  }

  // signUp() async {
  //   _loading.showLoading();
  //   if (sign_up_password.text != sign_up_confirm_password.text) {
  //     print("inside here");
  //     sign_up_response = new SignUpResponse(
  //         resultMessage: "Password does not match", resultEnum: "Faild");
  //     _loading.hideLoading();
  //     return;
  //   }
  //   SignUp rider = new SignUp(
  //       firstName: sign_up_first_name.text,
  //       middleName: "default",
  //       lastName: sign_up_last_name.text,
  //       mobileNumber: "63${sign_up_mobile_number.text}",
  //       email: sign_up_email.text,
  //       password: sign_up_password.text,
  //       confirmPassword: sign_up_confirm_password.text);

  //   final result = await auth.signUp(rider);

  //   if (result != null) {
  //     sign_up_response = result;
  //   } else {
  //     print("No data recieved");
  //   }
  //   _loading.hideLoading();
  // }

  // signOut() async {}

  // checkEmailMobile() async {
  //   _loading.showLoading();
  //   if (forgot_mobile_number.text != null || forgot_mobile_number.text != "") {
  //     final result =
  //         await auth.checkEmailMobile("63${forgot_mobile_number.text}");
  //     _loading.hideLoading();
  //     if (result != null) {
  //       Logger logger = new Logger();
  //       logger.i(result);
  //       check_mobile_email_response = result;
  //     } else {
  //       print("No data recieved");
  //     }
  //   } else {
  //     print("No Input Receive");
  //   }
  // }

  // registrationCheckEmailMobile() async {
  //   _loading.showLoading();
  //   if (sign_up_mobile_number.text != null ||
  //       sign_up_mobile_number.text != "") {
  //     final result = await auth
  //         .registrationCheckEmailMobile("63${sign_up_mobile_number.text}");
  //     _loading.hideLoading();
  //     if (result != null) {
  //       Logger logger = new Logger();
  //       logger.i(result);
  //       registration_check_mobile_email_response = result;
  //     } else {
  //       print("No data recieved");
  //     }
  //   } else {
  //     print("No Input Receive");
  //   }
  // }

  // forgotPassword() async {
  //   _loading.showLoading();

  //   final result = await auth.forgotPassword(new ForgotPassword(
  //       mobileOrEmail: "63${forgot_mobile_number.text}",
  //       confirmNewPassword: forgot_confirm_password.text,
  //       newPassword: forgot_password.text));

  //   _loading.hideLoading();

  //   if (result != null) {
  //     response = result;
  //   } else {
  //     print("No data recieved");
  //   }
  // }

  Future<bool> tryAutoLogin() async {
    bool isLogin = await auth.checkIsLogin();
    if (isLogin) {
      return true;
    }
    return false;
  }

  // forgotPasswordResendOTP() async {
  //   await this.checkEmailMobile();
  // }

  // forgotPasswordVerifyOTP() async {
  //   _loading.showLoading();
  //   if (forgot_code != "") {
  //     final result =
  //         // await auth.forgotPassword(forgot_password)("63${forgot_mobile_number.text}");
  //         await auth.forgotPasswordConfirmCode(forgot_code.text);
  //     _loading.hideLoading();
  //     forgot_verified_number_response = result;
  //   } else {
  //     print("No Input Receive");
  //   }
  // }

  // signUpResendOTP() async {
  //   await this.registrationCheckEmailMobile();
  // }

  // signUpVerifyOTP() async {
  //   _loading.showLoading();
  //   if (forgot_code != "") {
  //     final result = await auth.initialRegistrationConfirmCode(
  //         "63${sign_up_mobile_number.text}", sign_up_code.text);
  //     _loading.hideLoading();
  //     sign_up_verified_number_response = result;
  //   } else {
  //     print("No Input Receive");
  //   }
  // }
}
