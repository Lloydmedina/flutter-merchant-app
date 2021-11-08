import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:merchant/more/views/edit_banner_view.dart';
import 'package:merchant/more/views/edit_cuisine.dart';
import 'package:merchant/more/views/edit_location_view.dart';
import 'package:merchant/more/views/edit_store_hours_view.dart';
import 'package:merchant/more/views/edit_store_name_view.dart';

class MoreView extends StatefulWidget {
  @override
  MoreViewState createState() => MoreViewState();
}

class MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _moreBody(),
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

  Widget _moreBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _storeBanner(),
          SizedBox(
            height: 8,
          ),
          _storeName(),
          SizedBox(
            height: 8,
          ),
          _storeAddress(),
          SizedBox(
            height: 8,
          ),
          _storeCuisine(),
          SizedBox(
            height: 8,
          ),
          _storeHour()
        ],
      ),
    );
  }

  Widget _storeBanner() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Store Banner',
            style:
                TextStyle(color: Colors.black.withOpacity(0.60), fontSize: 12),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 105,
                width: 210,
                decoration: BoxDecoration(
                    color: Color(0xffEFEFF4),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Image.asset('assets/images/small_passafood.png'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return EditBannerView();
                  }));
                },
                child: Text(
                  'Edit Banner',
                  style: TextStyle(
                      color: Color(0xff007C89),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _storeName() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Store Name',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.60), fontSize: 12),
              ),
              Text(
                'Store Name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditStoreNameView();
              }));
            },
            child: Text(
              'Edit Name',
              style: TextStyle(
                  color: Color(0xff007C89),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget _storeAddress() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Store Location',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.60), fontSize: 12),
              ),
              Text(
                'Main address',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditLocationView();
              }));
            },
            child: Text(
              'Edit Location',
              style: TextStyle(
                  color: Color(0xff007C89),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget _storeCuisine() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Store Cuisine Types',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.60), fontSize: 12),
              ),
              Text(
                'Fast Food,Filipino,Chicken,Snack',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditCuisine();
              }));
            },
            child: Text(
              'Edit Type',
              style: TextStyle(
                  color: Color(0xff007C89),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget _storeHour() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Store Open Hours',
            style: TextStyle(
              color: Colors.black.withOpacity(0.60),
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mon',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                '9:00 AM - 10:30 PM',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tue',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                '9:00 AM - 10:30 PM',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Wed',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                '9:00 AM - 10:30 PM',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thu',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                '9:00 AM - 10:30 PM',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Fri',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                '9:00 AM - 10:30 PM',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sat',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                '9:00 AM - 10:30 PM',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sun',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                'Closed',
                style: TextStyle(
                    color: Color(0xffCCCCCC),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditStoreHoursView();
                }));
              },
              child: Text(
                'Edit Open Hours',
                style: TextStyle(
                    color: Color(0xff007C89),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
