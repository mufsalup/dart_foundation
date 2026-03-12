import 'package:dart_foundation/src/failures/value_failure.dart';
import 'package:dartz/dartz.dart';

typedef IntRule = Either<ValueFailure, int> Function(int input);

class IntValidator {
  final List<IntRule> _rules = [];

  IntValidator();

  IntValidator equals(final int equals) {
    _rules.add((input) {
      return input == equals
          ? right(input)
          : left(ValueFailure('Int must be equal to ${equals.toString()}'));
    });
    return this;
  }

  IntValidator lessThan(final int lessThan) {
    _rules.add((input) {
      return input < lessThan
          ? right(input)
          : left(ValueFailure('Int must be less than ${lessThan.toString()}'));
    });
    return this;
  }

  IntValidator lessThanOrEqualTo(final int lessThanOrEqualTo) {
    _rules.add((input) {
      return input <= lessThanOrEqualTo
          ? right(input)
          : left(ValueFailure('Int must be less than or equal to ${lessThanOrEqualTo.toString()}'));
    });
    return this;
  }

  IntValidator greaterThan(final int greaterThan) {
    _rules.add((input) {
      return input > greaterThan
          ? right(input)
          : left(ValueFailure('Int must be greater than ${greaterThan.toString()}'));
    });
    return this;
  }

  IntValidator greaterThanOrEqualTo(final int greaterThanOrEqualTo) {
    _rules.add((input) {
      return input >= greaterThanOrEqualTo
          ? right(input)
          : left(ValueFailure('Int must be greater than or equal to ${greaterThanOrEqualTo.toString()}'));
    });
    return this;
  }

  IntValidator inList(final List<int> inList) {
    _rules.add((input) {
      return inList.contains(input)
          ? right(input)
          : left(ValueFailure('Int must be in accepted list.'));
    });
    return this;
  }

  Either<ValueFailure, int> validate(final int input) {
    Either<ValueFailure, int> result = right(input);

    for (final rule in _rules) {
      result = result.flatMap(rule);
    }

    return result;
  }
}
