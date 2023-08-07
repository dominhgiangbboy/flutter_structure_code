import 'package:dartz/dartz.dart';
import 'package:seltle_app/core/base_use_case/use_case.dart';
import 'package:seltle_app/core/error_handler/failure_case.dart';
import 'package:seltle_app/domain/repository/user_repository.dart';
import 'package:seltle_app/domain/entities/user_entity.dart';

class GetUserInfo implements UseCase<String, User> {
  final UserRepository _userRepository;

  GetUserInfo(this._userRepository);

  @override
  Future<Either<Failure, User>> call(String id) async {
    return await _userRepository.getUserInfo(id);
  }
}
