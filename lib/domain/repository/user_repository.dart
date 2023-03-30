import 'package:dartz/dartz.dart';
import 'package:flutter_default_structure/core/error_handler/failure_case.dart';
import 'package:flutter_default_structure/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUserInfo(String id);
  Future<Either<Failure, User>> saveUserInfo(User user);
}
