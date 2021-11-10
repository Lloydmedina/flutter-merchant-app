import 'package:flutter/material.dart';

Widget nothingFoundContent() {
  return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: [
        TextSpan(
            text: 'The account does not exist',
            style: TextStyle(
              color: Colors.black,
            )),
      ]));
}
