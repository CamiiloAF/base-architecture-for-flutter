import 'dart:developer';

import '../../../environments/environment_interface.dart';
import '../../exceptions.dart';
import 'entities/build_error_report/build_error_report_request.dart';
import 'use_cases/send_error_report_use_case.dart';

class ErrorManager {
  ErrorManager(this._sendErrorReportUseCase);

  final SendErrorReportUseCase _sendErrorReportUseCase;

  Future<void> call(
    final String? environment,
    final Object error,
    final StackTrace stackTrace,
  ) async {
    log(error.toString(), stackTrace: stackTrace);

    if (!_shouldSendErrorReport(error, environment)) {
      return;
    }

    try {
      await _reportError(stackTrace, error);
    } catch (_) {}
  }

  bool _shouldSendErrorReport(final Object error, final String? environment) {
    return error is! NotInternetConnection &&
        environment != null &&
        environment != EnvironmentInterface.dev;
  }

  Future<void> _reportError(
    final StackTrace stackTrace,
    final Object error,
  ) async {
    final errorReport = ErrorReport(stackTrace: stackTrace, error: error);
    await _sendErrorReportUseCase(errorReport);
  }
}
