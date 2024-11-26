import 'package:flutter/material.dart';

extension Gap on double {
  SizedBox get gapWidth => SizedBox(width: this);
  SizedBox get gapHeight => SizedBox(height: this);
}