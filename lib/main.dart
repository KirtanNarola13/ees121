import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/All_Screens/nav_bar/nav_bar.dart';
import 'Screens/All_Screens/nonotification_screen/Views/notification_screen.dart';
import 'Screens/All_Screens/profile_screen/Views/Profile_Vewis/Address/address.dart';
import 'Screens/All_Screens/profile_screen/Views/Profile_Vewis/Document/Views/document.dart';
import 'Screens/All_Screens/profile_screen/Views/Profile_Vewis/Identity/View/identity_screen.dart';
import 'Screens/All_Screens/profile_screen/Views/Profile_Vewis/Service/View/service.dart';
import 'Screens/All_Screens/profile_screen/Views/Profile_Vewis/change_password/Views/change_password.dart';
import 'Screens/All_Screens/profile_screen/Views/profile_screen.dart';
import 'Screens/All_Screens/referral_screen/Views/referral_screen.dart';
import 'Screens/All_Screens/search_screen/Category_two/categoryTwoProvider.dart';
import 'Screens/All_Screens/search_screen/Category_two/category_two.dart';
import 'Screens/All_Screens/search_screen/provider/search_provider.dart';
import 'Screens/Splash_screen/Views/splash_screen.dart';
import 'Screens/drawer_options/customer_care/Views/customer_care.dart';
import 'Screens/drawer_options/team_screen/Views/team_screen.dart';
import 'Screens/drawer_options/wallet_screen/Views/wallet_screen.dart';
import 'Screens/drawer_options/work_screen/Provider/work_provider.dart';
import 'Screens/login_procces/Views/get_started.dart';
import 'Screens/login_procces/Views/login_screen.dart';
import 'Screens/login_procces/Views/signup_screen.dart';
import 'Screens/login_procces/provider/passwordProvider.dart';
import 'Utils/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  log("FCMToken $fcmToken");

  SharedPreferences preferences = await SharedPreferences.getInstance();
  //
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<WorkProvider>(create: (context) => WorkProvider()),
        ListenableProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ListenableProvider<PasswordProvider>(
            create: (context) => PasswordProvider()),
        ListenableProvider<CategoryTwoProvider>(
            create: (context) => CategoryTwoProvider()),
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
          // 'category_detail_screen': (context) => const CategoryDetailScreen(),
          'category_two': (context) => const Categorytwo(),
          'wallet_screen': (context) => const WalletScreen(),
          'team_screen': (context) => const TeamScreen(),
          'referral_screen': (context) => const ReferralScreen(),
          'customer_care_screen': (context) => CustomerCare(),
          'profile_screen': (context) => const ProfileScreen(),
          'change_password': (context) => ChangePassword(),
          'address_screen': (context) => const AddressScreen(),
          'document_screen': (context) => const DocumentScreen(),
          'service_screen': (context) => const ServiceScreen(),
          'identity_screen': (context) => const IdentityScreen(),
          'notification_screen': (context) => const NotificationScreen(),
        },
      ),
    ),
  );
}
