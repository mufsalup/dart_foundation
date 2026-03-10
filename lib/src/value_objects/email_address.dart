import 'package:dart_foundation/src/failures/value_failure.dart';
import 'package:dart_foundation/src/types/value_object.dart';
import 'package:dart_foundation/src/validator/validator.dart';
import 'package:dartz/dartz.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  const EmailAddress._(this.value);

  factory EmailAddress(final String input) {
    return EmailAddress._(
      Validator.string()
          .matches(r"""^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$""")
          .validate(input),
    );
  }
}
