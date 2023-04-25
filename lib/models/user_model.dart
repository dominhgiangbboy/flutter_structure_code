import 'package:flutter_default_structure/domain/entities/user_entity.dart';

class UserModel extends User {
  const UserModel(super.id, super.name, super.email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        json['id'] as String, json['name'] as String, json['email'] as String);
  }
  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'name': name, 'email': email};
  }
}
