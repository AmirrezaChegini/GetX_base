import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyApi {
  static const MyApi _i = MyApi._internal();

  const MyApi._internal();

  factory MyApi() => _i;

  static const Duration timeOut = Duration(seconds: 30);
  static const String contentType = 'application/json';

  static String baseUrl = dotenv.env['BASE_URL']!;
}
