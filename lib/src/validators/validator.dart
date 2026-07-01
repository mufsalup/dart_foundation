import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

class Validator {
  Validator._();

  static BoolValidator bool() => BoolValidator();
  static DatetimeValidator datetime() => DatetimeValidator();
  static DoubleValidator double() => DoubleValidator();
  static IntValidator int() => IntValidator();
  static StringValidator string() => StringValidator();

  static Either<ValueFailure, T> unchecked<T>(final T input) {
    return right(input);
  }
}