import 'package:base_architecture_for_flutter/core/error/error_report/domain/error_manager.dart';
import 'package:base_architecture_for_flutter/core/error/error_report/domain/use_cases/send_error_report_use_case.dart';
import 'package:base_architecture_for_flutter/core/error/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_utils/core/core.dart';

void main() {
  late SendErrorReportUseCase sendErrorReportUseCase;

  late ErrorManager errorManager;

  const stackTrace = StackTrace.empty;

  setUp(() {
    sendErrorReportUseCase = SendErrorReportUseCaseMock();
    errorManager = ErrorManager(sendErrorReportUseCase);
  });

  setUpAll(() {
    registerFallbackValue(getErrorReport());
  });

  group('ErrorManager', () {
    test('Debería invocar 1 vez a sendErrorReportUseCase', () async {
      const environment = 'qa';
      final error = Exception();

      when(() => sendErrorReportUseCase(any())).thenAnswer((final _) async {});

      await errorManager(environment, error, stackTrace);

      verify(() => sendErrorReportUseCase(any())).called(1);
    });

    test(
        'No debería invocar ningún el caso de uso cuando el error sea NotInternetConnection',
        () async {
      const environment = 'qa';
      final error = NotInternetConnection();

      when(() => sendErrorReportUseCase(any())).thenAnswer((final _) async {});

      await errorManager(environment, error, stackTrace);

      verifyNever(() => sendErrorReportUseCase(any()));
    });

    test(
        'No debería invocar el caso de uso cuando el environment sea "dev" y el error sea Exception()',
        () async {
      const environment = 'dev';
      final error = Exception();

      when(() => sendErrorReportUseCase(any())).thenAnswer((final _) async {});

      await errorManager(environment, error, stackTrace);

      verifyNever(() => sendErrorReportUseCase(any()));
    });

    test(
        'No debería invocar ningún caso de uso cuando el environment sea null y el error sea Exception()',
        () async {
      final error = Exception();

      when(() => sendErrorReportUseCase(any())).thenAnswer((final _) async {});

      await errorManager(null, error, stackTrace);

      verifyNever(() => sendErrorReportUseCase(any()));
    });
  });
}
