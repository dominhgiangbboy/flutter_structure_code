import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_default_structure/core/error_handler/failure_case.dart';
import 'package:flutter_default_structure/data/data_source/user_remote_data_source.dart';
import 'package:flutter_default_structure/domain/entities/user_entity.dart';
import 'package:flutter_default_structure/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._remoteUserDataSource);
  final RemoteUserDataSource _remoteUserDataSource;
  @override
  Future<Either<Failure, User>> getUserInfo(String id) async {
    try {
      final User user = await _remoteUserDataSource.getUserInfo(id);
      return Right(user);
    } on DioError catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } on Exception catch (e) {
      return Left(ModelFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> saveUserInfo(User user) async {
    try {
      final User userUpdated = await _remoteUserDataSource.saveUserInfo(user);
      return Right(userUpdated);
    } on DioError catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } on Exception catch (e) {
      return Left(ModelFailure(message: e.toString()));
    }
  }
}
