import 'package:dio/dio.dart';
import 'package:getx_base/core/auth_storage/auth_storage.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${AuthStorage.token}';
  }
}
