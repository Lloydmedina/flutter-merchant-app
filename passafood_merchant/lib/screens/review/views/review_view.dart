import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ReviewView extends StatefulWidget {
  @override
  ReviewViewState createState() => ReviewViewState();
}

class ReviewViewState extends State<ReviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _reviewBody(),
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
        'Reviews',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _reviewBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _storeRate(),
          _ratings(),
          _customerReview(),
          Divider(),
          _customerReviewList()
        ],
      ),
    );
  }

  Widget _storeRate() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overall Store Rating',
            style:
                TextStyle(color: Colors.black.withOpacity(0.60), fontSize: 12),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '5.0',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 12,
              ),
              Icon(
                FontAwesomeIcons.solidStar,
                size: 35,
                color: Color(0xffFFAA00),
              )
            ],
          ),
          Text('Base of 30 reviews',
              style: TextStyle(color: Colors.black, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _ratings() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              LinearPercentIndicator(
                width: 240,
                lineHeight: 8.0,
                percent: 0.625,
                backgroundColor: Color(0xffEFEFF4),
                progressColor: Color(0xff009D59),
              ),
              Text(
                '120',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              LinearPercentIndicator(
                width: 240,
                lineHeight: 8.0,
                percent: 0.15625,
                backgroundColor: Color(0xffEFEFF4),
                progressColor: Color(0xff53C31B),
              ),
              Text(
                '30',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              LinearPercentIndicator(
                width: 240,
                lineHeight: 8.0,
                percent: 0.15625,
                backgroundColor: Color(0xffEFEFF4),
                progressColor: Color(0xff53C31B),
              ),
              Text(
                '30',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              LinearPercentIndicator(
                width: 240,
                lineHeight: 8.0,
                percent: 0.13542,
                backgroundColor: Color(0xffEFEFF4),
                progressColor: Color(0xffFAAD14),
              ),
              Text(
                '26',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              LinearPercentIndicator(
                width: 240,
                lineHeight: 8.0,
                percent: 0.07293,
                backgroundColor: Color(0xffEFEFF4),
                progressColor: Color(0xffFF7309),
              ),
              Text(
                '14',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Row(
            children: [
              LinearPercentIndicator(
                width: 240,
                lineHeight: 8.0,
                percent: 0.01042,
                backgroundColor: Color(0xffEFEFF4),
                progressColor: Color(0xffF5222D),
              ),
              Text(
                '2',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _customerReview() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Customer Reviews',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          PopupMenuButton(
            child: Chip(
              deleteIcon: Icon(
                FeatherIcons.chevronDown,
                color: Colors.black,
              ),
              onDeleted: () {},
              label: Text(
                'Most Recent',
              ),
              labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            itemBuilder: (context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem(
                  child: Text(
                    'Most Recent',
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    'Favorable',
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    'Critical',
                  ),
                )
              ];
            },
          )
        ],
      ),
    );
  }

  Widget _customerReviewList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(16),
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    FontAwesomeIcons.solidStar,
                                    size: 16,
                                    color: Color(0xffFFAA00),
                                  ),
                                ),
                                TextSpan(
                                  text: ' 5.0',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Aug 08 2021',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                      Text('Customer Comments',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ))
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 10)),
    );
  }
}
