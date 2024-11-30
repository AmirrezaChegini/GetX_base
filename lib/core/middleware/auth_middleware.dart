import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base/core/auth_storage/auth_storage.dart';
import 'package:getx_base/core/routers/my_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (AuthStorage.isLogin()) {
      return const RouteSettings(name: Routes.samplePage);
    } else {
      return null;
    }
  }
}
