import 'package:flutter_dotenv/flutter_dotenv.dart';

class MyApi {
  const MyApi();

  static const Duration timeOut = Duration(seconds: 30);
  static const String contentType = 'application/json';

  static String baseUrl = dotenv.env['BASE_URL']!;
}
