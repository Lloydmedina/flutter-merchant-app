import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:passafood_merchant/screens/home/views/home_view.dart';
import 'package:passafood_merchant/screens/login/views/forgot_password_view.dart';
import 'package:passafood_merchant/screens/login/views/registration_view.dart';

class LoginView extends StatefulWidget {
  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  bool obscureText = true;

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
        child: Column(
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
            _signUp(),
            SizedBox(
              height: 23,
            ),
            _forgotPassword(),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeView();
        }));
      },
      child: Text(
        'LOGIN',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _signUp() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return RegistrationView();
            },
          ),
        );
      },
      child: Text(
        'Be a partnered merchant Sign up now',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }

  Widget _forgotPassword() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ForgotPasswordView();
        }));
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
              text: 'Terms of Service',
              style: TextStyle(
                color: Color(0xff007C89),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: ' and ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                  color: Color(0xff007C89), fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
