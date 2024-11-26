import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  double get widthScreen => MediaQuery.sizeOf(this).width;
  double get heightScreen => MediaQuery.sizeOf(this).height;
}
