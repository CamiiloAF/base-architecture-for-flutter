import '../entities/build_error_report/build_error_report_request.dart';

abstract class ErrorReportRepositoryContract {
  /// Send error report to backend or error reporting like Sentry o Crashlytics
  Future<void> sendErrorsReport(final ErrorReport? errorReport);
}
