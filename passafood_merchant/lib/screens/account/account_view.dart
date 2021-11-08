import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class AccountView extends StatefulWidget {
  @override
  AccountViewState createState() => AccountViewState();
}

class AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _accountBody(),
    );
  }

  Widget _accountBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _userInfo(),
            SizedBox(
              height: 8,
            ),
            _accountService(),
            SizedBox(
              height: 8,
            ),
            _signout()
          ],
        ),
      ),
    );
  }

  Widget _userInfo() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 65,
            height: 65,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffEFEFF4)),
            child: Center(
              child: Icon(
                FeatherIcons.user,
                size: 35,
              ),
            ),
          ),
          Text(
            'John Doe',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            'storeowner@passafood.co',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          Text(
            '+639287130991',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          Text(
            '+Owner',
            style: TextStyle(
                color: Color(0xff007C89),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _accountService() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              children: [
                Icon(FeatherIcons.bookOpen),
                SizedBox(
                  width: 17,
                ),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              children: [
                Icon(FeatherIcons.bookOpen),
                SizedBox(
                  width: 17,
                ),
                Text(
                  'Terms Of Service',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Row(
              children: [
                Icon(FeatherIcons.settings),
                SizedBox(
                  width: 17,
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _signout() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      child: Text(
        'Sign out account',
        style: TextStyle(
            color: Color(0xff007C89),
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
