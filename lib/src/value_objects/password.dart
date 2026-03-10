import 'package:dart_foundation/src/failures/value_failure.dart';
import 'package:dart_foundation/src/types/value_object.dart';
import 'package:dart_foundation/src/validator/validator.dart';
import 'package:dartz/dartz.dart';

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  const Password._(this.value);

  factory Password(final String input) {
    return Password._(
      Validator.string()
          .minLength(8)
          .containsLowercase()
          .containsUppercase()
          .containsDigit()
          .containsSpecialChar()
          .validate(input)
    );
  }
}