import 'package:dio/dio.dart';
import 'package:getx_base/core/constants/my_api.dart';
import 'package:getx_base/core/error_handler/error_handler.dart';
import 'package:getx_base/core/network/http_request.dart';
import 'package:getx_base/core/network/interceptors/logging_interceptor.dart';
import 'package:getx_base/core/network/interceptors/token_interceptor.dart';

class HttpRequestImpl implements IHttpRequest {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: MyApi.baseUrl,
      sendTimeout: MyApi.timeOut,
      receiveTimeout: MyApi.timeOut,
      connectTimeout: MyApi.timeOut,
      contentType: MyApi.contentType,
      responseType: ResponseType.json,
    ),
  )..interceptors.addAll([
      LoggingInterceptor().prettyDioLogger,
      TokenInterceptor(),
    ]);

  @override
  Future get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future put({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future patch({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      final Response response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future delete({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future upload({
    required String method,
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    void Function(int count, int total)? onSendProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header, method: method),
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }

  @override
  Future download({
    required String urlPath,
    required String savePath,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? header,
    void Function(int count, int total)? onReceive,
    CancelToken? cancelToken,
  }) async {
    try {
      await _dio.download(
        urlPath,
        savePath,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: header),
        onReceiveProgress: onReceive,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
    }
  }
}
