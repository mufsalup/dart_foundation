import 'package:test/test.dart';
import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

void main() {
  group('Password', () {
    test('should create a valid Password for a strong password', () {
      const input = 'Abcd123!';
      final password = Password(input);
      expect(password.isValid(), isTrue);
      expect(password.value, equals(right(input)));
    });

    test('should be invalid when password is shorter than 8 characters', () {
      const input = 'Ab1!cd';
      final password = Password(input);
      expect(password.isValid(), isFalse);
      expect(password.value.isLeft(), isTrue);
    });

    test('should be invalid when password has no lowercase character', () {
      const input = 'ABCD123!';
      final password = Password(input);
      expect(password.isValid(), isFalse);
      expect(password.value.isLeft(), isTrue);
    });

    test('should be invalid when password has no uppercase character', () {
      const input = 'abcd123!';
      final password = Password(input);
      expect(password.isValid(), isFalse);
      expect(password.value.isLeft(), isTrue);
    });

    test('should be invalid when password has no digit', () {
      const input = 'Abcdefg!';
      final password = Password(input);
      expect(password.isValid(), isFalse);
      expect(password.value.isLeft(), isTrue);
    });

    test('should be invalid when password has no special character', () {
      const input = 'Abcd1234';
      final password = Password(input);
      expect(password.isValid(), isFalse);
      expect(password.value.isLeft(), isTrue);
    });

    test('getOrCrash() should return the password string for a valid password', () {
      const input = 'Abcd123!';
      final password = Password(input);
      final result = password.getOrCrash();
      expect(result, equals(input));
    });

    test('getOrCrash() should throw ValueError for an invalid password', () {
      final password = Password('weak');
      expect(() => password.getOrCrash(), throwsA(isA<ValueError>()));
    });

    test('two Password objects with same valid password should be equal', () {
      final first = Password('Abcd123!');
      final second = Password('Abcd123!');
      expect(first, equals(second));
    });

    test('two Password objects with different passwords should not be equal', () {
      final first = Password('Abcd123!');
      final second = Password('Xyz987@A');
      expect(first == second, isFalse);
    });

    test('toString() should return Value(...) representation for valid password', () {
      final password = Password('Abcd123!');
      final result = password.toString();
      expect(result, equals('Value(Right(Abcd123!))'));
    });

    test('invalid password should contain a ValueFailure on Left side', () {
      final password = Password('password');
      final result = password.value;
      expect(result.isLeft(), isTrue);
    });
  });
}