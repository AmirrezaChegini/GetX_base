class MyApi {
  static const MyApi _i = MyApi._internal();

  const MyApi._internal();

  factory MyApi() => _i;

  static const Duration timeOut = Duration(seconds: 30);
  static const String contentType = 'application/json';

  static const String baseUrl = 'https://api.BASE_URL.com';
}
