import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:merchant/active_orders/views/active_order_details.dart';
import 'package:merchant/utils/custom_dialog.dart';

class ActiveOrdersView extends StatefulWidget {
  @override
  ActiveOrdersViewState createState() => ActiveOrdersViewState();
}

class ActiveOrdersViewState extends State<ActiveOrdersView> {
  bool noIncoming = false;
  bool noProcessing = false;
  bool noReady = false;

  bool resume = true;
  bool paused = false;
  bool closed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _activeOrdersBody(),
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
        'Active Orders',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      actions: [_historyButton()],
    );
  }

  Widget _activeOrdersBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _storeInfo(),
          _incoming(),
          _incomingList(),
          _processing(),
          _proccesingList(),
          _ready(),
          _readyList()
        ],
      ),
    );
  }

  Widget _storeInfo() {
    return Container(
      color: closed
          ? Color(0xffFF7309)
          : resume
              ? Color(0xff009D59)
              : paused
                  ? Color(0xff4285F4)
                  : Color(0xffFF7309),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
              child: Icon(FeatherIcons.moreVertical, color: Colors.white))
        ],
      ),
    );
  }

  Widget _incoming() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xffEFEFF4),
      padding: const EdgeInsets.all(16),
      child: Text(
        'Incoming (2)',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _incomingList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: noIncoming
          ? Text(
              'No orders incoming',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            )
          : Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'PSFD-3215',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '10:13 AM',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
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
                                  'Rider Name',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Items 2 - Order From Customer Name',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 2),
            ),
    );
  }

  Widget _processing() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xffEFEFF4),
      padding: const EdgeInsets.all(16),
      child: Text(
        'Processing (1)',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _proccesingList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: noProcessing
          ? Text(
              'No orders processing',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
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
                          return ActiveOrderDetail();
                        }));
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'PSFD-3215',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '10:13 AM',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
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
                                    'Rider Name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Items 2 - Order From Customer Name',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 1),
            ),
    );
  }

  Widget _ready() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Color(0xffEFEFF4),
      padding: const EdgeInsets.all(16),
      child: Text(
        'Ready (1)',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _readyList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: noReady
          ? Text(
              'No orders ready',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            )
          : Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'PSFD-3215',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '10:13 AM',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
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
                                  'Rider Name',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Items 2 - Order From Customer Name',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 1),
            ),
    );
  }

  Widget _historyButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return EarningsHistoryView();
          // }));
        },
        child: Text(
          'History',
          style: TextStyle(
              color: Color(0xff007C89),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
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

  void _showDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return CustomDialog(
              title: 'Resume',
              content: Text(
                'Please make sure you are ready to accept orders again.',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              enableAgreeButton: true,
              enableCloseButton: true,
              agreeButtonText: 'CONFIRM',
              closeButtonText: 'CANCEL',
              onPressedAgreeButton: () {},
              onPressedCloseButton: () {});
        });
  }
}
