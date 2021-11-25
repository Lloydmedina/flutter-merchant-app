import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/controller/profile_controller.dart';

final profile = Get.find<ProfileController>();
Widget emailSent() {
  return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: [
        TextSpan(
            text: 'An Email is sent to: ',
            style: TextStyle(
              color: Colors.black,
            )),
        TextSpan(
            text: '${profile.merchant_info.value.email}',
            style: TextStyle(
                color: Color(0xff007C89), fontWeight: FontWeight.w500))
      ]));
}

Widget emailResponse() {
  return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: [
        TextSpan(
            text: 'Please check your email: ',
            style: TextStyle(
              color: Colors.black,
            )),
        TextSpan(
            text: '${profile.merchant_info.value.email}',
            style: TextStyle(
                color: Color(0xff007C89), fontWeight: FontWeight.w500))
      ]));
}

Widget emailError() {
  return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: [
        TextSpan(
            text:
                'Please try to check your internet connection and try again. ',
            style: TextStyle(
              color: Colors.black,
            )),
      ]));
}
