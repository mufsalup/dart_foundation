import 'package:dart_foundation/dart_foundation.dart';
import 'package:dart_foundation/src/value_objects/timestamp.dart';
import 'package:test/test.dart';

void main() {
  group('Timestamp', () {
    test('Validate factory should apply validations', () {
      final timestamp = Timestamp.validated(
          DateTime.now(),
          validator: Validator.datetime().isBefore(DateTime(10000))
      );
      expect(timestamp.isValid(), isTrue);
      expect(timestamp.value.isRight(), isTrue);

      final failingTimestamp = Timestamp.validated(
          DateTime.now(),
          validator: Validator.datetime().isBefore(DateTime(0))
      );
      expect(failingTimestamp.isValid(), isFalse);
      expect(failingTimestamp.value.isLeft(), isTrue);
    });
  });
}