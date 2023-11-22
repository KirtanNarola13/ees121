import 'package:flutter/material.dart';

import '../../../../Colors/colors.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  final List<String> entries = <String>['A', 'B', 'C', 'd', 'e', 'f'];
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h / 20,
            ),
            Text(
              'Saved Services',
              style: TextStyle(
                fontSize: 35,
                letterSpacing: 2,
              ),
            ),
            Expanded(
              // Wrap the ListView.builder with Expanded
              child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: h / 4,
                    margin: EdgeInsets.only(bottom: 15, right: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.appColor,
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(color: AppColors.appColor),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(),
                        ),
                      ],
                    ),
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
