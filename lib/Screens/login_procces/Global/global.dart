import 'package:flutter/material.dart';

class LoginSinUp {
  static TextEditingController fullNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController numberController = TextEditingController();
  static TextEditingController conformPasswordController =
      TextEditingController();
  static String fullName = '';
  static String email = '';
  static String password = '';
  static String conformPassword = '';
  static String number = '';
}

class PasswordVisible {
  bool obscureText;
  PasswordVisible({required this.obscureText});
}
