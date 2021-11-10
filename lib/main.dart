import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';
import 'package:merchant/binding/initial_binding.dart';
import 'package:merchant/binding/login_binding.dart';
import 'package:merchant/home/views/home_view.dart';
import 'package:merchant/login/views/forgot_password_view.dart';
import 'package:merchant/login/views/login_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:merchant/utils/api_config.dart';

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
  API_CONFIG api_config =
      new API_CONFIG(BUILD_TYPE: Build.DEVELOPMENT); //-global URI
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    if (box.hasData("accessToken")) {
      // pr
    }
    return GetMaterialApp(
      title: 'Passafood Merchant Mobile',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      getPages: [
        GetPage(
            name: '/',
            page: () {
              return box.hasData("accessToken") ? HomeView() : LoginView();
            },
            binding: InitialBinding()),
        GetPage(
            name: "/dash", page: () => LoginView(), binding: LoginBinding()),
        GetPage(name: "/home", page: () => HomeView()),
        GetPage(name: "/forgot_password", page: () => ForgotPasswordView()),
      ],
      initialRoute: '/',
    );
  }
}

class AppRoutes {
  static final pages = [GetPage(name: '/login', page: () => LoginView())];
}

class AppLinks {
  static const String LOGIN = "/login";
  static const String SIGN_UP = "/login";
}
