import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';

/// Simple concrete implementation for testing the abstract ValueObject.
class TestValueObject extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  const TestValueObject._(this.value);

  factory TestValueObject(final String input) {
    return TestValueObject._(
      Validator.string()
        .minLength(6)
        .validate(input)
      );
  }
}

void main() {
  group('ValueObject', () {
    test('isValid() should return true when value is Right', () {
      final valueObject = TestValueObject('hello123');
      final result = valueObject.isValid();
      expect(result, isTrue);
    });

    test('isValid() should return false when value is Left', () {
      final valueObject = TestValueObject('hello');
      final result = valueObject.isValid();
      expect(result, isFalse);
    });

    test('getOrCrash() should return the inner value when value is Right', () {
      final valueObject = TestValueObject('hello123');
      final result = valueObject.getOrCrash();
      expect(result, equals('hello123'));
    });

    test('getOrCrash() should throw ValueError when value is Left', () {
      final valueObject = TestValueObject('hello');
      expect(() => valueObject.getOrCrash(), throwsA(isA<ValueError>()));
    });

    test('== should return true for two value objects with the same value', () {
      final first = TestValueObject('hello123');
      final second = TestValueObject('hello123');
      expect(first == second, isTrue);
    });

    test('== should return false for two value objects with different values', () {
      final first = TestValueObject('hello123');
      final second = TestValueObject('hello456');
      expect(first == second, isFalse);
    });

    test('== should return false when comparing with a non-ValueObject', () {
      final valueObject = TestValueObject('hello123');
      expect(valueObject == 'hello', isFalse);
    });

    test('hashCode should be equal for equal value objects', () {
      final first = TestValueObject('hello123');
      final second = TestValueObject('hello123');
      expect(first.hashCode, equals(second.hashCode));
    });

    test('toString() should return Value(...) representation', () {
      final valueObject = TestValueObject('hello123');
      final result = valueObject.toString();
      expect(result, equals('Value(Right(hello123))'));
    });

    test('toString() should include Left representation for invalid values', () {
      final valueObject = TestValueObject('hello');
      final result = valueObject.toString();
      expect(result.startsWith('Value(Left('), isTrue);
    });
  });
}