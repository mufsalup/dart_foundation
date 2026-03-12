import 'package:dart_foundation/src/failures/value_failure.dart';
import 'package:meta/meta.dart';

/// Error class for unexpected value states.
/// Unlike Exceptions, Errors are throw to stop the application due to an
/// unrecoverable state. Handle with care!
@immutable
class ValueError extends Error {

  /// The value failure to display information about the error.
  final ValueFailure valueFailure;

  /// Private constructor.
  ValueError._(this.valueFailure);

  /// Public factory used for object initialization.
  factory ValueError(ValueFailure valueFailure) => ValueError._(valueFailure);

  /// Checks if the ValueError and another object are equal.
  ///
  /// [other] The other object to check
  /// Returns true if the objects are equal and false otherwise.
  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) return true;

    return other is ValueError && other.valueFailure == valueFailure;
  }

  /// Creates the hash code for the ValueError.
  @override
  int get hashCode => valueFailure.hashCode;

  /// Returns the ValueError as string.
  @override
  String toString() {
    return 'Encountered an ValueFailure at an unrecoverable point. Cause: ${valueFailure.toString()}';
  }
}