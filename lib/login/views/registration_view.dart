import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:merchant/login/views/success_view.dart';

class RegistrationView extends StatefulWidget {
  @override
  RegistrationViewState createState() => RegistrationViewState();
}

class RegistrationViewState extends State<RegistrationView> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _registrationForm(),
      bottomNavigationBar: Builder(
        builder: (context) => _bottomAppBar(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      elevation: 0,
      title: Text(
        '',
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
    );
  }

  Widget _registrationForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _headerText(),
          SizedBox(
            height: 16,
          ),
          _storeInfo(),
          SizedBox(
            height: 16,
          ),
          _nameInfo(),
          SizedBox(
            height: 16,
          ),
          _emailInfo(),
          SizedBox(
            height: 16,
          ),
          _mobileInfo(),
          SizedBox(
            height: 16,
          ),
          _outletsInfo(),
          SizedBox(
            height: 16,
          ),
          _termsOfService(),
        ],
      ),
    );
  }

  Widget _headerText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get Started',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Enter your store details and contact information. After that you will be receiving an email for the next step of your registration.',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _storeInfo() {
    return Container(
      height: 105,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffEFEFF4),
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Store Name',
                contentPadding: EdgeInsets.all(16),
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xffC7C7CC),
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffEFEFF4),
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
            ),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Store Address',
                contentPadding: EdgeInsets.all(16),
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xffC7C7CC),
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _nameInfo() {
    return Container(
      height: 105,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffEFEFF4),
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'First Name',
                contentPadding: EdgeInsets.all(16),
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xffC7C7CC),
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 52,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xffEFEFF4),
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
            ),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Last Name',
                contentPadding: EdgeInsets.all(16),
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Color(0xffC7C7CC),
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _emailInfo() {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEFEFF4),
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
      ),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.all(16),
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xffC7C7CC),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _mobileInfo() {
    return Container(
      height: 52,
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEFEFF4),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Text(
            '+63',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          VerticalDivider(
            thickness: 1,
            color: Color(0xffEFEFF4),
          ),
          Expanded(
            child: Container(
              height: 52,
              alignment: Alignment.center,
              child: TextFormField(
                maxLength: 10,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.only(top: 11, bottom: 8),
                  hintStyle: TextStyle(color: Color(0xffD4D3D8)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Enter mobile number',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _outletsInfo() {
    return Container(
      height: 52,
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEFEFF4),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        itemHeight: 52,
        isExpanded: true,
        value: dropdownValue,
        icon: const Icon(
          FeatherIcons.chevronDown,
          color: Color(0xff007C89),
        ),
        // iconSize: 24,
        // elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.transparent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['1', '2', '3', '4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _termsOfService() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'By proceeding to create your account, you agree to ',
              style: TextStyle(
                color: Colors.black,
              )),
          TextSpan(
              text: 'PassaFoods Terms of Service',
              style: TextStyle(
                color: Color(0xff007C89),
              )),
          TextSpan(
              text: ' and ',
              style: TextStyle(
                color: Colors.black,
              )),
          TextSpan(
              text: 'Privacy Policy.',
              style: TextStyle(
                color: Color(0xff007C89),
              )),
        ]));
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
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SuccessView();
            }));
          },
          child: Text(
            'AGREE AND CONTINUE',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
