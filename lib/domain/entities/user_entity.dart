import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;

  const User(
    this.id,
    this.name,
    this.email,
  );

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email}';
  }

  @override
  List<Object?> get props => [id, name, email];
}
