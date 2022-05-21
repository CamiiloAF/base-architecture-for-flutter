import 'package:base_architecture_for_flutter/core/local_storage/data/local_storage_impl.dart';
import 'package:base_architecture_for_flutter/core/local_storage/domain/exceptions/local_storage_exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FlutterSecureStorageMock extends Mock implements FlutterSecureStorage {}

void main() {
  late LocalStorageImpl localStorageImpl;
  late FlutterSecureStorage flutterSecureStorage;

  setUp(() {
    flutterSecureStorage = FlutterSecureStorageMock();
    localStorageImpl = LocalStorageImpl(flutterSecureStorage);
  });

  group('localStorageImpl', () {
    const fakeKey = 'fake-key';

    group('delete', () {
      test('FlutterSecureStorage.delete debe ser llamado 1 vez', () async {
        when(() => flutterSecureStorage.delete(key: any(named: 'key')))
            .thenAnswer((final _) async {});

        await localStorageImpl.delete(fakeKey);
        verify(() => flutterSecureStorage.delete(key: fakeKey)).called(1);
      });

      test('Debe lanzar un LocalStorageException', () async {
        when(() => flutterSecureStorage.delete(key: any(named: 'key')))
            .thenThrow(
          LocalStorageException(
            'There was an error trying to remove $fakeKey from storage',
            null,
          ),
        );

        expect(
          () async => localStorageImpl.delete(fakeKey),
          throwsA(
            isA<LocalStorageException>().having(
              (final e) => e.message,
              'message',
              'There was an error trying to remove $fakeKey from storage',
            ),
          ),
        );
      });
    });

    group('fetch', () {
      test(
          'FlutterSecureStorage.read debe ser llamado 1 vez y retornar '
          '"fake-fetched" cuando todo salga bien', () async {
        when(() => flutterSecureStorage.read(key: any(named: 'key')))
            .thenAnswer((final _) async => 'fake-fetched');

        final result = await localStorageImpl.fetch(fakeKey);

        expect(result, 'fake-fetched');
        verify(() => flutterSecureStorage.read(key: fakeKey)).called(1);
      });

      test('Debe lanzar un LocalStorageException', () async {
        when(() => flutterSecureStorage.read(key: any(named: 'key'))).thenThrow(
          LocalStorageException(
            'There was an error trying to read $fakeKey in storage',
            null,
          ),
        );

        expect(
          () async => localStorageImpl.fetch(fakeKey),
          throwsA(
            isA<LocalStorageException>().having(
              (final e) => e.message,
              'message',
              'There was an error trying to read $fakeKey in storage',
            ),
          ),
        );
      });
    });

    group('save', () {
      const saveValue = 'fake-value';
      test('FlutterSecureStorage.write debe ser llamado 1 vez', () async {
        when(
          () => flutterSecureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        ).thenAnswer((final _) async {});

        await localStorageImpl.save(key: fakeKey, value: saveValue);

        verify(() => flutterSecureStorage.write(key: fakeKey, value: saveValue))
            .called(1);
      });

      test('Debe lanzar un LocalStorageException', () async {
        when(
          () => flutterSecureStorage.write(
            key: any(named: 'key'),
            value: any(named: 'value'),
          ),
        ).thenThrow(
          LocalStorageException(
            'There was an error trying to write $fakeKey in storage',
            null,
          ),
        );

        expect(
          () async => localStorageImpl.save(key: fakeKey, value: saveValue),
          throwsA(
            isA<LocalStorageException>().having(
              (final e) => e.message,
              'message',
              'There was an error trying to write $fakeKey in storage',
            ),
          ),
        );
      });
    });

    group('clean', () {
      test('FlutterSecureStorage.deleteAll debe ser llamado 1 vez', () async {
        when(flutterSecureStorage.deleteAll).thenAnswer((final _) async {});

        await localStorageImpl.clean();

        verify(flutterSecureStorage.deleteAll).called(1);
      });

      test('Debe lanzar un LocalStorageException', () async {
        when(() => flutterSecureStorage.deleteAll()).thenThrow(
          LocalStorageException(
            'There was an error trying to clean storage',
            null,
          ),
        );

        expect(
          () async => localStorageImpl.clean(),
          throwsA(
            isA<LocalStorageException>().having(
              (final e) => e.message,
              'message',
              'There was an error trying to clean storage',
            ),
          ),
        );
      });
    });
  });
}
