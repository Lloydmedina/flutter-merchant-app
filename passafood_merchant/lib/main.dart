import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:passafood_merchant/screens/login/screen_login.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    if (box.hasData("accessToken")) {}
    return GetMaterialApp(
      title: 'Passafood Merchant',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      getPages: [
        GetPage(name: '/home', page: () => LoginView()),
      ],
    );
  }
}

class AppRoutes {
  static final pages = [GetPage(name: '/', page: () => LoginView())];
}

class AppLinks {
  static const String LOGIN = "/login";
}
