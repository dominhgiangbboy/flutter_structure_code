import 'package:dartz/dartz.dart';
import 'package:seltle_app/core/error_handler/failure_case.dart';
import 'package:seltle_app/domain/entities/user_entity.dart';
import 'package:seltle_app/domain/repository/user_repository.dart';
import 'package:seltle_app/domain/use_cases/user_info_uc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_classes/mock_user_repository_impl.dart';

void main() {
  test("Test use case return data", () {
    /// Mock data for testing use case
    UserRepository userRepository = MockUserRepositoryImpl();

    /// Use case instances  for testing
    GetUserInfo getUserInfo = GetUserInfo(userRepository);

    /// Test use case
    getUserInfo(idMockString).then((value) {
      expect((value as Right).value, const User(idMockString, nameMockString, emailMockString));
    });
  });

  test("Failure case user usecase", () {
    UserRepository userRepositoryFail = MockUserRepositoryImplFail();
    GetUserInfo getUserInfoFail = GetUserInfo(userRepositoryFail);
    getUserInfoFail(idMockString).then((value) {
      expect((value as Left).value, ServerFailure(message: "Error"));
    });
  });
}
