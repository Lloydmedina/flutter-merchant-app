import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:merchant/account/account_view.dart';
import 'package:merchant/home/views/dashboard_view.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final List<Widget> _children = [DashboardView(), AccountView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  BottomNavigationBar _bottomAppBar() {
    return BottomNavigationBar(
      selectedFontSize: 11,
      unselectedFontSize: 11,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
            icon: new Icon(FeatherIcons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: new Icon(FeatherIcons.user), label: 'Account'),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
