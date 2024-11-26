import 'package:getx_base/core/utils/my_device.dart';

dynamic checkPlatform({
  dynamic android,
  dynamic iOS,
  dynamic web,
}) {
  if (MyDevice.isAndroid()) {
    return android;
  } else if (MyDevice.isIOS()) {
    return iOS;
  } else if (MyDevice.isWeb()) {
    return web;
  }
}
