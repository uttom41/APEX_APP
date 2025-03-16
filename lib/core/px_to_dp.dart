import 'package:flutter/material.dart';

extension PixelPerfect on num {
  double get dp => this * (_screenWidth / _designWidth);
  double get sp => this * (_screenWidth / _designWidth);
}

const double _designWidth = 375.0;


final double _screenWidth = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize.width /
    WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
