import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Colors/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: h / 30,
          ),
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment(1, 0.9),
              children: [
                CircleAvatar(
                  radius: 150,
                  backgroundColor: AppColors.appColor.withOpacity(0.8),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                SizedBox(
                  height: h / 50,
                ),
                Divider(
                  color: AppColors.appColor.withOpacity(0.5),
                ),
                SizedBox(
                  height: h / 80,
                ),
                Center(
                  child: Text(
                    'John Deo',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Center(
                  child: Text(
                    '+91 88995 56565',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: AutofillHints.password,
                    ),
                  ),
                ),
                SizedBox(
                  height: h / 80,
                ),
                Divider(
                  color: AppColors.appColor.withOpacity(0.5),
                ),
                SizedBox(
                  height: h / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: AppColors.appColor),
                      ),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: h / 10,
                      width: w / 4.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.password,
                              size: 25,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Change\nPassword',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: AppColors.appColor),
                      ),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: h / 10,
                      width: w / 4.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.perm_identity,
                              size: 25,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'kyc',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: AppColors.appColor),
                      ),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: h / 10,
                      width: w / 4.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Icon(
                              Iconsax.document,
                              size: 25,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Document',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: AppColors.appColor),
                      ),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: h / 10,
                      width: w / 4.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.work_outline,
                              size: 25,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Service',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: AppColors.appColor),
                      ),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: h / 10,
                      width: w / 4.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Icon(
                              Iconsax.card,
                              size: 25,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Identity',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: AppColors.appColor),
                      ),
                      padding: EdgeInsets.only(left: 5, right: 5),
                      height: h / 10,
                      width: w / 4.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Icon(
                              Iconsax.money_2,
                              size: 25,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Renew\nservices',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptionContainer({
    required IconData icon,
    required String label,
    required double height,
    required double width,
  }) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.appColor),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
