import 'package:dio/dio.dart';
import 'package:getx_base/core/error_handler/my_exception.dart';

class ErrorHandler {
  static const ErrorHandler _i = ErrorHandler._internal();

  const ErrorHandler._internal();

  factory ErrorHandler() => _i;

  static void handleError(DioException e) {
    if (e.response == null) {
      throw MyException(
        errorMessage: e.message ?? 'Error',
        statusCode: e.response?.statusCode,
      );
    } else {
      if (e.response?.data['message'] == null) {
        throw MyException(
          errorMessage: e.response?.statusMessage ?? e.message ?? 'Error',
          statusCode: e.response?.statusCode,
        );
      } else {
        throw MyException(
          errorMessage: e.response?.data['message'] ?? e.message,
          statusCode: e.response?.statusCode,
        );
      }
    }
  }
}
