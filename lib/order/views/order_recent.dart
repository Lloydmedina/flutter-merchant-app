import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:merchant/controller/order_controller.dart';
import 'package:merchant/controller/profile_controller.dart';

import 'package:merchant/utils/custom_dialog.dart';

class RecentOrdersView extends StatefulWidget {
  @override
  RecentOrdersViewState createState() => RecentOrdersViewState();
}

class RecentOrdersViewState extends State<RecentOrdersView>
    with SingleTickerProviderStateMixin<RecentOrdersView> {
  OrderController orderDetails = new OrderController();
  bool resume = false;
  bool paused = true;
  bool closed = false;
  DateTime date = new DateTime.now().subtract(Duration(days: 2));

  //String setDate = DateFormat('yyyy-MM-dd').format(dateNow);
  final profile = Get.find<ProfileController>();
  int selectedtab = 0;
  late AnimationController _controller;
  late Animation<dynamic> _animation;

  @override
  void initState() {
    super.initState();
    profile.setStartDate(DateFormat('yyyy-MM-dd').format(date));
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween(begin: 0.0, end: 0.3).animate(_controller);
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: new Text('Recent Activities',
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
        body: _dashboardBody());
  }

  Widget _dashboardBody() {
    return Container(
        child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          // Column(children: [Text("" + DateFormat('yyyy-MM-dd').format(date))]),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 5,
            thickness: 2,
          ),
          Expanded(
              child: FutureBuilder(
            future: _playAnimation(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return SlideTransition(
                  position:
                      Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
                          .animate(_controller),
                  child: _recentActivity());
            },
          ))
        ],
      ),
    ));
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  Widget _recentActivity() {
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
                    onTap: () {
                      _.selected = index;

                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext) {
                            return CustomDialog(
                                enableAgreeButton: true,
                                enableCloseButton: true,
                                closeButtonText: "Cancel",
                                agreeButtonText: "Accept",
                                content: Column(
                                  children: [
                                    Text(
                                        "${_.order_info.resultObject![index].referenceNo}"),
                                    Divider(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Booking Date: ${_.order_info.resultObject![index].date}"),
                                        Divider(),
                                        Text(
                                            "Total Payable: ${_.order_info.resultObject![index].items![index].totalAmount}"),
                                        // Text(
                                        //     "Items: ${_.orderList[index].orders!.}")
                                      ],
                                    )
                                  ],
                                ),
                                onPressedAgreeButton: () {
                                  // print(
                                  //     "Accept  :${_.order_info.resultObject![_.selected].referenceNo}");
                                },
                                onPressedCloseButton: () {
                                  //print(
                                  //     "Cancel  :${_.order_info.resultObject![_.selected].referenceNo}");
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                });
                          });
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
                            "Rider: ${_.order_info.resultObject![index].riderName != "null" ? _.order_info.resultObject![index].riderName : "No Rider"}",
                            style: TextStyle(color: Colors.black)),
                        Text(
                            "Order From: " +
                                "${_.order_info.resultObject![index].clientName != null ? _.order_info.resultObject![index].clientName : "no data"}",
                            style: TextStyle(color: Colors.black)),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                                text:
                                    "Items ${_.order_info.resultObject != 0 ? _.order_info.resultObject![index].items != null ? _.order_info.resultObject![index].items!.length : "0" : "0"}")
                          ],
                        ))
                      ],
                    ),

                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            "${orderDetails.getStatus(_.order_info.resultObject![index].status.toString())}"),
                        // Text("₱ ${_.orderList[index].orders.}",
                        //     style: TextStyle(
                        //       fontFamily: 'Roboto',
                        //     )),
                        Text(
                          "${_.order_info.resultObject![index].date}",
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

  void setOrderFilter(keys) {
    return keys;
  }
}
