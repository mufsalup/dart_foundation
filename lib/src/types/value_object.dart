import 'package:dart_foundation/src/errors/value_error.dart';
import 'package:dart_foundation/src/failures/value_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

/// Abstract base class for value objects.
///
/// [value] The value (of generic type T) of the ValueObject
@immutable
abstract class ValueObject<T> {

  /// Empty constructor
  const ValueObject();

  /// [value] Value of the ValueObject represented by [Either] a [ValueFailure]
  /// or the generic [T].
  Either<ValueFailure, T> get value;

  /// Checks if the value is valid.
  ///
  /// Returns true if the value is valid, false otherwise
  bool isValid() => value.isRight();

  /// Helper method to get the value or throw an Error.
  /// Instead of Exceptions, Errors are made to stop the application.
  /// This method should only be used when it is expected, that the value is valid.
  T getOrCrash() {
    return value.fold((failure) => throw ValueError.apply(failure), (value) => value);
  }

  /// Checks if the ValueObject and another object are equal.
  ///
  /// [other] The other object to check
  /// Returns true if the objects are equal and false otherwise.
  @override
  bool operator ==(final Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  /// Creates the hash code for the ValueObject.
  ///
  /// Returns the hash code of the ValueObject.
  @override
  int get hashCode => value.hashCode;

  /// Returns the value object as string wrapped with Value(...)
  ///
  /// Returns the ValueObject as string.
  @override
  String toString() => 'Value($value)';
}