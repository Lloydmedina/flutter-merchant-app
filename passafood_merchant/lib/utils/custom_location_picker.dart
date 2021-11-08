import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomLocationPicker extends StatefulWidget {
  // LocationPickers() : super();
  CustomLocationPicker();

  @override
  CustomLocationPickerState createState() => CustomLocationPickerState();
}

class CustomLocationPickerState extends State<CustomLocationPicker> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: _appBar(),
      body: _mapBody(),
      floatingActionButton: _save(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked);

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

  Widget _mapBody() {
    return Stack(
      children: [_mapView(), _mapPin(), _searchLocation()],
    );
  }

  Widget _mapView() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        zoomControlsEnabled: false,
        onCameraMove: (CameraPosition position) {},
        onCameraIdle: () async {},
        initialCameraPosition: CameraPosition(
            target: LatLng(10.324212359474148, 123.89850418003984), zoom: 18),
      ),
    );
  }

  Widget _mapPin() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/store_pin.png'),
          SizedBox(height: 56),
        ],
      ),
    );
  }

  Widget _searchLocation() {
    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xffEFEFF4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Store Address',
                contentPadding: EdgeInsets.all(16),
                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                prefixIcon: Icon(
                  FeatherIcons.search,
                  color: Colors.black,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _save() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color(0xffFFDE00),
          minimumSize: Size(345, 55),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child: Text(
          'SAVE',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
