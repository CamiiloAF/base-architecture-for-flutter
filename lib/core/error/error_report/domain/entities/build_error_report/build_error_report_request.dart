class ErrorReport {
  ErrorReport({
    required this.error,
    required this.stackTrace,
    final DateTime? errorDateTime,
  }) : errorDateTime = errorDateTime ?? DateTime.now();

  final StackTrace stackTrace;

  // ignore: no-object-declaration
  final Object error;

  DateTime errorDateTime;

  @override
  String toString() {
    return '''
    error: $error
    ----
    ${stackTrace.toString()}
    ''';
  }
}
