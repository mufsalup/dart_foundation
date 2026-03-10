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
  });
}