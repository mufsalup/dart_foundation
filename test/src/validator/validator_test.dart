import 'package:dart_foundation/src/validator/bool_validator.dart';
import 'package:dart_foundation/src/validator/int_validator.dart';
import 'package:test/test.dart';
import 'package:dart_foundation/dart_foundation.dart';
import 'package:dart_foundation/src/validator/string_validator.dart';

void main() {
  group('Validator', () {
    test('string() should return an instance of StringValidator', () {
      final result = Validator.string();
      expect(result, isA<StringValidator>());
    });

    test('string() should return a new StringValidator instance each time', () {
      final first = Validator.string();
      final second = Validator.string();
      expect(identical(first, second), isFalse);
    });

    test('int() should return an instance of IntValidator', () {
      final result = Validator.int();
      expect(result, isA<IntValidator>());
    });

    test('int() should return a new IntValidator instance each time', () {
      final first = Validator.int();
      final second = Validator.int();
      expect(identical(first, second), isFalse);
    });

    test('bool() should return an instance of BoolValidator', () {
      final result = Validator.bool();
      expect(result, isA<BoolValidator>());
    });

    test('bool() should return a new BoolValidator instance each time', () {
      final first = Validator.bool();
      final second = Validator.bool();
      expect(identical(first, second), isFalse);
    });
  });
}