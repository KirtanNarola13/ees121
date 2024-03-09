import 'package:flutter/material.dart';

import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    // Sort User.team based on 'Pending', 'Submitted', 'Verified'
    User.team.sort((a, b) {
      Map<String, int> orderMap = {'pending': 1, 'submitted': 2, 'VERIFIED': 3};
      return orderMap[a['kycstatus']]! - orderMap[b['kycstatus']]!;
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: AppColors.appColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "My Team",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...User.team.map(
              (e) => Card(
                child: ListTile(
                  onTap: () {
                    showDialog(
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(
                            height: h / 3, // Set your desired height

                            child: AlertDialog(
                              title: Center(
                                child: Text(
                                  "${e['fullname']}",
                                  style: const TextStyle(
                                    fontSize: 26,
                                    letterSpacing: 2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              content: Column(
                                children: [
                                  SizedBox(
                                    height: h / 25,
                                  ),
                                  Text(
                                    e['joindate'],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    e['kycstatus'],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  title: Text(
                    "${e['fullname']}",
                  ),
                  subtitle: Text("${e['kycstatus']}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
