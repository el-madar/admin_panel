class MyException implements Exception {
  final List<dynamic> messages;
  final int error;
  final String? errorException;

  MyException({
    required this.messages,
    required this.error,
    this.errorException,
  });
}
