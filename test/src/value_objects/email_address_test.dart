import 'package:test/test.dart';
import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

void main() {
  group('EmailAddress', () {
    test('should create a valid EmailAddress for a valid email', () {
      const input = 'test@example.com';
      final email = EmailAddress(input);
      expect(email.isValid(), isTrue);
      expect(email.value, equals(right(input)));
    });

    test('should create an invalid EmailAddress for an email without @', () {
      const input = 'testexample.com';
      final email = EmailAddress(input);
      expect(email.isValid(), isFalse);
      expect(email.value.isLeft(), isTrue);
    });

    test('should create an invalid EmailAddress for an email without domain', () {
      const input = 'test@';
      final email = EmailAddress(input);
      expect(email.isValid(), isFalse);
      expect(email.value.isLeft(), isTrue);
    });

    test('should create an invalid EmailAddress for an empty string', () {
      const input = '';
      final email = EmailAddress(input);
      expect(email.isValid(), isFalse);
      expect(email.value.isLeft(), isTrue);
    });

    test('getOrCrash() should return the email string for a valid email', () {
      const input = 'user@mail.com';
      final email = EmailAddress(input);
      final result = email.getOrCrash();
      expect(result, equals(input));
    });

    test('getOrCrash() should throw ValueError for an invalid email', () {
      final email = EmailAddress('invalid-email');
      expect(() => email.getOrCrash(), throwsA(isA<ValueError>()));
    });

    test('two EmailAddress objects with same valid email should be equal', () {
      final first = EmailAddress('same@test.com');
      final second = EmailAddress('same@test.com');
      expect(first, equals(second));
    });

    test('two EmailAddress objects with different emails should not be equal', () {
      final first = EmailAddress('first@test.com');
      final second = EmailAddress('second@test.com');
      expect(first == second, isFalse);
    });

    test('toString() should return Value(...) representation for valid email', () {
      final email = EmailAddress('test@example.com');
      final result = email.toString();
      expect(result, equals('Value(Right(test@example.com))'));
    });

    test('invalid email should contain a ValueFailure on Left side', () {
      final email = EmailAddress('not-an-email');
      final result = email.value;
      expect(result.isLeft(), isTrue);
    });
  });
}