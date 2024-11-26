class MyException implements Exception {
  final String errorMessage;
  final int? statusCode;

  const MyException({
    this.errorMessage = 'Error',
    this.statusCode = 0,
  });
}
