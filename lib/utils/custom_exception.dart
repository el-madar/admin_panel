class MyException implements Exception {
  final String message;
  final int error;
  final String? errorException;

  MyException({
    required this.message,
    required this.error,
    this.errorException,
  });
}
