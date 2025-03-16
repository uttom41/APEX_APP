import 'package:apex_dmit/core/px_to_dp.dart';
import 'package:apex_dmit/core/utils.dart';
import 'package:flutter/material.dart';


void showToast({
  required BuildContext context,
  required String message,
  int duration = 2,
  SnackBarAction? action,
  Color backgroundColor = AppColors.informationColor,
}) {
  final snackBar = SnackBar(
    content: Text(message,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),),
    duration: Duration(seconds: duration),
    behavior: SnackBarBehavior.floating,
    backgroundColor: backgroundColor,
    action: action,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}