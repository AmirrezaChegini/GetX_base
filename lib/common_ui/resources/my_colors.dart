import 'package:flutter/material.dart';

class MyColors {
  static const MyColors _i = MyColors._internal();

  const MyColors._internal();

  factory MyColors() => _i;

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
}
