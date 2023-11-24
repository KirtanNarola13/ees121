import 'package:ees121/Colors/colors.dart';
import 'package:ees121/Screens/All_Screens/Global/global.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
            'lib/Screens/All_Screens/home_screen/Assets/application.png',
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
      ),
      drawer: const Drawer(
        child: Column(),
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
              const Text(
                'Popular Category',
                style: TextStyle(fontSize: 22, letterSpacing: 1),
              ),
              SizedBox(
                height: h / 50,
              ),
              // Inside the SingleChildScrollView for 'Popular Category'
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
                'Popular Services',
                style: TextStyle(fontSize: 22, letterSpacing: 1),
              ),
              SizedBox(
                height: h / 50,
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Row(
                    children: AllServices.allService.map((e) {
                      return Container(
                        height: h / 4.5,
                        width: w / 1.7,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.appColor,
                            width: 1,
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
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              const Text(
                'Cleaning Service',
                style: TextStyle(fontSize: 22, letterSpacing: 1),
              ),
              SizedBox(
                height: h / 50,
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Row(
                    children: [
                      Container(
                        height: h / 4.5,
                        width: w / 2,
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: h / 20,
              ),
              const Text(
                'Ac Service',
                style: TextStyle(fontSize: 22, letterSpacing: 1),
              ),
              SizedBox(
                height: h / 50,
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Row(
                    children: [
                      Container(
                        height: h / 4.5,
                        width: w / 2,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
