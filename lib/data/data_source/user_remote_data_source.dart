import 'package:flutter_default_structure/core/api_client/restful_client.dart';

import '../../domain/entities/user_entity.dart';

abstract class RemoteUserDataSource {
  Future<User> getUserInfo(String id);
  Future<User> saveUserInfo(User user);
}

class RemoteDataSourceUser implements RemoteUserDataSource {
  final RestfulClient _client;
  RemoteDataSourceUser(this._client);
  @override
  Future<User> getUserInfo(String id) {
    // TODO: implement saveUserInfo
    throw UnimplementedError();
  }

  @override
  Future<User> saveUserInfo(User user) {
    // TODO: implement saveUserInfo
    throw UnimplementedError();
  }
}
