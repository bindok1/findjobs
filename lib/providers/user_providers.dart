import 'package:flutter/material.dart';
import 'package:jobsapp/models/user_models.dart';

class UserProvider with ChangeNotifier {
  late UserModel _user;
  UserModel get user => _user;
  set user(UserModel newUser) {
    _user = newUser;
    notifyListeners();
  }
}
