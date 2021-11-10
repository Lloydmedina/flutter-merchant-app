import 'package:merchant/model/signin/check_email_response.dart';
import 'package:merchant/model/signin/sign_in.dart';
import 'package:merchant/model/signin/sign_in_response.dart';
//import 'package:merchant/signin/sign_in.dart';
//import 'package:merchant/signin/sign_in_response.dart';

abstract class AuthRepository {
  Future<bool> checkIsLogin();
  Future<bool> checkTokenExpirey();

  Future<SignInResponse>? signIn(SignIn signIn);
  //Future<SignUpResponse>? signUp(SignUp rider);
  bool signOut();
  void saveTosharePreferences(SignInResponse response);

  // Future<ForgotPasswordResponse>? forgotPassword(
  //     ForgotPassword forgot_password);
  // Future<VerifyMobileEmailResponse> forgotPasswordConfirmCode(String code);
  // Future<VerifyMobileEmailResponse> initialRegistrationConfirmCode(
  //     String mobile, String code);
  // Future<CheckMobileEmailResponse> registrationCheckEmailMobile(String mobile);
  // Future<CheckEmailResponse>? checkEmailMobile(String email_mobile);

  // Future<bool> parsedToken();
  // Future<bool> checkTokenExpirey();
  // Future<bool> checkTokenExpirey();
}
