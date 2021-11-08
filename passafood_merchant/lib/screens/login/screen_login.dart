import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> with TickerProviderStateMixin {
  //final auth = Get.find<AuthController>();
  //final LoadingController loading_controller = Get.find<LoadingController>();
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(),
      floatingActionButton: _termsAndService(),
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
                _mobileInfo(),
                _passwordField(),
                SizedBox(
                  height: 16,
                ),
                _loginButton(),
                SizedBox(
                  height: 23,
                ),
                _forgotPassword(),
              ],
            ),
            // Obx(() {
            //   return loading_controller.isLoading.isTrue
            //       ? Center(
            //           child: CircularProgressIndicator(),
            //         )
            //       : Container();
            // }),
          ],
        ),
      ),
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
          'Rider',
          style: TextStyle(color: Colors.black, fontSize: 14),
        )
      ],
    );
  }

  Widget _mobileInfo() {
    return Container(
      height: 52,
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEFEFF4),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Text(
            '+63',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          VerticalDivider(
            thickness: 1,
            color: Color(0xffEFEFF4),
          ),
          Expanded(
            child: Container(
              height: 52,
              alignment: Alignment.center,
              child: TextFormField(
                // controller: auth.sign_in_mobile_number,
                maxLength: 10,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.only(top: 11, bottom: 8),
                  hintStyle: TextStyle(color: Color(0xffD4D3D8)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Enter mobile number',
                ),
              ),
            ),
          ),
        ],
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
        // controller: auth.sign_in_password,
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
        //  doLogin();
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

  Widget _termsAndService() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account yet?",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
                text: ' Sign up',
                style: TextStyle(
                    color: Color(0xff007C89), fontWeight: FontWeight.w600),
                recognizer: new TapGestureRecognizer()
                  ..onTap = () => Get.toNamed("/sign_up_initial_checking")),
          ],
        ),
      ),
    );
  }

  // void doLogin() async {
  //   await auth.signIn();
  //   Logger logger = new Logger();
  //   final prefs = await SharedPreferences.getInstance();
  //   String? rider_credential = prefs.getString("credential");
  //   RiderSharedPrefCredential cred = new RiderSharedPrefCredential();

  //   if (rider_credential != null) {
  //     cred = RiderSharedPrefCredential.fromJson(jsonDecode(rider_credential));
  //   }
  //   logger.i("SharedPref Data");
  //   logger.i(cred);
  //   logger.i(auth.sign_in_response.resultMessage);
  //   logger.i(auth.sign_in_response.resultEnum);

  //   if (auth.sign_in_response.resultMessage != null) {
  //     if (auth.sign_in_response.resultEnum == "Success" &&
  //         cred.accessToken != null) {
  //       Get.offAllNamed("/");
  //     } else if (auth.sign_in_response.resultMessage!.contains("not active")) {
  //       showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return CustomDialog(
  //               enableCloseButton: true,
  //               closeButtonText: "Close",
  //               title: "Needs to be verified",
  //               onPressedAgreeButton: () {},
  //               content: unverifiedContent(),
  //               onPressedCloseButton: () {
  //                 Navigator.of(context, rootNavigator: true).pop();
  //               },
  //             );
  //           });
  //     } else {
  //       showDialog(
  //           context: context,
  //           builder: (BuildContext context) {
  //             return CustomDialog(
  //               enableCloseButton: true,
  //               closeButtonText: "Close",
  //               title: "Message",
  //               onPressedAgreeButton: () {},
  //               content: nothingFoundContent(),
  //               onPressedCloseButton: () {
  //                 Navigator.of(context, rootNavigator: true).pop();
  //               },
  //             );
  //           });
  //     }
  //   } else {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return CustomDialog(
  //             enableCloseButton: true,
  //             closeButtonText: "Close",
  //             title: "Message",
  //             onPressedAgreeButton: () {},
  //             content: nothingFoundContent(),
  //             onPressedCloseButton: () {
  //               Navigator.of(context, rootNavigator: true).pop();
  //             },
  //           );
  //         });
  //   }
  // }

  // void autoLogin() async {
  //   bool isLogin = await auth.checkIsLogin();
  //   if (isLogin) {
  //     Get.offAndToNamed('/home');
  //   }
  // }
}
