import 'package:test/test.dart';
import 'package:dart_foundation/dart_foundation.dart';

void main() {
  group('ValueError', () {
    test('apply() should create a ValueError with the given ValueFailure', () {
      final failure = ValueFailure('Invalid input');
      final error = ValueError(failure);
      expect(error.valueFailure, equals(failure));
    });

    test('== should return true for two ValueError objects with same ValueFailure', () {
      final first = ValueError(
        ValueFailure('Invalid input'),
      );
      final second = ValueError(
        ValueFailure('Invalid input'),
      );
      expect(first, equals(second));
    });

    test('== should return false for two ValueError objects with different ValueFailure', () {
      final first = ValueError(
        ValueFailure('Invalid input'),
      );
      final second = ValueError(
        ValueFailure('Empty string'),
      );
      expect(first == second, isFalse);
    });

    test('== should return false when compared with a non-ValueError object', () {
      final error = ValueError(
        ValueFailure('Invalid input'),
      );
      expect(error == 'Invalid input', isFalse);
    });

    test('hashCode should be equal for equal ValueError objects', () {
      final first = ValueError(
        ValueFailure('Invalid input'),
      );
      final second = ValueError(
        ValueFailure('Invalid input'),
      );
      expect(first.hashCode, equals(second.hashCode));
    });

    test('toString() should return the expected formatted message', () {
      final error = ValueError(
        ValueFailure('Invalid input'),
      );
      final result = error.toString();
      expect(
        result,
        equals(
          'Encountered an ValueFailure at an unrecoverable point. '
              'Cause: Unexpected value failure. Cause: Invalid input',
        ),
      );
    });

    test('should be throwable as an Error', () {
      final error = ValueError(
        ValueFailure('Invalid input'),
      );
      expect(() => throw error, throwsA(isA<ValueError>()));
    });
  });
}