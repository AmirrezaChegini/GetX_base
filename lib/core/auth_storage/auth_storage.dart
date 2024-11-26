import 'package:getx_base/core/constants/my_constants.dart';
import 'package:getx_base/core/utils/local_storage.dart';

class AuthStorage {
  const AuthStorage();

  static String token = '';

  static Future<void> saveData({required String newTokenParams}) async {
    await LocalStorage.saveData(key: MyConstants.token, value: newTokenParams);
    token = newTokenParams;
  }

  static Future<void> deleteData() async {
    await LocalStorage.deleteData(key: MyConstants.token);
    token = '';
  }

  static void loadData() {
    token = LocalStorage.readData(key: MyConstants.token);
  }

  static bool isLogin() {
    return token.isNotEmpty;
  }
}
