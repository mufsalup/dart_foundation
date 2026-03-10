import 'package:test/test.dart';
import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

void main() {
  group('StringValidator', () {
    test('containsDigit() should pass when string contains a digit', () {
      final validator = Validator.string().containsDigit();
      final result = validator.validate('abc1def');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('abc1def')));
    });

    test('containsDigit() should fail when string does not contain a digit', () {
      final validator = Validator.string().containsDigit();
      final result = validator.validate('abcdef');
      expect(result.isLeft(), isTrue);
    });

    test('containsLowercase() should pass when string contains lowercase letters', () {
      final validator = Validator.string().containsLowercase();
      final result = validator.validate('ABCdEF');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('ABCdEF')));
    });

    test('containsLowercase() should fail when string has no lowercase letters', () {
      final validator = Validator.string().containsLowercase();
      final result = validator.validate('ABCDEF');
      expect(result.isLeft(), isTrue);
    });

    test('containsUppercase() should pass when string contains uppercase letters', () {
      final validator = Validator.string().containsUppercase();
      final result = validator.validate('abcDef');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('abcDef')));
    });

    test('containsUppercase() should fail when string has no uppercase letters', () {
      final validator = Validator.string().containsUppercase();
      final result = validator.validate('abcdef');
      expect(result.isLeft(), isTrue);
    });

    test('containsSpecialChar() should pass when string contains a special character', () {
      final validator = Validator.string().containsSpecialChar();
      final result = validator.validate('abc@123');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('abc@123')));
    });

    test('containsSpecialChar() should fail when string has no special character', () {
      final validator = Validator.string().containsSpecialChar();
      final result = validator.validate('abc123');
      expect(result.isLeft(), isTrue);
    });

    test('minLength() should pass when string length is at least the minimum', () {
      final validator = Validator.string().minLength(3);
      final result = validator.validate('abcd');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('abcd')));
    });

    test('minLength() should fail when string length is shorter than the minimum', () {
      final validator = Validator.string().minLength(5);
      final result = validator.validate('abc');
      expect(result.isLeft(), isTrue);
    });

    test('maxLength() should pass when string length is within the maximum', () {
      final validator = Validator.string().maxLength(5);
      final result = validator.validate('abc');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('abc')));
    });

    test('maxLength() should fail when string length exceeds the maximum', () {
      final validator = Validator.string().maxLength(3);
      final result = validator.validate('abcdef');
      expect(result.isLeft(), isTrue);
    });

    test('hasLength() should pass when string has exactly the specified length', () {
      final validator = Validator.string().hasLength(4);
      final result = validator.validate('abcd');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('abcd')));
    });

    test('hasLength() should fail when string length does not exactly match', () {
      final validator = Validator.string().hasLength(4);
      final result = validator.validate('abc');
      expect(result.isLeft(), isTrue);
    });

    test('notEmpty() should trim and pass for non-empty input', () {
      final validator = Validator.string().notEmpty();
      final result = validator.validate('  hello  ');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('hello')));
    });

    test('notEmpty() should fail for empty trimmed input', () {
      final validator = Validator.string().notEmpty();
      final result = validator.validate('   ');
      expect(result.isLeft(), isTrue);
    });

    test('matches() should pass when string matches the regex string', () {
      final validator = Validator.string().matches(r'^[a-z]+$');
      final result = validator.validate('hello');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('hello')));
    });

    test('matches() should fail when string does not match the regex string', () {
      final validator = Validator.string().matches(r'^[a-z]+$');
      final result = validator.validate('hello123');
      expect(result.isLeft(), isTrue);
    });

    test('matchesRegex() should pass when string matches the RegExp', () {
      final validator = Validator.string().matchesRegex(RegExp(r'^\d+$'));
      final result = validator.validate('12345');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('12345')));
    });

    test('matchesRegex() should fail when string does not match the RegExp', () {
      final validator = Validator.string().matchesRegex(RegExp(r'^\d+$'));
      final result = validator.validate('12ab');
      expect(result.isLeft(), isTrue);
    });

    test('validate() should apply multiple rules in order and pass when all succeed', () {
      final validator = Validator.string()
          .notEmpty()
          .containsUppercase()
          .containsLowercase()
          .containsDigit()
          .containsSpecialChar()
          .minLength(8);
      final result = validator.validate('Abcd123!');
      expect(result.isRight(), isTrue);
      expect(result, equals(right('Abcd123!')));
    });

    test('validate() should fail when one of multiple rules fails', () {
      final validator = Validator.string()
          .notEmpty()
          .containsUppercase()
          .containsLowercase()
          .containsDigit()
          .containsSpecialChar()
          .minLength(8);
      final result = validator.validate('abcd1234');
      expect(result.isLeft(), isTrue);
    });
  });
}