import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';
import 'package:merchant/home/views/home_view.dart';
import 'package:merchant/login/views/forgot_password_view.dart';
import 'package:merchant/login/views/login_view.dart';
import 'package:get_storage/get_storage.dart';

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
    return GetMaterialApp(
      title: 'Passafood Rider',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      getPages: [
        GetPage(
          name: '/',
          page: () {
            return box.hasData("accessToken") ? HomeView() : LoginView();
          },
        ),
        GetPage(name: "/home", page: () => HomeView()),
        GetPage(name: "/forgot_password", page: () => ForgotPasswordView()),
      ],
      initialRoute: '/',
    );
  }
}

class AppRoutes {
  static final pages = [
    GetPage(name: '/login', page: () => LoginView()),
  ];
}

class AppLinks {
  static const String LOGIN = "/login";
  static const String SIGN_UP = "/login";
}
