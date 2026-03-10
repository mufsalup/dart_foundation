import 'package:meta/meta.dart';

/// Failure class used for failures with value objects in a controlled way.
///
/// [message] The failure message of the ValueFailure
@immutable
class ValueFailure {
  final String message;

  /// Private constructor.
  const ValueFailure._(this.message);

  /// Public factory used for object initialization.
  factory ValueFailure.apply(String message) => ValueFailure._(message);

  /// Checks if the ValueFailure and another object are equal.
  ///
  /// [other] The other object to check
  /// Returns true if the objects are equal and false otherwise.
  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) return true;

    return other is ValueFailure && other.message == message;
  }

  /// Creates the hash code for the ValueFailure.
  @override
  int get hashCode => message.hashCode;

  /// Returns the ValueFailure message as string.
  @override
  String toString() => 'Unexpected value failure. Cause: $message';
}