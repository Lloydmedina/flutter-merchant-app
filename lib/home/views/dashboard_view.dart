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

enum WidgetMarker {
  btn_datasOrder,
  btn_incommingOrders,
  btn_ordersInProgess,
  btn_orderReady,
  btn_orderComplete
}

class DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin<DashboardView> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.btn_datasOrder;
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
    profile.order_info();
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
                      profile.getIncommingOrderInfo();
                      print("incomming order");
                      setState(() {
                        selectedWidgetMarker = WidgetMarker.btn_incommingOrders;
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
                      profile.getOrderInProgressInfo();
                      print("orders in progress");
                      setState(() {
                        selectedWidgetMarker = WidgetMarker.btn_ordersInProgess;
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
                      profile.getOrderInReadyInfo();
                      print("order ready");
                      setState(() {
                        selectedWidgetMarker = WidgetMarker.btn_orderReady;
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
                      profile.getOrderCompletedInfo();
                      print("orders completed");
                      setState(() {
                        selectedWidgetMarker = WidgetMarker.btn_orderComplete;
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
                        selectedWidgetMarker = WidgetMarker.btn_datasOrder;
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
          FutureBuilder(
            future: _playAnimation(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
                          .animate(_controller),
                  //FadeTransition(
                  // opacity: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: widgetLoader());
            },
          )
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
                    selectedWidgetMarker = WidgetMarker.btn_incommingOrders;
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
                    selectedWidgetMarker = WidgetMarker.btn_ordersInProgess;
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
                    selectedWidgetMarker = WidgetMarker.btn_orderReady;
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
                    selectedWidgetMarker = WidgetMarker.btn_orderComplete;
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

  Widget widgetLoader() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.btn_datasOrder:
        return _ordersData();
      case WidgetMarker.btn_incommingOrders:
        return _incommingOrders();
      case WidgetMarker.btn_ordersInProgess:
        return _inProgressOrders();
      case WidgetMarker.btn_orderReady:
        return _readyOrders();
      case WidgetMarker.btn_orderComplete:
        return _completeOrders();
    }
    return widgetLoader();
  }

  Widget _ordersData() {
    var res;
    if (profile.order_info.value.resultObject == null) {
      res = Container(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Text("No activities ."),
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
              return Card(
                elevation: 2,
                margin: EdgeInsets.all(0),
                child: ListTile(
                  onLongPress: () {
                    profile.selected = index;
                  },
                  // leading:
                  title: Text(
                      "${profile.order_info.value.resultObject![index].referenceNo}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          profile.order_info.value.resultObject![index]
                                      .riderName ==
                                  "null"
                              ? "Rider: " +
                                  "${profile.order_info.value.resultObject![index].riderName}"
                              : "No rider assigned.",
                          style: TextStyle(color: Colors.black)),
                      Text(
                          "Order From: " +
                              "${profile.order_info.value.resultObject![index].clientName}",
                          style: TextStyle(color: Colors.black)),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: profile
                                          .order_info
                                          .value
                                          .resultObject![index]
                                          .items![index]
                                          .qunatity !=
                                      "0"
                                  ? "Items " + "0"
                                  : "Items " +
                                      "${profile.order_info.value.resultObject![index].items![index].qunatity}",
                              style: TextStyle(color: Colors.black54)),
                          TextSpan(
                              text:
                                  "${profile.order_info.value.resultObject![index].items![index].qunatity}")
                        ],
                      ))
                    ],
                  ),

                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          "${profile.order_info.value.resultObject![index].status}"),
                      Text(
                          "₱" +
                              "${profile.order_info.value.resultObject![index].items![index].price}",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                          )),
                      Text(
                        "${profile.order_info.value.resultObject![index].date}" +
                            ", " +
                            "${profile.order_info.value.resultObject![index].time}",
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
            itemCount: profile.order_info.value.resultObject == null
                ? 1
                : profile.order_info.value.resultObject!.length > 5
                    ? 5
                    : profile.order_info.value.resultObject!.length)),
      ));
    }
    return res;
  }

  Widget _incommingOrders() {
    var res;
    if (profile.order_incomming.value.resultObject == null) {
      res = Container(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Text("No Incomming Orders."),
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
              return Card(
                elevation: 2,
                margin: EdgeInsets.all(0),
                child: ListTile(
                  onLongPress: () {
                    profile.selected = index;
                  },
                  // leading:
                  title: Text(
                      "${profile.order_incomming.value.resultObject![index].referenceNo}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          profile.order_incomming.value.resultObject![index]
                                      .riderName ==
                                  "null"
                              ? "Rider: " +
                                  "${profile.order_incomming.value.resultObject![index].riderName}"
                              : "No rider assigned.",
                          style: TextStyle(color: Colors.black)),
                      Text(
                          "Order From: " +
                              "${profile.order_incomming.value.resultObject![index].clientName}",
                          style: TextStyle(color: Colors.black)),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: profile
                                          .order_incomming
                                          .value
                                          .resultObject![index]
                                          .items![index]
                                          .qunatity !=
                                      "0"
                                  ? "Items " + "0"
                                  : "Items " +
                                      "${profile.order_incomming.value.resultObject![index].items![index].qunatity}",
                              style: TextStyle(color: Colors.black54)),
                          TextSpan(
                              text:
                                  "${profile.order_incomming.value.resultObject![index].items![index].qunatity}")
                        ],
                      ))
                    ],
                  ),

                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          "${profile.order_incomming.value.resultObject![index].status}"),
                      Text(
                          "₱" +
                              "${profile.order_incomming.value.resultObject![index].items![index].price}",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                          )),
                      Text(
                        "${profile.order_incomming.value.resultObject![index].date}" +
                            ", " +
                            "${profile.order_incomming.value.resultObject![index].time}",
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
            itemCount: profile.order_info.value.resultObject == null
                ? 1
                : profile.order_info.value.resultObject!.length > 50
                    ? 50
                    : profile.order_info.value.resultObject!.length)),
      ));
    }
    return res;
  }

  Widget _inProgressOrders() {
    var res;
    if (profile.order_in_progress_info.value.resultObject == null) {
      res = Container(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Text("No Orders In Progress."),
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
              return Card(
                elevation: 2,
                margin: EdgeInsets.all(0),
                child: ListTile(
                  onLongPress: () {
                    profile.selected = index;
                  },
                  // leading:
                  title: Text(
                      "${profile.order_in_progress_info.value.resultObject![index].referenceNo}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          profile.order_in_progress_info.value
                                      .resultObject![index].riderName ==
                                  "null"
                              ? "Rider: " +
                                  "${profile.order_in_progress_info.value.resultObject![index].riderName}"
                              : "No rider assigned.",
                          style: TextStyle(color: Colors.black)),
                      Text(
                          "Order From: " +
                              "${profile.order_in_progress_info.value.resultObject![index].clientName}",
                          style: TextStyle(color: Colors.black)),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: profile
                                          .order_in_progress_info
                                          .value
                                          .resultObject![index]
                                          .items![index]
                                          .qunatity !=
                                      "0"
                                  ? "Items " + "0"
                                  : "Items " +
                                      "${profile.order_in_progress_info.value.resultObject![index].items![index].qunatity}",
                              style: TextStyle(color: Colors.black54)),
                          TextSpan(
                              text:
                                  "${profile.order_in_progress_info.value.resultObject![index].items![index].qunatity}")
                        ],
                      ))
                    ],
                  ),

                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          "${profile.order_in_progress_info.value.resultObject![index].status}"),
                      Text(
                          "₱" +
                              "${profile.order_in_progress_info.value.resultObject![index].items![index].price}",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                          )),
                      Text(
                        "${profile.order_in_progress_info.value.resultObject![index].date}" +
                            ", " +
                            "${profile.order_in_progress_info.value.resultObject![index].time}",
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
            itemCount: profile.order_in_progress_info.value.resultObject == null
                ? 1
                : profile.order_in_progress_info.value.resultObject!.length > 50
                    ? 50
                    : profile
                        .order_in_progress_info.value.resultObject!.length)),
      ));
    }
    return res;
  }

  Widget _readyOrders() {
    var res;
    if (profile.order_ready_info.value.resultObject == null) {
      res = Container(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Text("No Ready Orders."),
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
              return Card(
                elevation: 2,
                margin: EdgeInsets.all(0),
                child: ListTile(
                  onLongPress: () {
                    profile.selected = index;
                  },
                  // leading:
                  title: Text(
                      "${profile.order_ready_info.value.resultObject![index].referenceNo}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          profile.order_ready_info.value.resultObject![index]
                                      .riderName ==
                                  "null"
                              ? "Rider: " +
                                  "${profile.order_ready_info.value.resultObject![index].riderName}"
                              : "No rider assigned.",
                          style: TextStyle(color: Colors.black)),
                      Text(
                          "Order From: " +
                              "${profile.order_ready_info.value.resultObject![index].clientName}",
                          style: TextStyle(color: Colors.black)),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: profile
                                          .order_ready_info
                                          .value
                                          .resultObject![index]
                                          .items![index]
                                          .qunatity !=
                                      "0"
                                  ? "Items " + "0"
                                  : "Items " +
                                      "${profile.order_ready_info.value.resultObject![index].items![index].qunatity}",
                              style: TextStyle(color: Colors.black54)),
                          TextSpan(
                              text:
                                  "${profile.order_ready_info.value.resultObject![index].items![index].qunatity}")
                        ],
                      ))
                    ],
                  ),

                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          "${profile.order_ready_info.value.resultObject![index].status}"),
                      Text(
                          "₱" +
                              "${profile.order_ready_info.value.resultObject![index].items![index].price}",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                          )),
                      Text(
                        "${profile.order_ready_info.value.resultObject![index].date}" +
                            ", " +
                            "${profile.order_ready_info.value.resultObject![index].time}",
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
            itemCount: profile.order_ready_info.value.resultObject == null
                ? 1
                : profile.order_ready_info.value.resultObject!.length > 50
                    ? 50
                    : profile.order_ready_info.value.resultObject!.length)),
      ));
    }
    return res;
  }

  Widget _completeOrders() {
    var res;
    if (profile.order_completed_info.value.resultObject == null) {
      res = Container(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Text("No Completed Orders."),
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
              return Card(
                elevation: 2,
                margin: EdgeInsets.all(0),
                child: ListTile(
                  onLongPress: () {
                    profile.selected = index;
                  },
                  // leading:
                  title: Text(
                      "${profile.order_completed_info.value.resultObject![index].referenceNo}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          profile.order_completed_info.value
                                      .resultObject![index].riderName ==
                                  "null"
                              ? "Rider: " +
                                  "${profile.order_completed_info.value.resultObject![index].riderName}"
                              : "No rider assigned.",
                          style: TextStyle(color: Colors.black)),
                      Text(
                          "Order From: " +
                              "${profile.order_completed_info.value.resultObject![index].clientName}",
                          style: TextStyle(color: Colors.black)),
                      RichText(
                          text: TextSpan(
                        children: [
                          TextSpan(
                              text: profile
                                          .order_completed_info
                                          .value
                                          .resultObject![index]
                                          .items![index]
                                          .qunatity !=
                                      "0"
                                  ? "Items " + "0"
                                  : "Items " +
                                      "${profile.order_completed_info.value.resultObject![index].items![index].qunatity}",
                              style: TextStyle(color: Colors.black54)),
                          TextSpan(
                              text:
                                  "${profile.order_completed_info.value.resultObject![index].items![index].qunatity}")
                        ],
                      ))
                    ],
                  ),

                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          "${profile.order_completed_info.value.resultObject![index].status}"),
                      Text(
                          "₱" +
                              "${profile.order_completed_info.value.resultObject![index].items![index].price}",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                          )),
                      Text(
                        "${profile.order_completed_info.value.resultObject![index].date}" +
                            ", " +
                            "${profile.order_completed_info.value.resultObject![index].time}",
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
            itemCount: profile.order_completed_info.value.resultObject == null
                ? 1
                : profile.order_completed_info.value.resultObject!.length > 50
                    ? 50
                    : profile.order_completed_info.value.resultObject!.length)),
      ));
    }
    return res;
  }
}
