import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Function to handle navigation logic
    Future<void> navigate() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();

      bool isIntroVisited = preferences.getBool("isVisited") ?? false;
      bool isEesLogin = preferences.getBool('isLogin') ?? false;
      bool isEesSignUp = preferences.getBool('isSignUp') ?? false;

      String routeName = (isIntroVisited)
          ? (isEesLogin || isEesSignUp)
              ? 'navbar'
              : 'login'
          : 'get_started';

      Navigator.pushReplacementNamed(context, routeName);
    }

    // Delay the navigation using Future.delayed
    Future.delayed(const Duration(seconds: 3), navigate);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/Screens/Splash_screen/Assets/splash_screen.gif'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
