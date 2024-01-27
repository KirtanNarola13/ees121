import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String webp = "https://api2.appsolution.online/files/selfi/";
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
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    webp + User.data['selfifile'],
                  ),
                ),
              ),
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
                    User.data['fullname'],
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        User.data['kycstatus'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: AutofillHints.password,
                        ),
                      ),
                      const Icon(
                        Icons.verified_outlined,
                        color: Colors.green,
                      )
                    ],
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'change_password');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(color: AppColors.appColor),
                        ),
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        height: h / 10,
                        width: w / 4.5,
                        child: const Column(
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'address_screen');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(color: AppColors.appColor),
                        ),
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        height: h / 10,
                        width: w / 4.5,
                        child: const Column(
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
                                  'Address',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'document_screen');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(color: AppColors.appColor),
                        ),
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        height: h / 10,
                        width: w / 4.5,
                        child: const Column(
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
                    ),
                  ],
                ),
                SizedBox(
                  height: h / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'service_screen');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(color: AppColors.appColor),
                        ),
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        height: h / 10,
                        width: w / 4.5,
                        child: const Column(
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'identity_screen');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(color: AppColors.appColor),
                        ),
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        height: h / 10,
                        width: w / 4.5,
                        child: const Column(
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'wallet_screen');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(color: AppColors.appColor),
                        ),
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        height: h / 10,
                        width: w / 4.5,
                        child: const Column(
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
                                  'Wallet',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
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
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.appColor),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
