import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

/// Type definition for rules used for the double validator.
typedef DatetimeRule = Either<ValueFailure, DateTime> Function(DateTime input);

/// Timestamp validator class.
class DatetimeValidator {

  /// List of rules to be validated.
  final List<DatetimeRule> _rules = [];

  /// Public constructor for creation using [Validator] class.
  DatetimeValidator();

  /// DateTime validation method to check if input is equal to another double.
  /// Adds specified rule to ruleset.
  DatetimeValidator equals(final DateTime equals) {
    _rules.add((input) {
      return input.isAtSameMomentAs(equals)
          ? right(input)
          : left(ValueFailure('Timestamp must be equal to ${equals.toString()}'));
    });
    return this;
  }

  /// DateTime validation method to check if input DateTime is before another
  /// DateTime.
  /// Adds specified rule to ruleset.
  DatetimeValidator isBefore(final DateTime earlierThan) {
    _rules.add((input) {
      return input.isBefore(earlierThan)
          ? right(input)
          : left(ValueFailure('DateTime must be before ${earlierThan.toString()}'));
    });
    return this;
  }

  /// DateTime validation method to check if input DateTime is after another
  /// DateTime.
  /// Adds specified rule to ruleset.
  DatetimeValidator isAfter(final DateTime afterThan) {
    _rules.add((input) {
      return input.isAfter(afterThan)
          ? right(input)
          : left(ValueFailure('DateTime must be after ${afterThan.toString()}'));
    });
    return this;
  }

  /// DateTime validation method to check that the duration to the input
  /// DateTime is less than the given duration.
  /// Adds specified rule to ruleset.
  DatetimeValidator differenceIsLessThan(final DateTime difference, final Duration duration) {
    _rules.add((input) {
      return input.difference(difference).inMilliseconds < duration.inMilliseconds
          ? right(input)
          : left(ValueFailure('Duration to compared DateTime must be less than ${duration.toString()}'));
    });
    return this;
  }

  /// DateTime validation method to check that the duration to the input
  /// DateTime is less than or equal to the given duration.
  /// Adds specified rule to ruleset.
  DatetimeValidator differenceIsLessThanOrEqualTo(final DateTime difference, final Duration duration) {
    _rules.add((input) {
      return input.difference(difference).inMilliseconds <= duration.inMilliseconds
          ? right(input)
          : left(ValueFailure('Duration to compared DateTime must be less than or equal to ${duration.toString()}'));
    });
    return this;
  }

  /// DateTime validation method to check that the duration to the input
  /// DateTime is greater than the given duration.
  /// Adds specified rule to ruleset.
  DatetimeValidator differenceIsGraterThan(final DateTime difference, final Duration duration) {
    _rules.add((input) {
      return input.difference(difference).inMilliseconds > duration.inMilliseconds
          ? right(input)
          : left(ValueFailure('Duration to compared DateTime must be greater than ${duration.toString()}'));
    });
    return this;
  }

  /// DateTime validation method to check that the duration to the input
  /// DateTime is greater than or equal to the given duration.
  /// Adds specified rule to ruleset.
  DatetimeValidator differenceIsGreaterThanOrEqualTo(final DateTime difference, final Duration duration) {
    _rules.add((input) {
      return input.difference(difference).inMilliseconds >= duration.inMilliseconds
          ? right(input)
          : left(ValueFailure('Duration to compared DateTime must be greater than or equal to ${duration.toString()}'));
    });
    return this;
  }

  /// DateTime validation method to check that the duration to the input
  /// DateTime is equal to the given duration.
  /// Adds specified rule to ruleset.
  DatetimeValidator differenceIsEqual(final DateTime difference, final Duration duration) {
    _rules.add((input) {
      return input.difference(difference).inMilliseconds == duration.inMilliseconds
          ? right(input)
          : left(ValueFailure('Duration to compared DateTime must be equal to ${duration.toString()}'));
    });
    return this;
  }

  /// Validate method that is taking the input value to validate.
  /// Every defined rule is applied to the input DateTime.
  ///
  /// [input] The DateTime to be validated.
  /// Returns Either.left if there is a validation error, Either.right otherwise.
  Either<ValueFailure, DateTime> validate(final DateTime input) {
    Either<ValueFailure, DateTime> result = right(input);

    for (final rule in _rules) {
      result = result.flatMap(rule);
    }

    return result;
  }
}