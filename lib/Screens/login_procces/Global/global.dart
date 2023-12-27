import 'package:flutter/material.dart';

class LoginSinUp {
  static TextEditingController fullNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController numberController = TextEditingController();
  static TextEditingController conformPasswordController =
      TextEditingController();
}

class PasswordVisible {
  bool obscureText;
  PasswordVisible({required this.obscureText});
}
