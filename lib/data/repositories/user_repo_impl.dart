import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_default_structure/core/error_handler/failure_case.dart';
import 'package:flutter_default_structure/domain/entities/user_entity.dart';
import 'package:flutter_default_structure/domain/repository/user_repository.dart';

// class UserRepositoryImpl implements UserRepository {
//   final UserRemoteDataSource remoteDataSource;

//   UserRepositoryImpl({
//     this.remoteDataSource,
//   });

//   @override
//   Future<Either<Failure, User>> getUserInfo() async {
//     try {
//       final user = await remoteDataSource.getUser();
//       return Right(user);
//     } on DioError catch (e) {
//       return Left(ServerFailure(message: e.toString()));
//     } catch (e) {
//       return Left(ModelFailure(message: e.toString()));
//     }
//   }
// }
