import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

/// Timestamp [ValueObject]
class Timestamp extends ValueObject<DateTime> {
  /// The value representing Either a ValueFailure or the Timestamp
  @override
  final Either<ValueFailure, DateTime> value;

  /// Private constructor
  const Timestamp._(this.value);

  /// Factory for initialization applying validation rules.
  factory Timestamp(final DateTime input) =>
      Timestamp._(Validator.unchecked(input));

  /// Returns the input DateTime as Timestamp after validation.
  /// This can be used to apply specific validations.
  factory Timestamp.validated(final DateTime input, {required final DatetimeValidator validator}) =>
      Timestamp._(validator.validate(input));
}