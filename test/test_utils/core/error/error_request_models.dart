import 'package:base_architecture_for_flutter/core/error/error_report/domain/entities/build_error_report/build_error_report_request.dart';

ErrorReport getErrorReport() => ErrorReport(
      errorDateTime: DateTime.now(),
      stackTrace: StackTrace.empty,
      error: 'error',
    );
