import 'package:flutter/material.dart';
import 'package:getx_base/common_ui/resources/my_colors.dart';
import 'package:get/get.dart';

class MyTheme {
  static const MyTheme _i = MyTheme._internal();

  const MyTheme._internal();

  factory MyTheme() => _i;

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
  );

  static Map<String, Color> get lightColors => {
        'primary_color': MyColors.white,
      };

  static Map<String, Color> get darkColors => {
        'primary_color': MyColors.black,
      };
}

extension ThemeExtension on ThemeData {
  Map<String, Color> get customColors => Get.isDarkMode ? MyTheme.darkColors : MyTheme.lightColors;

  Color get primaryColor => customColors['primary_color']!;
}
