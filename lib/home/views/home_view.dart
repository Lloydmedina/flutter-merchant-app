import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:merchant/account/account_view.dart';
import 'package:merchant/controller/auth_controller.dart';
import 'package:merchant/controller/profile_controller.dart';
import 'package:merchant/home/views/dashboard_view.dart';
import 'package:merchant/home/views/drawer_view.dart';
import 'package:merchant/repository/auth_repo_imp.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final auth = Get.find<AuthRepositoryImplementation>();
  final profile = Get.find<ProfileController>();
  int _selectedIndex = 0;
  final List<Widget> _children = [DashboardView(), AccountView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: ListTile(
                title: Obx(() {
                  return Text(
                    "${profile.merchant_info.value.email}",
                    style: TextStyle(color: Colors.white),
                  );
                }),
                subtitle: Text(
                  "Merchant Id:",
                  style: TextStyle(color: Colors.white),
                ),
                leading: CircleAvatar(
                  child: Icon(Icons.perm_identity_outlined),
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(FeatherIcons.logOut),
              title: Text('Sign Out',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              onTap: () {
                doLogout();
              },
            ),
          ],
        ),
      ),
      body: _children[_selectedIndex],
      //bottomNavigationBar: _bottomAppBar(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 20,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    );
  }

  void doLogout() {
    AuthController().signOut();
    //print('sss');
  }

  @override
  void initState() {
    final storage = GetStorage();
    if (storage.hasData('accessToken')) {
      print('Driver data loaded');
      profile.getProfileInfo();
    }
    super.initState();
  }
}
