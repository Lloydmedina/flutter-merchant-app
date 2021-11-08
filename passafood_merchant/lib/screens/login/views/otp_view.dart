import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class OtpView extends StatefulWidget {
  @override
  OtpViewState createState() => OtpViewState();
}

class OtpViewState extends State<OtpView> {
  bool startTimer = true;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _otpForm(),
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

  Widget _otpForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OTP Verification',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          _otpField(),
          SizedBox(
            height: 16,
          ),
          _resendOtp()
        ],
      ),
    );
  }

  Widget _otpField() {
    return OtpTextField(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,

      numberOfFields: 4,
      fieldWidth: 52,
      borderColor: Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Verification Code"),
                content: Text('Code entered is $verificationCode'),
              );
            });
      }, // end onSubmit
    );
  }

  Widget _resendOtp() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: "Didn't receive Email? ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              )),
          WidgetSpan(
            child: startTimer
                ? _otpCounter()
                : InkWell(
                    onTap: () {
                      setState(() {
                        endTime =
                            DateTime.now().millisecondsSinceEpoch + 1000 * 30;
                        startTimer = true;
                      });
                    },
                    child: RichText(
                        text: TextSpan(
                      text: 'Resend Code',
                      style: TextStyle(
                        color: Color(0xff00939D),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    )),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _otpCounter() {
    return CountdownTimer(
      endTime: endTime,
      onEnd: () {
        setState(() {
          startTimer = false;
        });
      },
      widgetBuilder: (_, time) {
        return Text(
          "Resend Code after (${time!.sec} ${time.sec! <= 1 ? 'sec' : 'secs'})",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xffCCCCCC)),
        );
      },
    );
    // return Countdown(
    //   duration: Duration(seconds: 15),
    //   onFinish: () {
    //     setState(() {
    //       startTimer = false;
    //     });
    //   },
    //   builder: (BuildContext ctx, Duration remaining) {
    //     return Text(
    //       "Resend Code after (${remaining.inSeconds} ${remaining.inSeconds <= 1 ? 'sec' : 'secs'})",
    //       style: TextStyle(
    //           fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
    //     );
    //   },
    // );
  }
}
