import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SuccessView extends StatefulWidget {
  @override
  SuccessViewState createState() => SuccessViewState();
}

class SuccessViewState extends State<SuccessView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Builder(
        builder: (context) => _bottomAppBar(),
      ),
      // appBar: _appBar(),
      body: _body(),
    );
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 55),
            primary: Color(0xffFFDE00),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
          onPressed: () {},
          child: Text(
            'GO BACK TO LOGIN',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(alignment: Alignment.center, child: _headerInfo()),
          Align(alignment: Alignment.bottomCenter, child: _businessInfo())
        ],
      ),
    );
  }

  Widget _headerInfo() {
    return Container(
      height: 180,
      child: Column(
        children: [
          Container(
            height: 73,
            width: 73,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffFFDE00)),
            child: Center(
              child: Icon(
                FeatherIcons.mail,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            'Check your email',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            'You should be receiving an email for the next step of your registration.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget _businessInfo() {
    return Container(
      height: 85,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'You can also visit our office at ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text:
                  '168 J.M Basa Street corner V. Rama Avenue, San Nicolas Proper, Cebu City',
              style: TextStyle(
                color: Color(0xff007C89),
              ),
            ),
            TextSpan(
              text: ' or email us at ',
              style: TextStyle(color: Colors.black),
            ),
            TextSpan(
              text: 'passafood@mail.co',
              style: TextStyle(
                color: Color(0xff007C89),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
