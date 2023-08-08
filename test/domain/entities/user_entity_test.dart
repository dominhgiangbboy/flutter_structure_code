import 'package:quickcare_employee_app/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test User Entity toStringMethod', () {
    const User testUser = User('1', 'Test User', '');
    final testUserString = testUser.toString();
    expect(testUserString, 'User{id: 1, name: Test User, email: }');
  });
  test('Test User Entity test Equatable', () {
    const User testUserWrongID = User('2', 'Test User', '');
    const User testUserWrongName = User('1', 'Test User 2', '');
    const User testUserWrongEmail = User('1', 'Test User', 'ggg');
    const User testUser = User('1', 'Test User', '');

    expect(testUserWrongID, isNot(testUser));
    expect(testUserWrongName, isNot(testUser));
    expect(testUserWrongEmail, isNot(testUser));
    expect(testUser, testUser);
  });
}
