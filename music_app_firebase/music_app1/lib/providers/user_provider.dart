import 'package:flutter/material.dart';
import '../models/app_user.dart';
import '../services/auth_service.dart';

class UserProvider with ChangeNotifier {
  AppUser? _user;

  AppUser? get user => _user;

  Future<void> fetchUser() async {
    _user = await AuthService().getCurrentUser();
    notifyListeners();
  }
}
