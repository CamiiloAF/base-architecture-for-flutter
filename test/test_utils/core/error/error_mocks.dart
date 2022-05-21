import 'package:base_architecture_for_flutter/core/error/error_report/domain/repositories/error_report_repository_contract.dart';
import 'package:base_architecture_for_flutter/core/error/error_report/domain/use_cases/send_error_report_use_case.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mocktail/mocktail.dart';

class ErrorReportRepositoryContractMock extends Mock
    implements ErrorReportRepositoryContract {}

class DeviceInfoPluginMock extends Mock implements DeviceInfoPlugin {}

class SendErrorReportUseCaseMock extends Mock
    implements SendErrorReportUseCase {}
