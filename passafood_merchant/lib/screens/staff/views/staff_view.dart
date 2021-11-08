import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:merchant/staff/views/add_new_staff.dart';
import 'package:merchant/staff/views/edit_staff.dart';

class StaffView extends StatefulWidget {
  @override
  StaffViewState createState() => StaffViewState();
}

class StaffViewState extends State<StaffView> {
  bool noStaff = false;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _staffBody(),
      bottomNavigationBar: _addStaff(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          FeatherIcons.arrowLeft,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Staff',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _staffBody() {
    return SingleChildScrollView(
      child: Column(
        children: [_staffHeader(), _staffList()],
      ),
    );
  }

  Widget _staffHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Staff Management',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            'Add other users such as your cashiers to help you manage with your store.',
            style: TextStyle(fontSize: 14, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget _staffList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: noStaff
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Staff',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'There are no staffs added to your store yet, tap the add staff button to add one now.',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )
              ],
            )
          : Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return EditStaff();
                        }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 26,
                                width: 26,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffEFEFF4),
                                ),
                                child: Icon(
                                  FeatherIcons.user,
                                  color: Colors.black,
                                  size: 16,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Staff Name',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'staff1@passafood.co',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  Text(
                                    'Manager',
                                    style: TextStyle(
                                        color: Color(0xff007C89),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CupertinoSwitch(
                            onChanged: toggleSwitch,
                            value: isSwitched,
                            // activeColor: Colors.white,
                            // trackColor: Colors.green,
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 4)),
    );
  }

  Builder _addStaff() {
    return Builder(
      builder: (context) => BottomAppBar(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xffFFDE00),
              minimumSize: Size(345, 55),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddNewStaff();
              }));
              // setState(() {
              //   _orderComplete = true;
              // });
            },
            child: Text(
              'ADD STAFF',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }
}
