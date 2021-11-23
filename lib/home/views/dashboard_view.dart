import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:merchant/active_orders/views/active_orders_view.dart';
import 'package:merchant/controller/profile_controller.dart';
import 'package:merchant/earnings/views/earnings_view.dart';
import 'package:merchant/more/views/more_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final profile = Get.find<ProfileController>();
  int selectedtab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _dashboardBody(),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        children: [
          _storeEarning(),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget _dashboardBody() {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          _services(),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text("Recent Activity"),
                  ),
                  Container(
                    child: InkWell(
                      child: Text("See All"),
                      // onTap: () =>
                      //     {Get.toNamed(PassaRoute.WALLET_TRANSACTION_ALL)}
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 5,
            thickness: 2,
          ),
          _incommingOrders()
        ],
      ),
    ));
  }

  Widget _services() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Column(
        children: [
          Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(150, 80),
                  side: BorderSide(
                      width: 2,
                      color: (selectedtab == 1) ? Colors.blue : Colors.grey),
                ),
                onPressed: () {
                  print("incomming order");
                },
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/order-through.svg'),
                    Text("INCOMMING ORDERS")
                  ],
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(150, 100),
                  side: BorderSide(
                      width: 2,
                      color: (selectedtab == 2) ? Colors.blue : Colors.grey),
                ),
                onPressed: () {
                  print("incomming order");
                },
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/orderpreparing.svg'),
                    Text("ORDER IN PROGRESS")
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(150, 100),
                  side: BorderSide(
                      width: 2,
                      color: (selectedtab == 3) ? Colors.blue : Colors.grey),
                ),
                onPressed: () {
                  print("incomming order");
                },
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/order-riderontheway.svg'),
                    Text("ORDER READY")
                  ],
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(150, 100),
                  side: BorderSide(
                      width: 2,
                      color: (selectedtab == 4) ? Colors.blue : Colors.grey),
                ),
                onPressed: () {
                  print("incomming order");
                },
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/order-waiting.svg'),
                    Text("ORDERS COMPLETED")
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
                    '2',
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

  Widget _storeEarning() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: MediaQuery.of(context).size.width,
      height: 70,
      color: Colors.grey,
      child: Text("Earnings:",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600)),
    );
  }

  _navigateServices(String label) {
    if (label == 'Incoming Orders') {
      return _incommingOrders();
    }
    if (label == 'Orders in Progress') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StaffView();
      }));
    }
    if (label == 'Order Ready') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PreparationView();
      }));
    }
    if (label == 'Orders Complete') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ReviewView();
      }));
    }
  }

  Widget _incommingOrders() {
    var res;
    if (profile.order_info.value.resultObject == null) {
      res = Container(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Text("Data Not Found"),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 1));
    } else {
      res = SingleChildScrollView(
          child: Container(
        child: Obx(() => ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  children: [
                    Text(profile.order_info.value.resultObject == null
                        ? "Data Not Found "
                        : "${profile.order_info.value.resultObject![index].id}"),
                    Text(profile.order_info.value.resultObject == null
                        ? "Data Not Found "
                        : "${profile.order_info.value.resultObject![index].clientName}"),
                    Text(profile.order_info.value.resultObject == null
                        ? "Data Not Found "
                        : "${profile.order_info.value.resultObject![index].merchantName}")
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: profile.order_info.value.resultObject == null
                ? 1
                : profile.order_info.value.resultObject!.length > 5
                    ? 5
                    : profile.order_info.value.resultObject!.length)),
      ));
    }
    return res;
  }

  Widget _inProgressOrders() {
    return ListView(
      children: [Text("in progress oder")],
    );
  }

  Widget _readyOrders() {
    return ListView(
      children: [Text("ready oder")],
    );
  }

  Widget _completeOrders() {
    return ListView(
      children: [Text("complete oder")],
    );
  }
}
