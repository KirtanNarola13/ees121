import 'package:ees121/Screens/All_Screens/home_screen/Views/home_screen.dart';
import 'package:ees121/Screens/All_Screens/profile_screen/Views/profile_screen.dart';
import 'package:ees121/Screens/All_Screens/referral_screen/Views/referral_screen.dart';
import 'package:ees121/Screens/All_Screens/saved_screen/Views/saved_screen.dart';
import 'package:ees121/Screens/All_Screens/search_screen/Views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  final controller = NavigationController();
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: h / 13,
        elevation: 0,
        selectedIndex: controller.selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            controller.selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Iconsax.search_normal_1), label: 'Category'),
          NavigationDestination(icon: Icon(Iconsax.share), label: 'Referral'),
          NavigationDestination(icon: Icon(Iconsax.book_saved), label: 'Saved'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
      ),
      body: controller.screens[controller.selectedIndex],
    );
  }
}

class NavigationController {
  int selectedIndex = 0;

  final screens = [
    HomeScreen(),
    SearchScreen(),
    ReferralScreen(),
    SavedScreen(),
    ProfileScreen(),
  ];
}
