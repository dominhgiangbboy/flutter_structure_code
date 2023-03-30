import 'package:dartz/dartz.dart';
import 'package:flutter_default_structure/core/error_handler/failure_case.dart';

abstract class UseCase<Params, T> {
  Future<Either<Failure, T>> call(Params params);
}
