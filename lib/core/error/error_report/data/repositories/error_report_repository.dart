import '../../../exceptions.dart';
import '../../domain/entities/build_error_report/build_error_report_request.dart';
import '../../domain/repositories/error_report_repository_contract.dart';

class ErrorReportRepository implements ErrorReportRepositoryContract {
  @override
  Future<void> sendErrorsReport(final ErrorReport? errorReport) async {
    try {
      // TODO(any): Handle how to send the report to your server.
    } catch (e, stackTrace) {
      throw ServerException(error: e, stackTrace: stackTrace);
    }
  }
}
