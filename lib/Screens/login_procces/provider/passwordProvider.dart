import 'package:flutter/material.dart';

class PasswordProvider with ChangeNotifier {
  late PasswordModel _password;
  bool _isLoading = false;

  PasswordProvider() {
    _password = PasswordModel(obscureText: true);
  }

  PasswordModel get password => _password;
  bool get isLoading => _isLoading;

  void toggle() {
    _password = _password.copyWith(obscureText: !_password.obscureText);
    notifyListeners();
  }

  void showLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    _isLoading = false;
    notifyListeners();
  }
}

class PasswordModel {
  final bool obscureText;

  PasswordModel({
    required this.obscureText,
  });

  PasswordModel copyWith({
    bool? obscureText,
  }) {
    return PasswordModel(
      obscureText: obscureText ?? this.obscureText,
    );
  }
}
