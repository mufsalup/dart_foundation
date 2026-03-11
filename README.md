# Dart Foundation
Dart Foundation is a package for any dart project featuring common types, validators, failures and
errors.

## Value Objects
### Needed packages
- dartz 

### Description
Value Objects are used to have validated objects in the application. On creation they are validated
using the validator of this package. It also uses either from *dartz* to either have ValueFailures
or the value itself.

### Example (with EmailAddress)
```dart
final EmailAddress emailAddress = EmailAddress('test@gmail.com');
print(emailAdress);
> Value(Right(test@gmail.com))

final EmailAddress emailAddress = EmailAddress('test99@');
print(emailAddress);
> Value(Left(...)
```

## Validator
### Description
Validator is featuring a set of different validators (more to be implemented). They can be accessed
using the factories. An either is created with the *validate(value)* method. See example below:

### Example (with StringValidator)
```dart
final eitherResult = Validator.string().minLength(3).validate('Hello World');
print(eitherResult);
> Value(Right(Hello World))

final eitherResult = Validator.string().minLength(3).validate('Hi');
print(eitherResult);
> Value(Left(Unexpected value failure. Cause: String length < 3))
```

## Types and ValueObjects
### Description
You can use the abstract *ValueObject<Type>* to create new value objects or use predefined ones.

## Example
```dart
class NewValueObject extends ValueObject<String> {
  @override
  final Either<ValueFailure, String> value;

  const NewValueObject._(this.value);

  factory NewValueObject(final String input) {
    return NewValueObject._(
      Validator.string()
          .minLength(8)
          .validate(input)
    );
  }
}
```

## Featured ValueObjects
- UniqueId
- EmailAddress
- Password
