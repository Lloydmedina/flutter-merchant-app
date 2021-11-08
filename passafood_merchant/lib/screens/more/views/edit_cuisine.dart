import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class EditCuisine extends StatefulWidget {
  @override
  EditCuisineState createState() => EditCuisineState();
}

class EditCuisineState extends State<EditCuisine> {
  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _cuisineBody(),
      bottomNavigationBar: _saveCuisine(),
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
        'More Options',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _cuisineBody() {
    return SingleChildScrollView(
      child: Column(
        children: [_cuisineTip(), _cuisineGuide(), _cuisineList()],
      ),
    );
  }

  Widget _cuisineTip() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0xffFFDE00).withOpacity(.100),
            borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tips for store cuisine type',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff007C89),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'For a better store profile make sure that all cuisine tags you added to your store info are what your store is offering to avoid any misconception to customers. ',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff007C89),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cuisineGuide() {
    return Container(
      padding: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          'Must Select 4 cuisine types that your store represents.',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(0.60),
          ),
        ),
      ),
    );
  }

  Widget _cuisineList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: InkWell(
              onTap: () {
                setState(() {
                  checkBox = !checkBox;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cuisine Tag 1',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Checkbox(value: checkBox, onChanged: (bool? newValue) {})
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Builder _saveCuisine() {
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
              'SAVE',
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
