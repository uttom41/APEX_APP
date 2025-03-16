import 'package:apex_dmit/core/px_to_dp.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

Widget nativeCheckBox({
  required bool isChecked,
  required Function onChange,
}) {
  return GestureDetector(
    onTap: () {
      onChange();
    },
    child: isChecked
        ? Icon(Icons.check_box_rounded, size: 17.dp, color: Colors.green) // Checked icon
        : Icon(Icons.check_box_outline_blank_rounded,color: AppColors.primaryTextColorLight,size: 17.dp,),
  );
}
