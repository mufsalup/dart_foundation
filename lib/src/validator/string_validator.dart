import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';

/// Type definition for rules used for the string validator.
typedef StringRule = Either<ValueFailure, String> Function(String input);

/// String validator class.
class StringValidator {

  /// List of rules to be validated.
  final List<StringRule> _rules = [];

  /// Public constructor for creation using [Validator] class.
  StringValidator();

  /// String validation method to check if input string contains at least one
  /// number.
  /// Adds specified rule to ruleset.
  StringValidator containsDigit() {
    _rules.add((input) {
      final regex = RegExp(r'.*\d.*');
      return regex.hasMatch(input)
          ? right(input)
          : left(ValueFailure.apply('String does not contain any number character.'));
    });
    return this;
  }

  /// String validation method to check if input string contains at least one
  /// lower case character.
  /// Adds specified rule to ruleset.
  StringValidator containsLowercase() {
    _rules.add((input) {
      final regex = RegExp(r'.*[a-z].*');
      return regex.hasMatch(input)
          ? right(input)
          : left(ValueFailure.apply('String does not contain any lower case character.'));
    });
    return this;
  }

  /// String validation method to check if input string contains at least one
  /// special character.
  /// Adds specified rule to ruleset.
  StringValidator containsSpecialChar() {
    _rules.add((input) {
      final regex = RegExp(r'.*[!@#$%^&*(),.?":{}|<>].*');
      return regex.hasMatch(input)
          ? right(input)
          : left(ValueFailure.apply('String does not contain any special character.'));
    });
    return this;
  }

  /// String validation method to check if input string contains at least one
  /// upper case character.
  /// Adds specified rule to ruleset.
  StringValidator containsUppercase() {
    _rules.add((input) {
      final regex = RegExp(r'.*[A-Z].*');
      return regex.hasMatch(input)
          ? right(input)
          : left(ValueFailure.apply('String does not contain any upper case character.'));
    });
    return this;
  }

  /// String validation method to check if input string has exactly X chars.
  /// Adds specified rule to ruleset.
  StringValidator hasLength(final int length) {
    _rules.add((input) {
      return input.length == length
          ? left(ValueFailure.apply('String length != ${length.toString}.'))
          : right(input);
    });
    return this;
  }

  /// String validation method to check if input string shorter than X.
  /// Adds specified rule to ruleset.
  StringValidator maxLength(final int maxLength) {
    _rules.add((input) {
      return input.length > maxLength
          ? left(ValueFailure.apply('String length > ${maxLength.toString}.'))
          : right(input);
    });
    return this;
  }

  /// String validation method to check if input string is longer than X.
  /// Adds specified rule to ruleset.
  StringValidator minLength(final int minLength) {
    _rules.add((input) {
      return input.length < minLength
          ? left(ValueFailure.apply('String length < ${minLength.toString}.'))
          : right(input);
    });
    return this;
  }

  /// String validation method to check if input string is not empty (trimmed).
  /// Adds specified rule to ruleset.
  StringValidator notEmpty() {
    _rules.add((input) {
      final trimmedString = input.trim();
      return trimmedString.isEmpty
          ? left(ValueFailure.apply('Empty string.'))
          : right(trimmedString);
    });
    return this;
  }

  /// String validation method to check if input string matches a specific RegEx (as String).
  /// Adds specified rule to ruleset.
  StringValidator matches(final String regexString) {
    final regex = RegExp(regexString);
    return matchesRegex(regex);
  }

  /// String validation method to check if input string matches a specific RegEx.
  /// Adds specified rule to ruleset.
  StringValidator matchesRegex(final RegExp regex) {
    _rules.add((input) {
      return regex.hasMatch(input)
          ? right(input)
          : left(ValueFailure.apply('Regular expression does not match.'));
    });
    return this;
  }

  /// Validate method that is taking the input value to validate.
  /// Every defined rule is applied to the input string.
  ///
  /// [input] The string to be validated.
  /// Returns Either.left if there is a validation error, Either.right otherwise.
  Either<ValueFailure, String> validate(final String input) {
    Either<ValueFailure, String> result = right(input);

    for (final rule in _rules) {
      result = result.flatMap(rule);
    }

    return result;
  }
}