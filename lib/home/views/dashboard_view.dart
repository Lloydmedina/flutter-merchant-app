import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:merchant/active_orders/views/active_orders_view.dart';
import 'package:merchant/earnings/views/earnings_view.dart';
import 'package:merchant/more/views/more_view.dart';
import 'package:merchant/preparation/views/preparation_view.dart';
import 'package:merchant/review/views/review_view.dart';
import 'package:merchant/staff/views/staff_view.dart';
import 'package:merchant/support/views/support_view.dart';

class DashboardView extends StatefulWidget {
  @override
  DashboardViewState createState() => DashboardViewState();
}

class DashboardViewState extends State<DashboardView> {
  bool resume = false;
  bool paused = true;
  bool closed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _dashboardBody(),
      appBar: _appBar(),
      floatingActionButton: _storeAvialability(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          Text(
            'Restaurant Name',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Store Location Address',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
      actions: [_buttonSwitch()],
    );
  }

  Widget _dashboardBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _earningsInfo(),
          SizedBox(
            height: 16,
          ),
          _services()
        ],
      ),
    );
  }

  Widget _buttonSwitch() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          _switchBranch(context);
        },
        child: Chip(
          deleteIcon: Icon(
            FeatherIcons.chevronDown,
            color: Colors.black,
          ),
          onDeleted: () {},
          label: Text(
            'Switch',
          ),
          labelStyle: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _earningsInfo() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 206,
      child: Center(
        child: Card(
          elevation: 1,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 14, bottom: 14, left: 16, right: 16),
            height: 184,
            width: 343,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Earnings Today',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                Text(
                  'PHP 12,000.00',
                  style: TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                _viewEarningsButton(),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Text(
                      'Orders Completed Today',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      ' 0',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _viewEarningsButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EarningsView();
        }));
      },
      child: Container(
        height: 36,
        width: 151,
        padding: EdgeInsets.only(left: 12, right: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Color(0xffFFDE00)),
        child: Row(
          children: [
            Text(
              'View Earnings',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            Icon(
              FeatherIcons.chevronRight,
              color: Colors.black,
              size: 17,
            )
          ],
        ),
      ),
    );
  }

  Widget _services() {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 25,
      children: [
        _servicesButtons('Oders', FeatherIcons.shoppingBag, true),
        _servicesButtons('Menu', FeatherIcons.clipboard, false),
        _servicesButtons('Staff', FeatherIcons.users, false),
        _servicesButtons('Prep Time', FeatherIcons.clock, false),
        _servicesButtons('Reviews', FeatherIcons.award, true),
        _servicesButtons('Support', FeatherIcons.helpCircle, false),
        _servicesButtons('More', FeatherIcons.moreHorizontal, false),
      ],
    );
  }

  Widget _servicesButtons(
    String label,
    IconData icon,
    bool showBadge,
  ) {
    return InkWell(
      onTap: () {
        _navigateServices(label);
      },
      child: Container(
        width: 66,
        child: Column(
          children: [
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xffEFEFF4), width: 1)),
              child: Center(
                child: Badge(
                  showBadge: showBadge,
                  badgeContent: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Text(
              label,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget _storeAvialability() {
    return Container(
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
    );
  }

  _navigateServices(String label) {
    if (label == 'Oders') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ActiveOrdersView();
      }));
    }
    if (label == 'Staff') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StaffView();
      }));
    }
    if (label == 'Prep Time') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PreparationView();
      }));
    }
    if (label == 'Reviews') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ReviewView();
      }));
    }
    if (label == 'Support') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SupportView();
      }));
    }
    if (label == 'More') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MoreView();
      }));
    }
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

  void _switchBranch(BuildContext context) {
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
            height: 235,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(FeatherIcons.x),
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          'Switch Branch',
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
                  onTap: () {},
                  title: Text(
                    'Restaurant Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Store Location Address',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  trailing: Icon(
                    FeatherIcons.check,
                    color: Colors.black,
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'Restaurant Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Store Location Address',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
