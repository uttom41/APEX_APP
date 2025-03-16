
import 'package:apex_dmit/core/px_to_dp.dart';
import 'package:flutter/material.dart';

Widget nativeTextField({
  required String hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  bool obscureText = false,
  required TextEditingController controller,
  required ValueChanged<String?> onChanged
}) {
  return Container(
    width: 279.dp,
    height: 46.dp,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.dp),
      border: Border.all(width: 1, color: Color(0xFFEDF1F3)),
      boxShadow: [
        BoxShadow(
          color: Color(0xFFE4E5E7).withOpacity(0.24),
          blurRadius: 2,
          spreadRadius: 0,
          offset: Offset(0, 1),
        ),
      ],
    ),
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: (String? value) {
        onChanged(value);
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFFACB5BB),fontSize: 14.sp,fontWeight: FontWeight.w500),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 10.dp, horizontal: 14.dp),
      ),
    ),
  );
}