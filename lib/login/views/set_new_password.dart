import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class SetNewPassword extends StatefulWidget {
  @override
  SetNewPasswordState createState() => SetNewPasswordState();
}

class SetNewPasswordState extends State<SetNewPassword> {
  bool newObscureText = true;
  bool confirmObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _setNewPassForm(),
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

  Widget _setNewPassForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Set new password',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          _newPasswordField(),
          _confirmPasswordField(),
          SizedBox(
            height: 8,
          ),
          Text(
            'Enter a new one to reset your password.',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          SizedBox(
            height: 16,
          ),
          _confirmButton()
        ],
      ),
    );
  }

  Widget _newPasswordField() {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEFEFF4),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        obscureText: newObscureText,
        decoration: InputDecoration(
          suffixIcon: newObscureText
              ? InkWell(
                  onTap: () {
                    setState(() {
                      newObscureText = !newObscureText;
                    });
                  },
                  child: Icon(
                    FeatherIcons.eye,
                    color: Colors.black,
                  ),
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      newObscureText = !newObscureText;
                    });
                  },
                  child: Icon(FeatherIcons.eyeOff, color: Colors.black),
                ),
          contentPadding: EdgeInsets.all(16),
          hintText: 'New Password',
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

  Widget _confirmPasswordField() {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffEFEFF4),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextFormField(
        obscureText: confirmObscureText,
        decoration: InputDecoration(
          suffixIcon: confirmObscureText
              ? InkWell(
                  onTap: () {
                    setState(() {
                      confirmObscureText = !confirmObscureText;
                    });
                  },
                  child: Icon(
                    FeatherIcons.eye,
                    color: Colors.black,
                  ),
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      confirmObscureText = !confirmObscureText;
                    });
                  },
                  child: Icon(FeatherIcons.eyeOff, color: Colors.black),
                ),
          contentPadding: EdgeInsets.all(16),
          hintText: 'Confirm Password',
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

  Widget _confirmButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 55),
        primary: Color(0xffFFDE00),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      onPressed: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //   return OtpView();
        // }));
      },
      child: Text(
        'RESET PASSWORD',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
