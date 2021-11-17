// TODO Implement this library.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:merchant/controller/auth_controller.dart';
import 'package:merchant/controller/drawer_controller.dart';
import 'package:merchant/controller/profile_controller.dart';
import 'package:merchant/repository/auth_repo_imp.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final auth = Get.find<AuthRepositoryImplementation>();
  final profile = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
