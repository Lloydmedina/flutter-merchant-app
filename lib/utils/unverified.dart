import 'package:flutter/material.dart';

Widget unverifiedContent() {
  return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: [
        TextSpan(
            text:
                'Visit our office at 168 J.M Basa Street corner V. Rama Avenue, San Nicolas Proper, Cebu City ',
            style: TextStyle(
              color: Color(0xff007C89),
            )),
        TextSpan(
            text:
                ' or email us at passafood@mail.co. For your account apporval. ',
            style: TextStyle(
              color: Colors.black,
            )),
      ]));
}
