import 'package:dartz/dartz.dart';
import 'package:quickcare_employee_app/core/error_handler/failure_case.dart';

abstract class UseCase<Params, T> {
  Future<Either<Failure, T>> call(Params params);
}
