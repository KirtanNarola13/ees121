import 'dart:developer';
import 'package:EES121/Screens/All_Screens/home_screen/helpers/available-helper.dart';
import 'package:EES121/Screens/All_Screens/home_screen/helpers/myoffer_helper.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyOfferHelper.myOfferHelper.getOffer(User.data['userid']);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    // API
    // WBP
    String webp = "https://ees121.com/panel/files/";
    bool availabilityStatus = (User.data['isavailable'] == 0) ? true : false;
    // Generate unique random indices for each category
    // List<int> randomIndices = List.generate(
    //   provider.categoryApi.data.length,
    //   (index) => Random().nextInt(provider.categoryApi.data.length),
    // );

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
              alignment: const Alignment(0.4, -0.6),
              children: [
                IconButton(
                  onPressed: () async {
                    AssetsAudioPlayer.newPlayer().open(
                      Audio("assets/sound/bell.mp3"),
                      autoStart: true,
                      showNotification: true,
                    );
                    Navigator.pushNamed(context, 'notification_screen');
                  },
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
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        webp + User.data['selfifile'],
                      ),
                      radius: 40,
                    ),
                    Text(
                      User.data['fullname'],
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      User.data['userid'],
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Profile'),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'profile_screen');
                },
              ),
              ListTile(
                title: const Row(
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
                title: const Row(
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
                title: const Row(
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
                  title: const Row(
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: h / 4.5,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(color: AppColors.appColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      webp + User.data['selfifile'],
                                    ),
                                    radius: 50,
                                  )),
                              Expanded(
                                child: Transform.scale(
                                  scale: 0.6,
                                  child: Switch(
                                    value: User.data['isavailable'] == '1',
                                    onChanged: (bool value) async {
                                      try {
                                        // Update availability status locally before API call
                                        User.data['isavailable'] =
                                            value ? '1' : '0';

                                        // Assume mobileNumber and switchValue are obtained from your UI
                                        await AvailableHelper.availableHelper
                                            .updateSwitch(value);
                                        log("User.data['isavailable']: ${User.data['isavailable']} $value");
                                      } catch (e) {
                                        log('Error updating switch: $e');
                                        // Rollback local change if API call fails
                                        User.data['isavailable'] =
                                            value ? '0' : '1';
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  User.data['fullname'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(
                                  color: AppColors.appColor.withOpacity(0.5),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Provider Rating',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    RatingBar.builder(
                                      initialRating: double.parse(
                                          User.data['provider_avg_rating']),
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 10,
                                      itemSize: 13,
                                      ignoreGestures: true,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.5),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: AppColors.appColor.withOpacity(0.5),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'User Rating',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    RatingBar.builder(
                                      initialRating: double.parse(
                                          User.data['user_avg_rating']),
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 10,
                                      itemSize: 13,
                                      ignoreGestures: true,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.5),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        "My Offer",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Container(
                            height: h / 6,
                            width: w / 6,
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.appColor,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              color: AppColors.appColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Popular Offers',
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'allOffer');
                        },
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                            AppColors.appColor.withOpacity(0.1),
                          ),
                        ),
                        child: Text(
                          'view all',
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.appColor,
                              decorationThickness: 1.5,
                              decorationColor: AppColors.appColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 6,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.0,
                    height: h / 4,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                  ),
                  items: User.offer.map((e) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'offer',
                            arguments: e['provider']);
                      },
                      child: Container(
                        height: h / 5,
                        width: w / 1.6,
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
                            image: NetworkImage(
                              webp + e['offer_file'],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(),
            ],
          ),
        ));
  }
}
