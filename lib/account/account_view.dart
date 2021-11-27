import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:merchant/controller/auth_controller.dart';
import 'package:merchant/controller/email_controller.dart';
import 'package:merchant/controller/profile_controller.dart';
import 'package:merchant/utils/custom_dialog.dart';
import 'package:merchant/utils/email_sent.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountView extends StatefulWidget {
  @override
  AccountViewState createState() => AccountViewState();
}

class AccountViewState extends State<AccountView> {
  final profile = Get.find<ProfileController>();
  final emailService = Get.find<EmailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: new Text('Account',
            style: TextStyle(
              color: Colors.black,
            )),
        actions: [
          // action button
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.close_sharp),
          onPressed: () {
            //Navigator.pop(context);
            Get.back();
          },
        ),
      ),
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
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffEFEFF4)),
                child: Center(
                  child: Icon(
                    FeatherIcons.user,
                    size: 35,
                  ),
                ),
              ),
              Text(
                "${profile.merchant_info.value.firstName} " +
                    " ${profile.merchant_info.value.lastName}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '${profile.merchant_info.value.email}',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              Text(
                '${profile.merchant_info.value.mobileNumber}',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          )),
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
                Icon(FeatherIcons.edit),
                SizedBox(
                  width: 17,
                ),
                InkWell(
                  splashColor: Colors.yellow,
                  highlightColor: Colors.green,
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Color(0xff007C89),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog(
                            enableCloseButton: true,
                            closeButtonText: "OK",
                            title: "Passafood says",
                            onPressedAgreeButton: () {},
                            content: appLaunch(),
                            onPressedCloseButton: () {
                              // doemail();
                              launchURL('https://passafood.co');
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                          );
                        });
                  },
                ),
              ],
            ),
          ),
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
        child: InkWell(
          child: Text(
            'Sign out account',
            style: TextStyle(
                color: Color(0xff007C89),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          onTap: () {
            doLogout();
          },
        ));
  }

  void doLogout() {
    AuthController().signOut();
    //print('sss');
  }

  void doemail() async {
    await emailService.sendToEmali();

    if (emailService.email_response.resultObject == 'Ok') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              enableCloseButton: true,
              closeButtonText: "OK",
              title: "Email Successfuly sent.",
              onPressedAgreeButton: () {},
              content: emailResponse(),
              onPressedCloseButton: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              enableCloseButton: true,
              closeButtonText: "OK",
              title: "Opps! Something went wrong.",
              onPressedAgreeButton: () {},
              content: emailError(),
              onPressedCloseButton: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            );
          });
    }
  }

  void launchURL(String urlLinkAdd) async {
    print(urlLinkAdd);
    if (!await canLaunch(urlLinkAdd)) {
      await launch(urlLinkAdd);
    } else {
      throw 'Could not launch $urlLinkAdd';
    }
  }
}
