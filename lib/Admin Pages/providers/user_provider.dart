import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void deleteUser(String id) {
    _users.removeWhere((u) => u.id == id);
    notifyListeners();
  }
}
