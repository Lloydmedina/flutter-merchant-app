// TODO Implement this library.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:merchant/controller/auth_controller.dart';
import 'package:merchant/controller/drawer_controller.dart';

class MyDrawer extends StatelessWidget {
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
              title: Text(
                "Drawer Header",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "Hello",
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
}
