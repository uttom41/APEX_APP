import 'package:flutter/material.dart';

Widget nativeButton({
  required String text,
  required VoidCallback onPressed,
  required double width,
  required double height,
  required TextStyle style,
  required Color bgColor,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Color(0x40000000),
          blurRadius: 4,
          spreadRadius: 0,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(10),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Text(
            text,
            style: style,
          ),
        ),
      ),
    ),
  );
}
