// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:merchant/controller/auth_controller.dart';
import 'package:merchant/controller/loading_controller.dart';
import 'package:merchant/controller/profile_controller.dart';
import 'package:merchant/merchant/merchant_shared_pref_credential.dart';
import 'package:merchant/repository/profile_repo_imp.dart';
import 'package:merchant/utils/custom_dialog.dart';
import 'package:merchant/utils/not_found.dart';
import 'package:merchant/utils/unverified.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  final auth = Get.find<AuthController>();

  MerchantSharedPrefCredential merch = new MerchantSharedPrefCredential();
  final LoadingController loading_controller = Get.find<LoadingController>();
  bool obscureText = true;

  @override
  void initState() {
    //autoLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(),
      // floatingActionButton: _termsAndService(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _loginForm() {
    return Center(
      child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _headerIcon(),
                  SizedBox(
                    height: 16,
                  ),
                  _usernameField(),
                  _passwordField(),
                  SizedBox(
                    height: 16,
                  ),
                  _loginButton(),
                  SizedBox(
                    height: 23,
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  _forgotPassword(),
                ],
              ),
              Obx(() {
                return loading_controller.isLoading.isTrue
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container();
              }),
            ],
          )),
    );
  }

  Widget _headerIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/passafood_icon.png'),
        SizedBox(
          height: 11,
        ),
        Text(
          'Merchant',
          style: TextStyle(color: Colors.black, fontSize: 14),
        )
      ],
    );
  }

  Widget _usernameField() {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEFEFF4),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        controller: auth.sign_in_email,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.all(16),
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xffC7C7CC),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEFEFF4),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        controller: auth.sign_in_password,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: obscureText
              ? InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    FeatherIcons.eye,
                    color: Colors.black,
                  ),
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(FeatherIcons.eyeOff, color: Colors.black),
                ),
          contentPadding: EdgeInsets.all(16),
          hintText: 'Password',
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xffC7C7CC),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 55),
        primary: Color(0xffFFDE00),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      onPressed: () {
        doLogin();

        //Get.toNamed("/home");
      },
      child: Text(
        'LOGIN',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _forgotPassword() {
    return InkWell(
      onTap: () {
        Get.toNamed("/forgot_password");
      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(
            color: Color(0xff007C89),
            fontWeight: FontWeight.w600,
            fontSize: 16),
      ),
    );
  }

  void doLogin() async {
    await auth.signIn();
    Logger logger = new Logger();
    final prefs = await SharedPreferences.getInstance();
    String? merchant_credential = prefs.getString("credential");
    MerchantSharedPrefCredential msc = new MerchantSharedPrefCredential();

    if (merchant_credential != null) {
      msc = MerchantSharedPrefCredential.fromJson(
          jsonDecode(merchant_credential));
    }

    logger.i("SharedPref Data");
    logger.i(merch);
    logger.i(auth.sign_in_response.resultMessage);
    logger.i(auth.sign_in_response.resultEnum);
    logger.i(auth.sign_in_response.resultObject!.accessToken);

    final box = GetStorage();

    if (auth.sign_in_response.resultMessage != null) {
      if (auth.sign_in_response.resultEnum == "Success" &&
          box.read('accessToken') != null) {
        Get.offAllNamed("/");
      } else if (auth.sign_in_response.resultMessage!.contains("not active")) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                enableCloseButton: true,
                closeButtonText: "Close",
                title: "Needs to be verified",
                onPressedAgreeButton: () {},
                content: unverifiedContent(),
                onPressedCloseButton: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                enableCloseButton: true,
                closeButtonText: "Close",
                title: "Message",
                onPressedAgreeButton: () {},
                content: nothingFoundContent(),
                onPressedCloseButton: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              );
            });
      }
    }

    // void autoLogin() async {
    //   var isLogin = box.read("accessToken");
    //   if (isLogin != null) {
    //     Get.offAndToNamed('/home');
    //   }
    // }
  }
}
