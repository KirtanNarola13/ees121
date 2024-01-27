import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Colors/colors.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/Screens/login_procces/Assets/getstarted.png'),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        'EES Services',
                        style: TextStyle(
                          color: AppColors.appColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  const Column(
                    children: [
                      Text(
                        'our services it to help you to',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'do your work as quick as possible',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () async {
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();

                preferences.setBool('isVisited', true);
                Navigator.of(context).pushReplacementNamed('login');
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5),
                width: w / 1.3,
                height: h / 100,
                decoration: BoxDecoration(
                  color: AppColors.appColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: const Text('Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    )),
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
