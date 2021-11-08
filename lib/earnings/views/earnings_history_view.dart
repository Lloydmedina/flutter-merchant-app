import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:merchant/earnings/views/earnings_order_detail.dart';

class EarningsHistoryView extends StatefulWidget {
  @override
  EarningsHistoryViewState createState() => EarningsHistoryViewState();
}

class EarningsHistoryViewState extends State<EarningsHistoryView> {
  DatePickerController _controller = DatePickerController();
  bool noOrder = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _historyBody(),
    );
  }

  Widget _historyBody() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _sortDate(),
              Text(
                'Aug 12',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        _datePicker(),
        SizedBox(
          height: 16,
          // width: MediaQuery.of(context).size.width,
          // child: Container(
          //   color: Color(0xffEFEFF4),
          // ),
        ),
        _orderList()
      ],
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
        'Order History',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _sortDate() {
    return InkWell(
      onTap: () {
        _showSortDate(context);
      },
      child: Chip(
        deleteIcon: Icon(
          FeatherIcons.chevronDown,
          color: Colors.black,
        ),
        onDeleted: () {},
        label: Text(
          'This month',
        ),
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _datePicker() {
    return Container(
      height: 98,
      color: Colors.white,
      child: DatePicker(
        DateTime.now().subtract(Duration(days: 30)),
        controller: _controller,
        initialSelectedDate: DateTime.now(),
        inactiveDates: [DateTime.now().add(Duration(days: 30))],
        selectionColor: Color(0xffFFDE00),
        selectedTextColor: Colors.black,
        onDateChange: (date) {
          // New date selected
          setState(() {});
        },
      ),
    );
  }

  Widget _orderList() {
    return Expanded(
        child: Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: noOrder
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No orders',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'There are no order history. ',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                )
              ],
            )
          : ListView.separated(
              padding: EdgeInsets.all(16),
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EarningsOrderDetail();
                    }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PSFD-C3215',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Completed',
                            style: TextStyle(
                                color: Color(0xff009D59),
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '10:13 AM',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'PHP 0.00',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
    ));
  }

  void _showSortDate(BuildContext context) {
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
                          'Sort Date',
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
                    Navigator.pop(context);
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.calendar,
                        color: Colors.black,
                      )
                    ],
                  ),
                  title: Text(
                    'This month',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Aug 2021',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  trailing: Icon(
                    FeatherIcons.check,
                    color: Colors.black,
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.calendar,
                        color: Colors.black,
                      )
                    ],
                  ),
                  title: Text(
                    'Last month',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Jul 2021',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
