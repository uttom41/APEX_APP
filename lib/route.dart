
import 'package:apex_dmit/pages/login/login_screen.dart';
import 'package:apex_dmit/pages/purchase_list/index.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> defaultRoute = {
  "/":(context) => LogInScreen(),
  "/purchase_list":(context) => PurchaseListScreen(),

};