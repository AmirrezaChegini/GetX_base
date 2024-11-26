import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyDevice {
  /// Device size
  static const double tabletWidth = 754;
  static const double tabletHeight = 658;
  static const double desktopWidth = 1020;
  static const double desktopHeight = 784;

  const MyDevice();

  /// Get Device based on width
  static bool isMobile(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 600 && MediaQuery.sizeOf(context).width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.sizeOf(context).width >= 1200;
  }

  /// Get device size
  static double? getDeviceWidth(BuildContext context) {
    if (isMobile(context)) {
      return null;
    } else if (isTablet(context)) {
      return tabletWidth;
    } else {
      return desktopWidth;
    }
  }

  static double? getDeviceHeight(BuildContext context) {
    if (isMobile(context)) {
      return null;
    } else if (isTablet(context)) {
      return tabletHeight;
    } else {
      return desktopHeight;
    }
  }

  /// Get Device based on platform
  static bool isIOS() {
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  static bool isAndroid() {
    return defaultTargetPlatform == TargetPlatform.android;
  }

  static bool isWeb() {
    return kIsWeb;
  }
}
