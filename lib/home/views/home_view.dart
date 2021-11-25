import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:merchant/account/account_view.dart';
import 'package:merchant/controller/auth_controller.dart';
import 'package:merchant/controller/profile_controller.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:merchant/home/views/dashboard_view.dart';

import 'package:merchant/repository/auth_repo_imp.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final auth = Get.find<AuthRepositoryImplementation>();
  final profile = Get.find<ProfileController>();
  bool resume = false;
  bool paused = true;
  bool closed = false;

  int _selectedIndex = 0;

  final List<Widget> _children = [DashboardView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPictureSize: const Size.square(50),
              decoration: BoxDecoration(color: Colors.amber),
              currentAccountPicture: new CircleAvatar(
                child: Icon(
                  FeatherIcons.user,
                ),
                backgroundColor: Colors.white,
              ),
              accountName: Obx(() {
                return Text(
                  "${profile.store_info.value.company}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Poppins"),
                );
              }),
              accountEmail: Obx(() {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${profile.store_info.value.landMark}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                        child: Text(
                            "${profile.merchant_info.value.firstName} " +
                                " ${profile.merchant_info.value.lastName}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis))),
                  ],
                );
              }),
            ),
            ListTile(
              leading: Icon(FeatherIcons.user),
              title: Text('Account',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              onTap: () {
                Get.toNamed("/account");
              },
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
      body: Container(
        child: DashboardView(),
      ),
      bottomNavigationBar: _storeAvialability(),
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

  BottomAppBar _storeAvialability() {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        width: MediaQuery.of(context).size.width,
        height: 70,
        color: closed
            ? Color(0xffFF7309)
            : resume
                ? Color(0xff009D59)
                : paused
                    ? Color(0xff4285F4)
                    : Color(0xffFF7309),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  closed
                      ? 'Closed'
                      : resume
                          ? 'Accepting Orders'
                          : paused
                              ? 'Paused'
                              : 'Closed',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  closed
                      ? 'Store is closed until resume'
                      : resume
                          ? 'Open until 10:30 PM'
                          : paused
                              ? 'Will open at 9:30 AM, Aug 13 '
                              : 'Store is closed until resume',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            ),
            InkWell(
              onTap: () {
                _selectStoreAvialability(context);
              },
              child: Icon(
                FeatherIcons.moreVertical,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onStoreChanged(String avialability) {
    if (avialability == "Resume") {
      setState(() {
        resume = true;
        paused = false;
        closed = false;
      });
    }
    if (avialability == "Paused") {
      setState(() {
        resume = false;
        paused = true;
        closed = false;
      });
    }
    if (avialability == "Closed") {
      setState(() {
        resume = false;
        paused = false;
        closed = true;
      });
    }
  }

  void _selectStoreAvialability(BuildContext context) {
    showModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.40),
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(50.0),
                    topRight: const Radius.circular(50.0))),
            padding: EdgeInsets.all(16),
            height: 325,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(FeatherIcons.x),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          'Store Availability',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                ListTile(
                  onTap: () {
                    _onStoreChanged('Resume');
                    Navigator.pop(context);
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff009D59)),
                      )
                    ],
                  ),
                  title: Text(
                    'Resume',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Continue receiving orders',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  trailing: resume
                      ? Icon(
                          FeatherIcons.check,
                          color: Colors.black,
                        )
                      : null,
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    _onStoreChanged('Paused');
                    Navigator.pop(context);
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff4285F4)),
                      )
                    ],
                  ),
                  title: Text(
                    'Paused',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: paused
                      ? Icon(
                          FeatherIcons.check,
                          color: Colors.black,
                        )
                      : null,
                  subtitle: Text(
                    'Stop incoming orders',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    _onStoreChanged('Closed');
                    Navigator.pop(context);
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffFF7309)),
                      )
                    ],
                  ),
                  title: Text(
                    'Closed',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Store closed until it resumes',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  trailing: closed
                      ? Icon(
                          FeatherIcons.check,
                          color: Colors.black,
                        )
                      : null,
                ),
              ],
            ),
          );
        });
  }

  void doLogout() {
    AuthController().signOut();
    //print('sss');
  }

  @override
  void initState() {
    final storage = GetStorage();
    if (storage.hasData('accessToken')) {
      print('Merchant data loaded');
      profile.getProfileInfo();
    }
    super.initState();
  }
}
