import 'package:ees121/Screens/All_Screens/detail_screen/Views/detail_screen.dart';
import 'package:ees121/Screens/All_Screens/home_screen/Provider/home_provider.dart';
import 'package:ees121/Screens/All_Screens/nav_bar/nav_bar.dart';
import 'package:ees121/Screens/All_Screens/search_screen/provider/search_provider.dart';
import 'package:ees121/Screens/Splash_screen/Views/splash_screen.dart';
import 'package:ees121/Screens/drawer_options/customer_care/Views/customer_care.dart';
import 'package:ees121/Screens/drawer_options/team_screen/Views/team_screen.dart';
import 'package:ees121/Screens/drawer_options/work_screen/Provider/work_provider.dart';
import 'package:ees121/Screens/drawer_options/work_screen/Views/work_screen.dart';
import 'package:ees121/Screens/login_procces/Views/get_started.dart';
import 'package:ees121/Screens/login_procces/Views/login_screen.dart';
import 'package:ees121/Screens/login_procces/Views/signup_screen.dart';
import 'package:ees121/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/All_Screens/profile_screen/Views/profile_screen.dart';
import 'Screens/drawer_options/wallet_screen/Views/wallet_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  //
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<HomeProvider>(create: (context) => HomeProvider()),
        ListenableProvider<WorkProvider>(create: (context) => WorkProvider()),
        ListenableProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
      ],
      child: MaterialApp(
        title: "EES121",
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          'get_started': (context) => const GetStarted(),
          'login': (context) => const LoginPage(),
          'signup': (context) => const SignUp(),
          'navbar': (context) => const NavBar(),
          'detail_screen': (context) => const DetailScreen(),
          'wallet_screen': (context) => const WalletScreen(),
          'team_screen': (context) => const TeamScreen(),
          'work_screen': (context) => const WorkScreen(),
          'customer_care_screen': (context) => CustomerCare(),
          'profile_screen': (context) => const ProfileScreen(),
        },
      ),
    ),
  );
}
