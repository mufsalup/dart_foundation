import 'package:test/test.dart';
import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

void main() {
  group('BoolValidator', () {
    test('validate() should pass for true when no rules are defined', () {
      final validator = Validator.bool();
      final result = validator.validate(true);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(true)));
    });

    test('validate() should pass for false when no rules are defined', () {
      final validator = Validator.bool();
      final result = validator.validate(false);
      expect(result.isRight(), isTrue);
      expect(result, equals(right(false)));
    });
  });
}