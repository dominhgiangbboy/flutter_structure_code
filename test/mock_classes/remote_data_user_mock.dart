import 'package:dio/dio.dart';
import 'package:flutter_default_structure/data/data_source/user_remote_data_source.dart';
import 'package:flutter_default_structure/domain/entities/user_entity.dart';

const String _baseUrl = 'https://jsonplaceholder.typicode.com';
const String errorString = 'Error';
const User firstUser = User('1', 'John Doe', '');

const User secondUser = User('2', 'Giang Do', '');

class RemoteDataSourceUserMock implements RemoteUserDataSource {
  @override
  Future<User> getUserInfo(String id) {
    if (id == firstUser.id) {
      return Future.value(firstUser);
    }
    return Future.value(secondUser);
  }

  @override
  Future<User> saveUserInfo(User user) {
    return Future.value(user);
  }
}

class RemoteDataSourceUserMockFailureNetwork implements RemoteUserDataSource {
  @override
  Future<User> getUserInfo(String id) async {
    return Future.error(DioError(
        requestOptions: RequestOptions(baseUrl: _baseUrl), error: errorString));
  }

  @override
  Future<User> saveUserInfo(User user) async {
    return Future.error(DioError(
        requestOptions: RequestOptions(baseUrl: _baseUrl), error: errorString));
  }
}

class RemoteDataSourceUserMockFailureModel implements RemoteUserDataSource {
  @override
  Future<User> getUserInfo(String id) async {
    return Future.error(Exception(errorString));
  }

  @override
  Future<User> saveUserInfo(User user) async {
    return Future.error(Exception(errorString));
  }
}
