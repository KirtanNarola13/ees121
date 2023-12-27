import 'package:ees121/Screens/login_procces/Global/global.dart';
import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  PasswordVisible password = PasswordVisible(obscureText: true);

  void toggle() {
    password.obscureText = !password.obscureText;
    notifyListeners();
  }
}
