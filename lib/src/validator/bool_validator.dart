import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

/// Type definition for rules used for the string validator.
typedef BoolRule = Either<ValueFailure, bool> Function(bool input);

/// Bool validator class.
class BoolValidator {

  /// List of rules to be validated.
  final List<BoolRule> _rules = [];

  BoolValidator();

  /// Validate method that is taking the input value to validate.
  /// Every defined rule is applied to the input bool.
  ///
  /// [input] The bool to be validated.
  /// Returns Either.left if there is a validation error, Either.right otherwise.
  Either<ValueFailure, bool> validate(final bool input) {
    Either<ValueFailure, bool> result = right(input);

    for (final rule in _rules) {
      result = result.flatMap(rule);
    }

    return result;
  }
}