import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SupportView extends StatefulWidget {
  @override
  SupportViewState createState() => SupportViewState();
}

class SupportViewState extends State<SupportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _supportBody(),
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
        'Support',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _supportBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'We are here for you',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Contact us with your issue using the ff: ',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    children: [
                      Icon(FeatherIcons.phoneCall),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        '09287130991 / 09287130991',
                        style: TextStyle(
                            color: Color(0xff007C89),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    children: [
                      Icon(FeatherIcons.mail),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'supportpassafood@mail.com',
                        style: TextStyle(
                            color: Color(0xff007C89),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Row(
                    children: [
                      Icon(FeatherIcons.globe),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'http://www.passafood.co',
                        style: TextStyle(
                            color: Color(0xff007C89),
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
