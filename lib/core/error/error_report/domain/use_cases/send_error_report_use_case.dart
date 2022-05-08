import '../../../../use_case/use_case.dart';
import '../../../exceptions.dart';
import '../entities/build_error_report/build_error_report_request.dart';
import '../repositories/error_report_repository_contract.dart';

class SendErrorReportUseCase implements UseCase<Future<void>, ErrorReport> {
  SendErrorReportUseCase(this._errorReportRepositoryContract);

  final ErrorReportRepositoryContract _errorReportRepositoryContract;

  @override
  Future<void> call(final ErrorReport params) async {
    try {
      await _errorReportRepositoryContract.sendErrorsReport(params);
    } on ServerException catch (e) {
      throw Failure(e.message);
    }
  }
}
