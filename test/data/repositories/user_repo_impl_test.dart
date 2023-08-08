import 'package:quickcare_employee_app/core/error_handler/failure_case.dart';
import 'package:quickcare_employee_app/core/extension/util_extension.dart';
import 'package:quickcare_employee_app/data/data_source/user_remote_data_source.dart';
import 'package:quickcare_employee_app/data/repositories/user_repo_impl.dart';
import 'package:quickcare_employee_app/domain/repository/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mock_classes/remote_data_user_mock.dart';

void main() {
  test('Test user_repo_impl: Test Success Case - getUserInfo', () {
    RemoteUserDataSource remoteDataSourceUserMockSuccess = RemoteDataSourceUserMock();
    UserRepository repository = UserRepositoryImpl(remoteDataSourceUserMockSuccess);
    repository.getUserInfo(firstUser.id).then((value) {
      expect(value.getRight(), firstUser);
    });
    repository.getUserInfo(secondUser.id).then((value) {
      expect(value.getRight(), secondUser);
    });
  });

  test('Test user_repo_impl: Test Network failure Case - getUserInfo', () {
    RemoteUserDataSource remoteDataSourceUserMockFailureNetwork = RemoteDataSourceUserMockFailureNetwork();
    UserRepository repository = UserRepositoryImpl(remoteDataSourceUserMockFailureNetwork);
    repository.getUserInfo(firstUser.id).then((value) {
      expect(value.getLeft(), ServerFailure(message: errorString));
    });
  });

  test('Test user_repo_impl: Test Model Failure case - getUserInfo', () {
    RemoteUserDataSource remoteDataSourceUserMockFailureNetwork = RemoteDataSourceUserMockFailureModel();
    UserRepository repository = UserRepositoryImpl(remoteDataSourceUserMockFailureNetwork);
    repository.getUserInfo(firstUser.id).then((value) {
      expect(value.getLeft(), ModelFailure(message: errorString));
    });
  });

  test('Test user_repo_impl: Test Model Failure case - saveUserInfo', () {
    RemoteUserDataSource remoteDataSourceUserMockFailureModel = RemoteDataSourceUserMockFailureModel();
    UserRepository repository = UserRepositoryImpl(remoteDataSourceUserMockFailureModel);
    repository.saveUserInfo(firstUser).then((value) {
      expect(value.getLeft(), ModelFailure(message: errorString));
    });
  });

  test('Test user_repo_impl: Test Network Failure case - saveUserInfo', () {
    RemoteUserDataSource remoteDataSourceUserMockFailureNetwork = RemoteDataSourceUserMockFailureNetwork();
    UserRepository repository = UserRepositoryImpl(remoteDataSourceUserMockFailureNetwork);
    repository.saveUserInfo(firstUser).then((value) {
      expect(value.getLeft(), ServerFailure(message: errorString));
    });
  });

  test('Test user_repo_impl: Test Success case - saveUserInfo', () {
    RemoteUserDataSource remoteDataSourceUserMockSuccess = RemoteDataSourceUserMock();
    UserRepository repository = UserRepositoryImpl(remoteDataSourceUserMockSuccess);
    repository.saveUserInfo(firstUser).then((value) {
      expect(value.getRight(), firstUser);
    });
    repository.saveUserInfo(secondUser).then((value) {
      expect(value.getRight(), secondUser);
    });
  });
}
