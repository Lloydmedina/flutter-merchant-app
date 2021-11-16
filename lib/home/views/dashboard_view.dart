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
      floatingActionButton: _storeAvialability(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _dashboardBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _services(),
        ],
      ),
    );
  }

  Widget _services() {
    return Column(
      children: [
        Row(
          children: [
            _servicesButtons('Incoming Orders', FeatherIcons.shoppingBag, true),
            _servicesButtons(
                'Orders in Progress', FeatherIcons.clipboard, false),
          ],
        ),
        Row(
          children: [
            _servicesButtons('Order Ready', FeatherIcons.users, false),
            _servicesButtons('Orders Complete', FeatherIcons.clock, false),
          ],
        ),
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
        width: 180,
        child: Column(
          children: [
            Container(
              width: 400,
              height: 100,
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
