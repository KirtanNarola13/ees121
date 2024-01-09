import 'package:ees121/Global/globalUser.dart';
import 'package:ees121/Screens/drawer_options/team_screen/Global/team_global.dart';
import 'package:flutter/material.dart';

import '../../../../Colors/colors.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
            Container(
              height: h / 18,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.appColor),
                  bottom: BorderSide(color: AppColors.appColor),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Date",
                        style: TeamGlobal.semiTitleStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Name",
                        style: TeamGlobal.semiTitleStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Status",
                        style: TeamGlobal.semiTitleStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...User.team.map(
              (e) => Container(
                margin:
                    EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 15),
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                height: h / 12,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.appColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${e['joindate']}",
                          style: TeamGlobal.stateStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${e['fullname']}",
                          style: TeamGlobal.stateStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${e['kycstatus']}",
                          style: TeamGlobal.stateStyle,
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
    );
  }
}
