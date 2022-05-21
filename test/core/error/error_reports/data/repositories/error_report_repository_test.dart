import 'package:base_architecture_for_flutter/core/error/error_report/data/repositories/error_report_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../test_utils/core/core.dart';

void main() {
  late ErrorReportRepository repository;

  setUpAll(() {
    registerFallbackValue(getErrorReport());
  });

  setUp(() {
    repository = ErrorReportRepository();
  });

  group('sendErrorsReport', () {
    test('No debería retornar una excepcion', () async {
      // TODO(any): Make test here.
      await repository.sendErrorsReport(getErrorReport());
      expect(true, true);
    });
  });
}
