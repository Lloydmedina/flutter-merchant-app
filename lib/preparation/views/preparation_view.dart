import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class PreparationView extends StatefulWidget {
  @override
  PreparationViewState createState() => PreparationViewState();
}

class PreparationViewState extends State<PreparationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: _preparationBody(),
      bottomNavigationBar: _updatePrepTime(),
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
        'Preparation Time',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _preparationBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Set Preparation Time',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'To properly manage your order requests expected time of delivery it is recommended that you set your stores preferred preparation time. ',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          _updateTime()
        ],
      ),
    );
  }

  Widget _updateTime() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color(0xffEFEFF4),
              ),
            ),
            child: Text(
              '30 mins',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            width: 50,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              border: Border.all(
                color: Color(0xffEFEFF4),
              ),
            ),
            child: Text(
              '-',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          Container(
            width: 50,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              border: Border.all(
                color: Color(0xffEFEFF4),
              ),
            ),
            child: Text(
              '+',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Builder _updatePrepTime() {
    return Builder(
      builder: (context) => BottomAppBar(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xffFFDE00),
              minimumSize: Size(345, 55),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {},
            child: Text(
              'UPDATE PREPARATION TIME',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
