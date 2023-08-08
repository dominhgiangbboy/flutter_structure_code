import 'package:dartz/dartz.dart';
import 'package:quickcare_employee_app/core/error_handler/failure_case.dart';
import 'package:quickcare_employee_app/domain/entities/user_entity.dart';
import 'package:quickcare_employee_app/domain/repository/user_repository.dart';

// Mock data for testing
const String idMockString = "1";
const String nameMockString = "Test";
const String emailMockString = "gg@gg.com";
const String errorMockString = "Error";

class MockUserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, User>> getUserInfo(String id) {
    return Future.value(const Right(User(idMockString, nameMockString, emailMockString)));
  }

  @override
  Future<Either<Failure, User>> saveUserInfo(User user) {
    return Future.value(const Right(User(idMockString, nameMockString, emailMockString)));
  }
}

// Mock data for testing failures cases
class MockUserRepositoryImplFail implements UserRepository {
  @override
  Future<Either<Failure, User>> getUserInfo(String id) {
    return Future.value(Left(ServerFailure(message: errorMockString)));
  }

  @override
  Future<Either<Failure, User>> saveUserInfo(User user) {
    return Future.value(Left(ServerFailure(message: errorMockString)));
  }
}
