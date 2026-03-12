import 'package:test/test.dart';
import 'package:dart_foundation/dart_foundation.dart';

void main() {
  group('ValueFailure', () {
    test('apply() should create a ValueFailure with the given message', () {
      const message = 'Invalid input';
      final failure = ValueFailure(message);
      expect(failure.message, equals(message));
    });

    test('== should return true for two ValueFailure objects with same message', () {
      final first = ValueFailure('Invalid input');
      final second = ValueFailure('Invalid input');
      expect(first, equals(second));
    });

    test('== should return false for two ValueFailure objects with different messages', () {
      final first = ValueFailure('Invalid input');
      final second = ValueFailure('Empty string');
      expect(first == second, isFalse);
    });

    test('== should return false when compared with a non-ValueFailure object', () {
      final failure = ValueFailure('Invalid input');
      expect(failure == 'Invalid input', isFalse);
    });

    test('hashCode should be equal for equal ValueFailure objects', () {
      final first = ValueFailure('Invalid input');
      final second = ValueFailure('Invalid input');
      expect(first.hashCode, equals(second.hashCode));
    });

    test('toString() should return the expected formatted message', () {
      final failure = ValueFailure('Invalid input');
      final result = failure.toString();
      expect(
        result,
        equals('Unexpected value failure. Cause: Invalid input'),
      );
    });
  });
}