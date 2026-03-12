import 'package:dart_foundation/src/failures/value_failure.dart';
import 'package:dartz/dartz.dart';

/// Type definition for rules used for the int validator.
typedef IntRule = Either<ValueFailure, int> Function(int input);

/// Integer validator class.
class IntValidator {

  /// List of rules to be validated.
  final List<IntRule> _rules = [];

  /// Public constructor for creation using [Validator] class.
  IntValidator();

  /// Integer validation method to check if input is equal to another integer.
  /// Adds specified rule to ruleset.
  IntValidator equals(final int equals) {
    _rules.add((input) {
      return input == equals
          ? right(input)
          : left(ValueFailure('Int must be equal to ${equals.toString()}'));
    });
    return this;
  }

  /// Integer validation method to check if input is less than another integer.
  /// Adds specified rule to ruleset.
  IntValidator lessThan(final int lessThan) {
    _rules.add((input) {
      return input < lessThan
          ? right(input)
          : left(ValueFailure('Int must be less than ${lessThan.toString()}'));
    });
    return this;
  }

  /// Integer validation method to check if input is less than or equal to
  /// another integer.
  /// Adds specified rule to ruleset.
  IntValidator lessThanOrEqualTo(final int lessThanOrEqualTo) {
    _rules.add((input) {
      return input <= lessThanOrEqualTo
          ? right(input)
          : left(ValueFailure('Int must be less than or equal to ${lessThanOrEqualTo.toString()}'));
    });
    return this;
  }

  /// Integer validation method to check if input is greater than another integer.
  /// Adds specified rule to ruleset.
  IntValidator greaterThan(final int greaterThan) {
    _rules.add((input) {
      return input > greaterThan
          ? right(input)
          : left(ValueFailure('Int must be greater than ${greaterThan.toString()}'));
    });
    return this;
  }

  /// Integer validation method to check if input is greater than or equal to
  /// another integer.
  /// Adds specified rule to ruleset.
  IntValidator greaterThanOrEqualTo(final int greaterThanOrEqualTo) {
    _rules.add((input) {
      return input >= greaterThanOrEqualTo
          ? right(input)
          : left(ValueFailure('Int must be greater than or equal to ${greaterThanOrEqualTo.toString()}'));
    });
    return this;
  }

  /// Integer validation method to check if input is present in a list of
  /// integers.
  /// Adds specified rule to ruleset.
  IntValidator inList(final List<int> inList) {
    _rules.add((input) {
      return inList.contains(input)
          ? right(input)
          : left(ValueFailure('Int must be in accepted list.'));
    });
    return this;
  }

  /// Validate method that is taking the input value to validate.
  /// Every defined rule is applied to the input integer.
  ///
  /// [input] The integer to be validated.
  /// Returns Either.left if there is a validation error, Either.right otherwise.
  Either<ValueFailure, int> validate(final int input) {
    Either<ValueFailure, int> result = right(input);

    for (final rule in _rules) {
      result = result.flatMap(rule);
    }

    return result;
  }
}
