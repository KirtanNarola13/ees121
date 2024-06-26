import 'dart:developer';
import 'package:EES121/Screens/All_Screens/home_screen/components/all-offer-screen.dart';
import 'package:EES121/Screens/All_Screens/home_screen/components/offer-screen.dart';
import 'package:EES121/Screens/All_Screens/profile_screen/Views/Profile_Vewis/Address/components/change_address.dart';
import 'package:EES121/Screens/All_Screens/search_screen/Category_two/components/provider-detail.dart';
import 'package:EES121/Screens/All_Screens/search_screen/provider/search_from_db.dart';
import 'package:EES121/Screens/drawer_options/wallet_screen/provider/wallet_provider.dart';
import 'package:EES121/Screens/drawer_options/work_screen/Views/work_screen.dart';
import 'package:EES121/Screens/drawer_options/work_screen/components/work_detail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // Import permission_handler
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
import 'helper/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Request notification permissions when the app is first run
  await _requestPermissions();

  final fcmToken = await FirebaseMessaging.instance.getToken();
  log("FCMToken $fcmToken");

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await DBHelper.dbHelper.insertCategory(); // Populate the database with data
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
        ListenableProvider<WalletProvider>(
            create: (context) => WalletProvider()),
        ListenableProvider<SearchDataBase>(
            create: (context) => SearchDataBase()),
      ],
      child: MaterialApp(
        title: "EES121",
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          'get_started': (context) => const GetStarted(),
          'login': (context) => const LoginPage(),
          'signup': (context) => const SignUp(),
          'navbar': (context) => const NavBar(),
          'work': (context) => const WorkScreen(),
          // 'category_detail_screen': (context) => const CategoryDetailScreen(),
          'category_two': (context) => const Categorytwo(),
          'wallet_screen': (context) => const WalletScreen(),
          'team_screen': (context) => const TeamScreen(),
          'referral_screen': (context) => const ReferralScreen(),
          'customer_care_screen': (context) => CustomerCare(),
          'profile_screen': (context) => const ProfileScreen(),
          'change_password': (context) => ChangePassword(),
          'address_screen': (context) => AddressScreen(),
          'change_address': (context) => ChangeAddress(),
          'document_screen': (context) => const DocumentScreen(),
          'service_screen': (context) => const ServiceScreen(),
          'identity_screen': (context) => const IdentityScreen(),
          'notification_screen': (context) => const NotificationScreen(),
          'offer': (context) => const OfferScreen(),
          'allOffer': (context) => const AllOffer(),
          'provider_detail': (context) => const ProviderDetail(),
          'work_detail': (context) => const WorkDetail(),
        },
      ),
    ),
  );
}

Future<void> _requestPermissions() async {
  // Request notification permission
  PermissionStatus permission = await Permission.notification.request();
  if (permission != PermissionStatus.granted) {
    // Handle permission denied
    // You may want to show a dialog or message to the user
    // explaining that the app needs notification permissions
  }
}
