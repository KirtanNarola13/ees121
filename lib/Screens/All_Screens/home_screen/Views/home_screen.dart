import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var scaffoldKey = GlobalKey<ScaffoldState>();

    // API
    // WBP
    String webp = "https://ees121.com/panel/files/";

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
                onPressed: () {
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
                  Container(
                    height: h / 8.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          webp + User.data['selfifile'],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    User.data['fullname'],
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    User.data['userid'],
                    style: const TextStyle(
                      fontSize: 10,
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
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: h / 3,
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border(
                            right: BorderSide(color: AppColors.appColor)),
                      ),
                      child: Image(
                        image: NetworkImage(
                          webp + User.data['selfifile'],
                        ),
                        height: h / 2,
                      ),
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
                            style: const TextStyle(fontSize: 18),
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
                                itemSize: 16,
                                ignoreGestures: true,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.5),
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
                                initialRating:
                                    double.parse(User.data['user_avg_rating']),
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 10,
                                itemSize: 16,
                                ignoreGestures: true,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.5),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                          Divider(
                            color: AppColors.appColor.withOpacity(0.5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 0.6,
                                child: Switch(
                                  value: (User.data['isavailable'] == 1)
                                      ? true
                                      : false,
                                  onChanged: (val) {},
                                ),
                              ),
                              Text(
                                (User.data['isavailable'] == 1)
                                    ? 'Available'
                                    : 'Not Available',
                                style: const TextStyle(fontSize: 16),
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
            SizedBox(
              height: h / 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Popular Offers',
                style: TextStyle(fontSize: 22, letterSpacing: 1),
              ),
            ),
            SizedBox(
              height: h / 40,
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 8,
                height: h / 3,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
              ),
              items: User.offer.map((e) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Image.network(
                            webp + e['offer_file'],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
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
                    ),
                    child: Image(
                      image: NetworkImage(
                        webp + e['offer_file'],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: h / 20,
            ),
            // const Padding(
            //   padding: EdgeInsets.only(left: 10),
            //   child: Text(
            //     'Popular Category',
            //     style: TextStyle(fontSize: 22, letterSpacing: 1),
            //   ),
            // ),
            // SizedBox(
            //   height: h / 50,
            // ),
            // GridView.builder(
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //       maxCrossAxisExtent: 3),
            //   itemBuilder: (context, index) {
            //     return GestureDetector(
            //       onTap: () {
            //         Navigator.pushNamed(context, 'category_detail_screen',
            //             arguments: index);
            //       },
            //       child: Container(
            //         margin: const EdgeInsets.all(8.0),
            //         padding: const EdgeInsets.only(
            //           top: 5,
            //           right: 5,
            //           left: 5,
            //         ),
            //         decoration: BoxDecoration(
            //           border: Border.all(
            //             color:
            //                 AppColors.appColor, // Change this color if needed
            //             width: 1,
            //           ),
            //           borderRadius: const BorderRadius.all(
            //             Radius.circular(15),
            //           ),
            //         ),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Image.network(
            //               CategoryProvider.imgPoint +
            //                   Provider.of<CategoryProvider>(context)
            //                       .categoryApi
            //                       .data[index]
            //                       .img,
            //             ),
            //             const SizedBox(height: 8),
            //             Text(
            //               Provider.of<CategoryProvider>(context)
            //                   .categoryApi
            //                   .data[index]
            //                   .name,
            //               textAlign: TextAlign.center,
            //               style: const TextStyle(fontSize: 10),
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
