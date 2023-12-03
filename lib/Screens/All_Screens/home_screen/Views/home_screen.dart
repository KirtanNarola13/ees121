import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ees121/Colors/colors.dart';
import 'package:ees121/Screens/All_Screens/Global/global.dart';
import 'package:ees121/Screens/All_Screens/home_screen/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: Image.asset(
            'lib/Screens/All_Screens/home_screen/Assets/paragraph.png',
            height: h / 13,
            width: w / 13,
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment(0.4, -0.6),
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'lib/Screens/All_Screens/home_screen/Assets/notification.png',
                  height: h / 13,
                  width: w / 13,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: h / 40,
                width: w / 40,
                decoration: BoxDecoration(
                  color: AppColors.appColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(
            width: w / 20,
          ),
        ],
        toolbarHeight: h / 15,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: CircleAvatar(),
              decoration: BoxDecoration(),
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.group),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Team'),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, 'team_screen');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.work),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Work'),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, 'work_screen');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.call),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Customer Care'),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, 'customer_care_screen');
              },
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.wallet),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Wallet'),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, 'wallet_screen');
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                title: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Logout'),
                  ],
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: h / 50,
              ),
              SizedBox(
                height: h / 50,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true, // Enable auto-sliding
                  aspectRatio: 16 / 8, // Adjust as needed
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                ),
                items: AllServices.allService.map((e) {
                  return Container(
                    height: h / 4.2,
                    width: w / 1,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.appColor,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: AssetImage(e['thumbnail']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: h / 20,
              ),
              const Text(
                'Popular Category',
                style: TextStyle(fontSize: 22, letterSpacing: 1),
              ),
              SizedBox(
                height: h / 50,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Row(
                  children: AllServices.allService.map((e) {
                    return Container(
                      alignment: Alignment.center,
                      height: h / 7,
                      width: w / 4,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.appColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                e['icon'], // Use the 'icon' key from the map
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Text(
                                  "${e['service']}",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              const Text(
                'Top Rated Service',
                style: TextStyle(fontSize: 22, letterSpacing: 1),
              ),
              SizedBox(
                height: h / 20,
              ),
              SingleChildScrollView(
                child: Column(
                  children: AllServices.allService.map((e) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'detail_screen',
                              arguments: e,
                            );
                          },
                          child: Container(
                            height: h / 3,
                            width: w / 1,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.appColor,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              image: DecorationImage(
                                image: AssetImage(e['thumbnail']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    e['isSaved'] = !e['isSaved'];
                                    log(e['isSaved'].toString());
                                    Provider.of<HomeProvider>(context,
                                            listen: true)
                                        .addToSaved(e);
                                  },
                                  splashColor: Colors.black,
                                  color: AppColors.appColor,
                                  icon: Icon(
                                    (e['isSaved'] == true)
                                        ? Icons.bookmark_outlined
                                        : Icons.bookmark_border,
                                    color: AppColors.appColor,
                                    size: 32,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "John Deo",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "4.3 ⭐",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 15,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: h / 50,
              ),
              SizedBox(
                height: h / 50,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true, // Enable auto-sliding
                  aspectRatio: 16 / 8, // Adjust as needed
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                ),
                items: AllServices.allService.map((e) {
                  return Container(
                    height: h / 4.2,
                    width: w / 1,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.appColor,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      image: DecorationImage(
                        image: AssetImage(e['thumbnail']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: h / 20,
              ),
              const Text(
                'Popular Category',
                style: TextStyle(fontSize: 22, letterSpacing: 1),
              ),
              SizedBox(
                height: h / 50,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Row(
                  children: AllServices.allService.map((e) {
                    return Container(
                      alignment: Alignment.center,
                      height: h / 7,
                      width: w / 4,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.appColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                e['icon'], // Use the 'icon' key from the map
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                alignment: Alignment.center,
                                child: Text(
                                  "${e['service']}",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              const Text(
                'Top Rated Service',
                style: TextStyle(fontSize: 22, letterSpacing: 1),
              ),
              SizedBox(
                height: h / 20,
              ),
              SingleChildScrollView(
                child: Column(
                  children: AllServices.allService.map((e) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'detail_screen',
                              arguments: e,
                            );
                          },
                          child: Container(
                            height: h / 3,
                            width: w / 1,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.appColor,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              image: DecorationImage(
                                image: AssetImage(e['thumbnail']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    e['isSaved'] = !e['isSaved'];
                                    log(e['isSaved'].toString());
                                    Provider.of<HomeProvider>(context,
                                            listen: true)
                                        .addToSaved(e);
                                  },
                                  splashColor: Colors.black,
                                  color: AppColors.appColor,
                                  icon: Icon(
                                    (e['isSaved'] == true)
                                        ? Icons.bookmark_outlined
                                        : Icons.bookmark_border,
                                    color: AppColors.appColor,
                                    size: 32,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "John Deo",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "4.3 ⭐",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h / 15,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
