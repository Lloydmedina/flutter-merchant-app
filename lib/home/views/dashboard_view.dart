// ignore_for_file: unnecessary_statements, unrelated_type_equality_checks

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

class DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin<DashboardView> {
  bool resume = false;
  bool paused = true;
  bool closed = false;
  final profile = Get.find<ProfileController>();
  int selectedtab = 0;
  late AnimationController _controller;
  late Animation<dynamic> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween(begin: 0.0, end: 0.3).animate(_controller);
    profile.setStatus("0");
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

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
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(150, 80),
                      side: BorderSide(
                          width: 2,
                          color:
                              (selectedtab == 1) ? Colors.blue : Colors.grey),
                    ),
                    onPressed: () {
                      print("incomming order");
                      setState(() {
                        profile.setStatus("CPO");
                      });
                    },
                    child: Column(
                      children: [
                        // SvgPicture.asset('assets/images/Group13.png'),
                        Image.asset('assets/images/Group13.png'),
                        Text("INCOMMING ORDERS")
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(150, 100),
                      side: BorderSide(
                          width: 2,
                          color:
                              (selectedtab == 2) ? Colors.blue : Colors.grey),
                    ),
                    onPressed: () {
                      //profile.getOrderInProgressInfo();
                      print("orders in progress");
                      setState(() {
                        profile.setStatus("MAO");
                      });
                    },
                    child: Column(
                      children: [
                        //SvgPicture.asset('assets/images/orderpreparing.svg'),
                        Image.asset('assets/images/orderpreparing.png'),
                        Text("ORDER IN PROGRESS")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(180, 120),
                      side: BorderSide(
                          width: 2,
                          color:
                              (selectedtab == 3) ? Colors.blue : Colors.grey),
                    ),
                    onPressed: () {
                      // profile.getOrderInReadyInfo();
                      print("order ready");
                      setState(() {
                        profile.setStatus("MOR");
                      });
                    },
                    child: Column(
                      children: [
                        //SvgPicture.asset(
                        //'assets/images/order-riderontheway.svg'),
                        Image.asset('assets/images/order-riderontheway.png'),
                        Text("ORDER READY")
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(150, 100),
                      side: BorderSide(
                          width: 2,
                          color:
                              (selectedtab == 4) ? Colors.blue : Colors.grey),
                    ),
                    onPressed: () {
                      // profile.getOrderCompletedInfo();
                      print("orders completed");
                      setState(() {
                        profile.setStatus("RPO");
                      });
                    },
                    child: Column(
                      children: [
                        //SvgPicture.asset('assets/images/order-waiting.svg'),
                        Image.asset('assets/images/order-waiting.png'),
                        Text("ORDERS COMPLETED")
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        profile.setStatus("0");
                      });
                    },
                    child: Text("Recent Activity"),
                  )),
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
          _ordersData()
          // FutureBuilder(
          //   future: _playAnimation(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     return SlideTransition(
          //         position:
          //             Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
          //                 .animate(_controller),
          //         //FadeTransition(
          //         // opacity: Tween(begin: 0.0, end: 1.0).animate(_controller),
          //         //child: Text("dta"));
          //         child: _ordersData());
          //   },
          // )
        ],
      ),
    ));
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  Widget _services(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(150, 80),
                  side: BorderSide(
                      width: 2,
                      color: (selectedtab == 1) ? Colors.blue : Colors.grey),
                ),
                onPressed: () {
                  print("incomming order");
                  setState(() {
                    // selectedWidgetMarker = WidgetMarker.btn_incommingOrders;
                    // profile.order_completed_info();
                  });
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
                  print("orders in progress");
                  setState(() {
                    // selectedWidgetMarker = WidgetMarker.btn_ordersInProgess;
                  });
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
                  print("order ready");
                  setState(() {
                    //selectedWidgetMarker = WidgetMarker.btn_orderReady;
                  });
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
                  print("orders completed");
                  setState(() {
                    //selectedWidgetMarker = WidgetMarker.btn_orderComplete;
                  });
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
      onTap: () {},
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

  Widget _ordersData() {
    return SingleChildScrollView(
      child: Container(
          child: GetBuilder<ProfileController>(
        init: ProfileController(),
        initState: (_) {},
        builder: (_) {
          return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.all(0),
                  child: ListTile(
                    onLongPress: () {
                      _.selected = index;
                    },
                    // leading:
                    title: Text(
                        "${_.order_info.resultObject![index].referenceNo}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            _.order_info.resultObject![index].riderName ==
                                    "null"
                                ? "Rider: " +
                                    "${_.order_info.resultObject![index].riderName}"
                                : "No rider assigned.",
                            style: TextStyle(color: Colors.black)),
                        Text(
                            "Order From: " +
                                "${_.order_info.resultObject![index].clientName}",
                            style: TextStyle(color: Colors.black)),
                        RichText(
                            text: TextSpan(
                          children: [
                            // TextSpan(
                            //     text: _.order_info.resultObject![index]
                            //                 .items![index].quantiy !=
                            //             "0"
                            //         ? "Items " + "0"
                            //         : "Items " +
                            //             "${profile.order_info.resultObject![index].items![index].quantiy}",
                            //     style: TextStyle(color: Colors.black54)),
                            TextSpan(
                                text:
                                    "${_.order_info.resultObject![index].items![index].quantiy}")
                          ],
                        ))
                      ],
                    ),

                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("${_.order_info.resultObject![index].status}"),
                        Text(
                            "₱" +
                                "${_.order_info.resultObject![index].items![index].totalAmount}",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                            )),
                        Text(
                          "${_.order_info.resultObject![index].date}" +
                              ", " +
                              "${_.order_info.resultObject![index].time}",
                          softWrap: true,
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: _.order_info.resultObject == null
                  ? 0
                  : _.order_info.resultObject!.length);
        },
      )),
    );
  }
}
