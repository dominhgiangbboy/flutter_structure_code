import 'package:dartz/dartz.dart';
import 'package:flutter_default_structure/core/base_use_case/use_case.dart';
import 'package:flutter_default_structure/core/error_handler/failure_case.dart';
import 'package:flutter_default_structure/domain/entities/user_entity.dart';
import 'package:flutter_default_structure/domain/repository/user_repository.dart';

class GetUserInfo implements UseCase<String, User> {
  final UserRepository _userRepository;

  GetUserInfo(this._userRepository);

  @override
  Future<Either<Failure, User>> call(String id) async {
    return await _userRepository.getUserInfo(id);
  }
}
