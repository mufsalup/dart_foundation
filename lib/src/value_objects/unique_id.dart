import 'package:dart_foundation/dart_foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

/// UniqueId [ValueObject]
class UniqueId extends ValueObject<String> {
  /// The value representing Either a ValueFailure or the UniqueId
  @override
  final Either<ValueFailure, String> value;

  /// Private constructor
  const UniqueId._(this.value);

  /// Factory method for applying a new UniqueId.
  /// This method is calling the UUID service to generate a new UniqueId.
  factory UniqueId.uuidV4() =>
      UniqueId._(Validator.unchecked(const Uuid().v4()));

  /// Returns the input string as UniqueId.
  ///
  /// There is no possible way to check if an id is unique or not.
  /// Therefore we have to trust that we only use it if the know it is.
  factory UniqueId.fromUniqueString(final String uniqueId) =>
      UniqueId._(Validator.unchecked(uniqueId));
}
