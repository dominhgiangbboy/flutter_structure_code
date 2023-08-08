import 'package:dartz/dartz.dart';
import 'package:quickcare_employee_app/core/error_handler/failure_case.dart';
import 'package:quickcare_employee_app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUserInfo(String id);
  Future<Either<Failure, User>> saveUserInfo(User user);
}
