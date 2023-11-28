import 'package:ees121/Screens/All_Screens/home_screen/Provider/home_provider.dart';
import 'package:ees121/Screens/All_Screens/nav_bar/nav_bar.dart';
import 'package:ees121/Screens/login_procces/Views/get_started.dart';
import 'package:ees121/Screens/login_procces/Views/login_screen.dart';
import 'package:ees121/Screens/login_procces/Views/signup_screen.dart';
import 'package:ees121/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<HomeProvider>(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routes: {
          'getStarted': (context) => const GetStarted(),
          'login': (context) => const LoginPage(),
          'signup': (context) => const SignUp(),
          '/': (context) => const NavBar(),
        },
      ),
    ),
  );
}
