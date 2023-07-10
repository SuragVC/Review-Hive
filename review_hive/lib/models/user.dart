import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  int? _id;
  @HiveField(1)
  String? _username;
  @HiveField(2)
  String? _email;
  @HiveField(3)
  String? _password;

  User();

  int? get id => _id;
  String? get username => _username;
  String? get email => _email;
  String? get password => _password;

  set setID(int id) => _id = id;
  set setUsername(String username) => _username = username;
  set setEmail(String email) => _email = email;
  set setPassword(String password) => _password = password;

  @override
  String toString() {
    return 'User(id: $_id, username: $_username, email: $_email, password: $_password)';
  }
}
