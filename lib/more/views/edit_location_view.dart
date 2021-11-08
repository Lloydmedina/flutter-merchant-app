import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:merchant/utils/custom_location_picker.dart';

class EditLocationView extends StatefulWidget {
  @override
  EditLocationViewState createState() => EditLocationViewState();
}

class EditLocationViewState extends State<EditLocationView> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _editLocationBody(),
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
        'Edit Store Location',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _editLocationBody() {
    return SingleChildScrollView(
      child: Column(
        children: [_mapView(), _storeAddress(), _storeAddressTips()],
      ),
    );
  }

  Widget _mapView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: GoogleMap(
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(10.324212359474148, 123.89850418003984),
                  zoom: 18),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/store_pin.png'),
                SizedBox(height: 56),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _storeAddress() {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Store Address',
            style:
                TextStyle(color: Colors.black.withOpacity(0.60), fontSize: 12),
          ),
          Text(
            'Main address',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            'Sub address',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CustomLocationPicker();
              }));
            },
            child: Text(
              'Change Address',
              style: TextStyle(
                  color: Color(0xff007C89),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _storeAddressTips() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Color(0xffFFDE00).withOpacity(.100),
            borderRadius: BorderRadius.circular(8)),
        height: 128,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Locate your store',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff007C89),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Only input the name of your store and do not add any other words to it. ',
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
}
