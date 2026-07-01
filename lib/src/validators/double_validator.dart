import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

/// Type definition for rules used for the double validator.
typedef DoubleRule = Either<ValueFailure, double> Function(double input);

/// Double validator class.
class DoubleValidator {

  /// List of rules to be validated.
  final List<DoubleRule> _rules = [];

  /// Public constructor for creation using [Validator] class.
  DoubleValidator();

  /// Double validation method to check if input is equal to another double.
  /// Adds specified rule to ruleset.
  DoubleValidator equals(final double equals) {
    _rules.add((input) {
      return input == equals
          ? right(input)
          : left(ValueFailure('Double must be equal to ${equals.toString()}'));
    });
    return this;
  }

  /// Double validation method to check if input is less than another integer.
  /// Adds specified rule to ruleset.
  DoubleValidator lessThan(final double lessThan) {
    _rules.add((input) {
      return input < lessThan
          ? right(input)
          : left(ValueFailure('Double must be less than ${lessThan.toString()}'));
    });
    return this;
  }

  /// Double validation method to check if input is less than or equal to
  /// another integer.
  /// Adds specified rule to ruleset.
  DoubleValidator lessThanOrEqualTo(final double lessThanOrEqualTo) {
    _rules.add((input) {
      return input <= lessThanOrEqualTo
          ? right(input)
          : left(ValueFailure('Double must be less than or equal to ${lessThanOrEqualTo.toString()}'));
    });
    return this;
  }

  /// Double validation method to check if input is greater than another integer.
  /// Adds specified rule to ruleset.
  DoubleValidator greaterThan(final double greaterThan) {
    _rules.add((input) {
      return input > greaterThan
          ? right(input)
          : left(ValueFailure('Double must be greater than ${greaterThan.toString()}'));
    });
    return this;
  }

  /// Double validation method to check if input is greater than or equal to
  /// another integer.
  /// Adds specified rule to ruleset.
  DoubleValidator greaterThanOrEqualTo(final double greaterThanOrEqualTo) {
    _rules.add((input) {
      return input >= greaterThanOrEqualTo
          ? right(input)
          : left(ValueFailure('Double must be greater than or equal to ${greaterThanOrEqualTo.toString()}'));
    });
    return this;
  }

  /// Double validation method to check if input is present in a list of
  /// integers.
  /// Adds specified rule to ruleset.
  DoubleValidator inList(final List<double> inList) {
    _rules.add((input) {
      return inList.contains(input)
          ? right(input)
          : left(ValueFailure('Double must be in accepted list.'));
    });
    return this;
  }

  /// Validate method that is taking the input value to validate.
  /// Every defined rule is applied to the input double.
  ///
  /// [input] The double to be validated.
  /// Returns Either.left if there is a validation error, Either.right otherwise.
  Either<ValueFailure, double> validate(final double input) {
    Either<ValueFailure, double> result = right(input);

    for (final rule in _rules) {
      result = result.flatMap(rule);
    }

    return result;
  }
}