import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class EditStoreHoursView extends StatefulWidget {
  @override
  EditStoreHoursViewState createState() => EditStoreHoursViewState();
}

class EditStoreHoursViewState extends State<EditStoreHoursView> {
  bool sun = false;
  bool mon = true;
  bool tue = true;
  bool wed = true;
  bool thu = true;
  bool fri = true;
  bool sat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _editStoreHrBody(),
      bottomNavigationBar: _saveHours(),
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
        'Edit Store Open Hours',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      actions: [_editButton()],
    );
  }

  Widget _editButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {},
        child: Text(
          'Edit',
          style: TextStyle(
              color: Color(0xff007C89),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _editStoreHrBody() {
    return SingleChildScrollView(
      child: Column(
        children: [_editStoreHrTip(), _dayList()],
      ),
    );
  }

  Widget _editStoreHrTip() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0xffFFDE00).withOpacity(.100),
            borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tips for store cuisine type',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff007C89),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'For a better store profile make sure that all cuisine tags you added to your store info are what your store is offering to avoid any misconception to customers. ',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff007C89),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _dayList() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        physics: NeverScrollableScrollPhysics(),
        primary: false,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mon',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '12:00 AM - 12:00 PM',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CupertinoSwitch(
                      onChanged: (value) {
                        setState(() {
                          mon = value;
                        });
                      },
                      value: mon,
                      // activeColor: Colors.white,
                      // trackColor: Colors.green,
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tue',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '12:00 AM - 12:00 PM',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CupertinoSwitch(
                      onChanged: (value) {
                        setState(() {
                          tue = value;
                        });
                      },
                      value: tue,
                      // activeColor: Colors.white,
                      // trackColor: Colors.green,
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wed',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '12:00 AM - 12:00 PM',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CupertinoSwitch(
                      onChanged: (value) {
                        setState(() {
                          wed = value;
                        });
                      },
                      value: wed,
                      // activeColor: Colors.white,
                      // trackColor: Colors.green,
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thu',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '12:00 AM - 12:00 PM',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CupertinoSwitch(
                      onChanged: (value) {
                        setState(() {
                          thu = value;
                        });
                      },
                      value: thu,
                      // activeColor: Colors.white,
                      // trackColor: Colors.green,
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fri',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '12:00 AM - 12:00 PM',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CupertinoSwitch(
                      onChanged: (value) {
                        setState(() {
                          fri = value;
                        });
                      },
                      value: fri,
                      // activeColor: Colors.white,
                      // trackColor: Colors.green,
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sat',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '12:00 AM - 12:00 PM',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CupertinoSwitch(
                      onChanged: (value) {
                        setState(() {
                          sat = value;
                        });
                      },
                      value: sat,
                      // activeColor: Colors.white,
                      // trackColor: Colors.green,
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sun',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '12:00 AM - 12:00 PM',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CupertinoSwitch(
                      onChanged: (value) {
                        setState(() {
                          sun = value;
                        });
                      },
                      value: sun,
                      // activeColor: Colors.white,
                      // trackColor: Colors.green,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Builder _saveHours() {
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
            onPressed: () {},
            child: Text(
              'SAVE',
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
}
