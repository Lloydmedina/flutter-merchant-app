// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:merchant/merchant/merchant_shared_pref_credential.dart';
import 'package:merchant/model/init_response_parser.dart';
import 'package:merchant/model/signin/check_email_response.dart';
import 'package:merchant/model/signin/sign_in_response.dart';
import 'package:merchant/repository/auth_repo.dart';
import 'package:merchant/utils/api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final String ACCOUNT_BASE_URL = API_CONFIG.ACCOUNT_BASE_URL;
  final String OTHER_SERVICE_BASE_URL = API_CONFIG.OTHER_SERVICE_BASE_URL;
  final headers = API_CONFIG.HEADERS;

  late SharedPreferences prefs;
  var client = http.Client();
  final logger = Logger();

  AuthRepositoryImplementation() {}
  @override
  Future<CheckEmailResponse>? checkEmailMobile(String email_mobile) async {
    try {
      client = http.Client();
      final url = Uri.parse(
          '${ACCOUNT_BASE_URL}/api/v1/m-verify-account/${email_mobile}');

      final response = await client.post(url, headers: headers);
      final res = response.body;

      client.close();
      return CheckEmailResponse.fromJson(jsonDecode(res));
    } on Exception catch (e) {
      logger.e(e);
      return CheckEmailResponse();
    }
  }

  @override
  Future<bool> checkIsLogin() async {
    return true;
  }

  @override
  Future<bool> checkTokenExpirey() {
    // TODO: implement checkTokenExpirey
    throw UnimplementedError();
  }

  // getUserDetails()
  // loginAction();
  // logoutAction();
  // parsedTokem();

  Future<String> extractData() async {
    String value = '';
    prefs = await SharedPreferences.getInstance();
    prefs.getString("credential");

    String? rider_credential = prefs.getString("credential");

    if (rider_credential != null) {
      MerchantSharedPrefCredential credential =
          MerchantSharedPrefCredential.fromJson(jsonDecode(rider_credential));
      if (credential.userId != null) {
        value = credential.userId!;
      }
    }

    return value;
  }

  @override
  Future<SignInResponse>? signIn(data) async {
    try {
      client = http.Client();
      final url = Uri.parse('${ACCOUNT_BASE_URL}/api/v1/merchant/user/login');
      final body = jsonEncode(data);
      final response = await client.post(url, headers: headers, body: body);
      final res = response.body;

      client.close();
      late var parsed_response;
      if (response.statusCode == 200) {
        InitResponseParser init_parsed =
            InitResponseParser.fromJson(json.decode(res));
        if (init_parsed.resultEnum == "Success") {
          parsed_response = SignInResponse.fromJson(json.decode(res));
        } else {
          parsed_response = SignInResponse.fromJson(init_parsed.toJson());
        }
        saveTosharePreferences(parsed_response);
        return parsed_response;
      }
      return SignInResponse();
    } on Exception catch (e) {
      logger.e(e);
      return SignInResponse();
    }
  }

  @override
  void saveTosharePreferences(SignInResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    if (response.resultObject != null) {
      var res = response;
      MerchantSharedPrefCredential credential =
          MerchantSharedPrefCredential.fromJson(
              response.resultObject!.toJson());

      String user_credentials = jsonEncode(credential);
      prefs.setString("credential", user_credentials);
    }
  }

  @override
  bool signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  // @override
  // Future<SignUpResponse> signUp(rider) async {
  //   try {
  //     client = http.Client();
  //     final url = Uri.parse('${ACCOUNT_BASE_URL}/api/v1/rider/register');
  //     final body = jsonEncode(rider);

  //     print(body);
  //     final response = await client.post(url, headers: headers, body: body);
  //     final res = response.body;

  //     client.close();
  //     late var parsed_response;
  //     // if (response.statusCode == 200) {
  //     InitResponseParser init_parsed =
  //         InitResponseParser.fromJson(json.decode(res));
  //     if (init_parsed.resultEnum == "Success") {
  //       parsed_response = SignUpResponse.fromJson(json.decode(res));
  //     } else {
  //       parsed_response = SignUpResponse.fromJson(init_parsed.toJson());
  //     }
  //     return parsed_response;
  //     // }
  //   } on Exception catch (e) {
  //     logger.e(e);
  //     return SignUpResponse();
  //   }
  // }

  // @override
  // Future<ForgotPasswordResponse> forgotPassword(forgot_password_data) async {
  //   try {
  //     client = http.Client();
  //     final url = Uri.parse('${ACCOUNT_BASE_URL}/api/v1/rider/reset-password');
  //     final body = jsonEncode(forgot_password_data);

  //     print(body);
  //     final response = await client.patch(url, headers: headers, body: body);
  //     final res = response.body;

  //     client.close();
  //     late var parsed_response;
  //     // if (response.statusCode == 200) {
  //     InitResponseParser init_parsed =
  //         InitResponseParser.fromJson(json.decode(res));
  //     if (init_parsed.resultEnum == "Success") {
  //       parsed_response = ForgotPasswordResponse.fromJson(json.decode(res));
  //     } else {
  //       parsed_response = ForgotPasswordResponse.fromJson(init_parsed.toJson());
  //     }
  //     return parsed_response;
  //     // }
  //   } on Exception catch (e) {
  //     logger.e(e);
  //     return ForgotPasswordResponse();
  //   }
  // }

  // @override
  // Future<VerifyMobileEmailResponse> forgotPasswordConfirmCode(
  //     String code) async {
  //   try {
  //     client = http.Client();
  //     final url = Uri.parse('${OTHER_SERVICE_BASE_URL}/api/v1/confirm/${code}');

  //     final response = await client.post(url, headers: {...headers});
  //     final res = response.body;
  //     client.close();
  //     return VerifyMobileEmailResponse.fromJson(json.decode(res));
  //   } on Exception catch (e) {
  //     logger.e(e);
  //     return new VerifyMobileEmailResponse();
  //   }
  // }

  // @override
  // Future<VerifyMobileEmailResponse> initialRegistrationConfirmCode(
  //     String mobile, String code) async {
  //   try {
  //     client = http.Client();
  //     final url = Uri.parse(
  //         '${OTHER_SERVICE_BASE_URL}/api/v1/confirm/${code}/${mobile}');

  //     final response = await client.post(url, headers: {...headers});
  //     final res = response.body;
  //     client.close();
  //     return VerifyMobileEmailResponse.fromJson(json.decode(res));
  //   } on Exception catch (e) {
  //     logger.e(e);
  //     return new VerifyMobileEmailResponse();
  //   }
  // }

  // @override
  // Future<CheckMobileEmailResponse> registrationCheckEmailMobile(
  //     String mobile) async {
  //   try {
  //     client = http.Client();
  //     final url = Uri.parse(
  //         '${ACCOUNT_BASE_URL}/api/v1/rider/register-mobile/${mobile}');
  //     final response = await client.post(url, headers: headers);
  //     final res = response.body;
  //     client.close();
  //     return CheckMobileEmailResponse.fromJson(jsonDecode(res));
  //   } on Exception catch (e) {
  //     logger.e(e);
  //     return CheckMobileEmailResponse();
  //   }
  // }

  // @override
  // Future<CheckMobileEmailResponse>? checkEmailMobile(
  //     String email_mobile) async {
  //   try {
  //     client = http.Client();
  //     final url = Uri.parse(
  //         '${ACCOUNT_BASE_URL}/api/v1/rider/verify-email-mobile/${email_mobile}');

  //     final response = await client.post(url, headers: headers);
  //     final res = response.body;

  //     client.close();
  //     return CheckMobileEmailResponse.fromJson(jsonDecode(res));
  //   } on Exception catch (e) {
  //     logger.e(e);
  //     return CheckMobileEmailResponse();
  //   }
  // }

}
