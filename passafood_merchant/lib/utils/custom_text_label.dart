import 'package:flutter/material.dart';

class textLabel extends StatelessWidget {
  final String label;
  final dynamic color;
  final double fontSize;
  final dynamic fontWeight;
  final dynamic alignment;

  const textLabel(
      {required this.label,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
