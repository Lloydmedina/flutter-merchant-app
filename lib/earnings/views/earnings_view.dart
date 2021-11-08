import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:merchant/earnings/views/earnings_history_view.dart';

class EarningsView extends StatefulWidget {
  @override
  EarningsViewState createState() => EarningsViewState();
}

class EarningsViewState extends State<EarningsView> {
  bool _today = true;
  bool _yesterday = false;
  bool _thisWeek = false;
  bool _lastWeek = false;
  String _selectedDate = 'Today';
  final Color barBackgroundColor = const Color(0xff72d8bf);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _earningsBody(),
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
        'Earnings',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      actions: [_historyButton()],
    );
  }

  Widget _historyButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EarningsHistoryView();
          }));
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

  Widget _earningsBody() {
    return SingleChildScrollView(
      // padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
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
          _earningsInfo(),
          _completedOrders(),
          Divider(),
          _canceledOrders(),
          Divider(),
        ],
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
          _selectedDate,
        ),
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _earningsInfo() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 105,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Earnings Today',
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          Text('PHP 0.00',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }

  Widget _completedOrders() {
    return Container(
      height: 55,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Completed Orders',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text(
            '0',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _canceledOrders() {
    return Container(
      height: 55,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Canceled Orders',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Text(
            '0',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  void _onStoreChanged(String date) {
    if (date == "today") {
      setState(() {
        _selectedDate = 'Today';
        _today = true;
        _yesterday = false;
        _thisWeek = false;
        _lastWeek = false;
      });
    }
    if (date == "yesterday") {
      setState(() {
        _selectedDate = 'Yesterday';
        _today = false;
        _yesterday = true;
        _thisWeek = false;
        _lastWeek = false;
      });
    }
    if (date == "thisWeek") {
      setState(() {
        _selectedDate = 'This week';
        _today = false;
        _yesterday = false;
        _thisWeek = true;
        _lastWeek = false;
      });
    }
    if (date == "lastWeek") {
      setState(() {
        _selectedDate = 'Last week';
        _today = false;
        _yesterday = false;
        _thisWeek = false;
        _lastWeek = true;
      });
    }
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
            height: 410,
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
                    _onStoreChanged('today');
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
                    'Today',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Aug 5',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  trailing: _today
                      ? Icon(
                          FeatherIcons.check,
                          color: Colors.black,
                        )
                      : null,
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    _onStoreChanged('yesterday');
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
                    'Yesterday',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: _yesterday
                      ? Icon(
                          FeatherIcons.check,
                          color: Colors.black,
                        )
                      : null,
                  subtitle: Text(
                    'Aug 11',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    _onStoreChanged('thisWeek');
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
                    'This week',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Aug 9 - 15',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  trailing: _thisWeek
                      ? Icon(
                          FeatherIcons.check,
                          color: Colors.black,
                        )
                      : null,
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    _onStoreChanged('lastWeek');
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
                    'Last week',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                    'Aug 2 - 8',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  trailing: _lastWeek
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
}
