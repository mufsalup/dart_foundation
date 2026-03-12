import 'package:test/test.dart';
import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

void main() {
  group('UniqueId', () {
    test('UniqueId() should create a valid value object', () {
      final uniqueId = UniqueId.uuidV4();
      expect(uniqueId.isValid(), isTrue);
      expect(uniqueId.value.isRight(), isTrue);
    });

    test('UniqueId() should generate a non-empty string', () {
      final uniqueId = UniqueId.uuidV4();
      final value = uniqueId.getOrCrash();
      expect(value, isNotEmpty);
    });

    test('UniqueId() should generate different values for different instances', () {
      final first = UniqueId.uuidV4();
      final second = UniqueId.uuidV4();
      expect(first == second, isFalse);
      expect(first.getOrCrash(), isNot(equals(second.getOrCrash())));
    });

    test('fromUniqueString() should wrap the provided string in Right', () {
      const input = 'custom-id-123';
      final uniqueId = UniqueId.fromUniqueString(input);
      expect(uniqueId.isValid(), isTrue);
      expect(uniqueId.value, equals(right(input)));
    });

    test('fromUniqueString() should return the provided string with getOrCrash()', () {
      const input = 'custom-id-123';
      final uniqueId = UniqueId.fromUniqueString(input);
      final result = uniqueId.getOrCrash();
      expect(result, equals(input));
    });

    test('two UniqueId objects from the same string should be equal', () {
      final first = UniqueId.fromUniqueString('same-id');
      final second = UniqueId.fromUniqueString('same-id');
      expect(first, equals(second));
    });

    test('two UniqueId objects from different strings should not be equal', () {
      final first = UniqueId.fromUniqueString('id-1');
      final second = UniqueId.fromUniqueString('id-2');
      expect(first == second, isFalse);
    });

    test('hashCode should be equal for UniqueId objects with the same value', () {
      final first = UniqueId.fromUniqueString('same-id');
      final second = UniqueId.fromUniqueString('same-id');
      expect(first.hashCode, equals(second.hashCode));
    });

    test('toString() should return Value(...) representation for fromUniqueString()', () {
      final uniqueId = UniqueId.fromUniqueString('my-id');
      final result = uniqueId.toString();
      expect(result, equals('Value(Right(my-id))'));
    });

    test('generated UniqueId should look like a UUID v4 string', () {
      final uuidV4Pattern = RegExp(
        r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
      );
      final uniqueId = UniqueId.uuidV4();
      final value = uniqueId.getOrCrash();
      expect(uuidV4Pattern.hasMatch(value), isTrue);
    });
  });
}