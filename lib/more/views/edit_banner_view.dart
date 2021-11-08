import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class EditBannerView extends StatefulWidget {
  @override
  EditBannerViewState createState() => EditBannerViewState();
}

class EditBannerViewState extends State<EditBannerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _editBannerBody(),
      bottomNavigationBar: _saveBanner(),
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
        'Edit Store Banner',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _editBannerBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _bannerImage(),
          _bannerInfo(),
          _bannerTips(),
          _bannerGuide()
        ],
      ),
    );
  }

  Widget _bannerImage() {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 188,
          decoration: BoxDecoration(
            color: Color(0xffEFEFF4),
            image: DecorationImage(
              image: AssetImage(
                'assets/images/banner_sample.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          // child: Center(
          //   child: SizedBox(
          //     height: 47,
          //     width: 87,
          //     child: Image.asset(
          //       'assets/images/small_passafood.png',
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white.withOpacity(.50),
              width: MediaQuery.of(context).size.width,
              height: 32,
              child: Center(
                child: Text(
                  'Change Banner Photo',
                  style: TextStyle(
                      color: Color(0xff007C89),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bannerInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Store Banner Photo',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Text(
            'Size: 1440 x 1080 pixels minimum',
            style:
                TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.60)),
          ),
          Text(
            'File Type: JPG, Max Size: 10MB.',
            style:
                TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.60)),
          ),
        ],
      ),
    );
  }

  Widget _bannerTips() {
    return Padding(
      padding: const EdgeInsets.all(16),
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
              'Tips for a good banner photo.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff007C89),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Make sure that the uploaded photo is not blurry, misleading, repeating, and not containing any logo or watermark.',
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

  Widget _bannerGuide() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Photo Guide',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                height: 104,
                width: 207,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/banner_sample.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Icon(
                FeatherIcons.checkCircle,
                color: Color(0xff459B5F),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Image must be high quality and contains only the food items that the store is selling. ',
            style:
                TextStyle(color: Colors.black.withOpacity(0.60), fontSize: 12),
          ),
        ],
      ),
    );
  }

  Builder _saveBanner() {
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
