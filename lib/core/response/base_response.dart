class BaseResponse {
  static const BaseResponse _i = BaseResponse._internal();

  const BaseResponse._internal();

  factory BaseResponse() => _i;

  static T getData<T>(
    dynamic response,
    T Function(Map<String, dynamic> json) bodyBuilder,
  ) {
    return bodyBuilder.call(response['data']);
  }

  static List<T> getDataList<T>(
    dynamic response,
    T Function(Map<String, dynamic> json) bodyBuilder,
  ) {
    return response['data'].map<T>((e) => bodyBuilder.call(e)).toList();
  }
}
