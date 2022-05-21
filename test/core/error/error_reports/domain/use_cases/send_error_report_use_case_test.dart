import 'package:base_architecture_for_flutter/core/error/error_report/domain/repositories/error_report_repository_contract.dart';
import 'package:base_architecture_for_flutter/core/error/error_report/domain/use_cases/send_error_report_use_case.dart';
import 'package:base_architecture_for_flutter/core/error/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_utils/core/core.dart';

void main() {
  late ErrorReportRepositoryContract repository;
  late SendErrorReportUseCase useCase;

  setUp(() {
    repository = ErrorReportRepositoryContractMock();
    useCase = SendErrorReportUseCase(repository);
  });

  setUpAll(() {
    registerFallbackValue(getErrorReport());
  });

  test('useCase no debería retornar ninguna excepcion', () async {
    when(() => repository.sendErrorsReport(any()))
        .thenAnswer((final _) async {});

    await useCase(getErrorReport());
  });

  test('Deberia lanzar un Failure con el mensaje del ServerException',
      () async {
    when(() => repository.sendErrorsReport(any()))
        .thenThrow(ServerException(message: failureCustomMessage));

    try {
      await useCase(getErrorReport());
      fail('No entró al catch');
    } catch (e) {
      expect(
        e,
        isA<Failure>().having(
          (final error) => error.message,
          'message',
          equals(failureCustomMessage),
        ),
      );
    }
  });
}
