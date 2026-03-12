import 'package:dart_foundation/dart_foundation.dart';
import 'package:dart_foundation/src/validator/bool_validator.dart';
import 'package:dart_foundation/src/validator/int_validator.dart';
import 'package:dart_foundation/src/validator/string_validator.dart';
import 'package:dartz/dartz.dart';

class Validator {
  Validator._();

  static BoolValidator bool() => BoolValidator();
  static IntValidator int() => IntValidator();
  static StringValidator string() => StringValidator();

  static Either<ValueFailure, T> unchecked<T>(final T input) {
    return right(input);
  }
}