import 'package:dartz/dartz.dart';

extension EitherExtension<T, E> on Either<T, E> {
  /// Returns the value from this [Left]
  T getLeft() {
    return (this as Left).value;
  }

  E getRight() {
    return (this as Right).value;
  }
}
