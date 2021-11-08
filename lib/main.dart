import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merchant/home/views/home_view.dart';
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

class _MyAppState extends StatelessWidget {
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
         //   binding: InitialBinding()),
        //GetPage(
         //   name: "/dash", page: () => LoginView(), binding: LoginBinding()),
        // GetPage(
        //     name: "/login", page: () => LoginView(), binding: LoginBinding()),
        // GetPage(
        //     name: "/sign_up_initial_checking",
        //     page: () => RegistrationInitialChecking(),
        //     binding: ForgotPasswordBinding()),
        // GetPage(
        //     name: "/sign_up_initial_checking/verify",
        //     page: () => VerifyInitialCheckingView(),
        //     binding: ForgotPasswordBinding()),
        // GetPage(
        //     name: "/sign_up",
        //     page: () => RegistrationGetStartedView(),
        //     binding: RegistrationBinding()),
        // GetPage(
        //     name: "/sign_up/basic_information",
        //     page: () => RegistrationBasicInformationView(),
        //     binding: RegistrationBinding()),
        // GetPage(
        //     name: "/sign_up/photo_identification",
        //     page: () => RegistrationPhotoIdentificationView(),
        //     binding: RegistrationBinding()),
        // GetPage(
        //     name: "/sign_up/supporting_documents",
        //     page: () => RegistrationSupportingDocumentView(),
        //     binding: RegistrationBinding()),
        // GetPage(
        //     name: "/sign_up/vehicle_information",
        //     page: () => RegistrationVehicleInformationView(),
        //     binding: RegistrationBinding()),
        // GetPage(name: "/success", page: () => SuccessView()),
        // GetPage(
        //     name: "/forgot_password/set_new_password",
        //     page: () => SetNewPassword()),
        // GetPage(
        //     name: "/forgot_password",
        //     page: () => ForgotPasswordView(),
        //     binding: ForgotPasswordBinding()),
        // GetPage(name: "/otp", page: () => OtpView()),
        // GetPage(
        //     name: "/otpPage",
        //     page: () => OtpPage("639394300929"),
        //     binding: ForgotPasswordBinding()),
        // GetPage(
        //     name: "/set_new_password",
        //     page: () => SetNewPassword(),
        //     binding: ForgotPasswordBinding()),
        // GetPage(name: "/home", page: () => DashBoardView()),
        // GetPage(name: "/account", page: () => AccountView()),
        // GetPage(name: "/account/detail", page: () => DriverAccountDetailView()),
        // GetPage(
        //     name: "/requirement", page: () => RequirementMainSelectorView()),
        // GetPage(name: "/wallet", page: () => WalletView()),
        // GetPage(name: "/wallet_new", page: () => WalletHistoryView()),
        // GetPage(name: "/earning", page: () => AccountView()),
        // GetPage(name: "/topuphistory", page: () => TopUpHistoryDetails()),
        GetPage(name: "/home", page: () => HomeView()),
        ) 
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
