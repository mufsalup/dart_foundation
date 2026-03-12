import 'package:test/test.dart';
import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

void main() {
  group('IntValidator', () {
    test('equals() should pass when int is equal to the specified value', () {
      final validator = Validator.int().equals(5);
      final result = validator.validate(5);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(5)));
    });

    test('equals() should fail when int is not equal to the specified value', () {
      final validator = Validator.int().equals(5);
      final result = validator.validate(3);
      expect(result.isLeft(), isTrue);
    });

    test('lessThan() should pass when int is less than the specified value', () {
      final validator = Validator.int().lessThan(10);
      final result = validator.validate(7);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(7)));
    });

    test('lessThan() should fail when int is not less than the specified value', () {
      final validator = Validator.int().lessThan(10);
      final result = validator.validate(10);
      expect(result.isLeft(), isTrue);
    });

    test('lessThanOrEqualTo() should pass when int is less than the specified value', () {
      final validator = Validator.int().lessThanOrEqualTo(10);
      final result = validator.validate(7);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(7)));
    });

    test('lessThanOrEqualTo() should pass when int is equal to the specified value', () {
      final validator = Validator.int().lessThanOrEqualTo(10);
      final result = validator.validate(10);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(10)));
    });

    test('lessThanOrEqualTo() should fail when int is greater than the specified value', () {
      final validator = Validator.int().lessThanOrEqualTo(10);
      final result = validator.validate(11);
      expect(result.isLeft(), isTrue);
    });

    test('greaterThan() should pass when int is greater than the specified value', () {
      final validator = Validator.int().greaterThan(5);
      final result = validator.validate(8);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(8)));
    });

    test('greaterThan() should fail when int is not greater than the specified value', () {
      final validator = Validator.int().greaterThan(5);
      final result = validator.validate(5);
      expect(result.isLeft(), isTrue);
    });

    test('greaterThanOrEqualTo() should pass when int is greater than the specified value', () {
      final validator = Validator.int().greaterThanOrEqualTo(5);
      final result = validator.validate(8);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(8)));
    });

    test('greaterThanOrEqualTo() should pass when int is equal to the specified value', () {
      final validator = Validator.int().greaterThanOrEqualTo(5);
      final result = validator.validate(5);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(5)));
    });

    test('greaterThanOrEqualTo() should fail when int is less than the specified value', () {
      final validator = Validator.int().greaterThanOrEqualTo(5);
      final result = validator.validate(4);
      expect(result.isLeft(), isTrue);
    });

    test('inList() should pass when int is in the accepted list', () {
      final validator = Validator.int().inList([1, 2, 3, 4, 5]);
      final result = validator.validate(3);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(3)));
    });

    test('inList() should fail when int is not in the accepted list', () {
      final validator = Validator.int().inList([1, 2, 3, 4, 5]);
      final result = validator.validate(9);
      expect(result.isLeft(), isTrue);
    });

    test('validate() should apply multiple rules in order and pass when all succeed', () {
      final validator = Validator.int()
          .greaterThan(0)
          .lessThan(100)
          .inList([10, 20, 30, 40, 50]);
      final result = validator.validate(20);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(20)));
    });

    test('validate() should fail when one of multiple rules fails', () {
      final validator = Validator.int()
          .greaterThan(0)
          .lessThan(100)
          .inList([10, 20, 30, 40, 50]);
      final result = validator.validate(25);
      expect(result.isLeft(), isTrue);
    });
  });
}