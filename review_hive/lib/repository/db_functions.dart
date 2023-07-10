import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/user.dart';

List<User> userList = [];
ValueNotifier<List<User>> userNotifier = ValueNotifier([]);

void addUserToDatabase(User user) async {
  final userDB = await Hive.openBox<User>("user_db");
  userDB.add(user);
  getUsersFromDB();
  userNotifier.value.add(user);
  userNotifier.notifyListeners();
}

void getUsersFromDB() async {
  final userDB = await Hive.openBox<User>("user_db");
  userDB.values.forEach(
    (element) {
      element.toString();
    },
  );
}
