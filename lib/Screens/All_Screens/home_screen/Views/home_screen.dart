import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:ees121/Colors/colors.dart';
import 'package:ees121/Screens/All_Screens/Global/global.dart';
import 'package:ees121/Screens/All_Screens/home_screen/Provider/home_provider.dart';
import '../../search_screen/provider/search_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Set up a periodic timer to fetch data every second
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      Provider.of<CategoryProvider>(context, listen: false)
          .getCategoryFromApi();
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var scaffoldKey = GlobalKey<ScaffoldState>();

    // API
    final provider = Provider.of<CategoryProvider>(context);

    // Generate unique random indices for each category
    List<int> randomIndices = List.generate(
      provider.categoryApi.data.length,
      (index) => Random().nextInt(provider.categoryApi.data.length),
    );

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
                  Icon(Iconsax.share),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Referral'),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, 'referral_screen');
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
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 8,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                ),
                items: provider.categoryApi.data.map((e) {
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
                        image: NetworkImage(CategoryProvider.imgPoint + e.img),
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
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: provider.categoryApi.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle category tap
                      // You can navigate to a new screen or perform other actions
                    },
                    child: Container(
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
                              child: Image(
                                  image: NetworkImage(
                                      CategoryProvider.imgPoint +
                                          provider.categoryApi
                                              .data[randomIndices[index]].img)),
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
                                  provider.categoryApi
                                      .data[randomIndices[index]].name,
                                  // Assuming 'name' is a key in your category data
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: h / 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
