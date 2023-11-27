import 'package:ees121/Screens/All_Screens/Global/global.dart';
import 'package:flutter/material.dart';

import '../../../../Colors/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Ensure widgets are aligned to the start
          children: [
            SizedBox(
              height: h / 20,
            ),
            Text(
              'What service are you looking for?',
              style: TextStyle(
                fontSize: 35,
                letterSpacing: 2,
              ),
            ),
            Expanded(
              // Use Expanded to fill the available space
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: AllServices
                    .allService.length, // Use the length of your list
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: w / 3,
                    height: h / 8,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.appColor,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    // Access data from the list
                    child: Image.asset(AllServices.allService[index]['icon']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
