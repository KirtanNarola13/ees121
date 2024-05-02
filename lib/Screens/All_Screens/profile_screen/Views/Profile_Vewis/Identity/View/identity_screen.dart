import 'package:flutter/material.dart';

import '../../../../../../../Colors/colors.dart';
import '../../../../../../../Global/globalUser.dart';

class IdentityScreen extends StatelessWidget {
  const IdentityScreen({super.key});

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
          "Identity",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: h / 3.5,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(color: AppColors.appColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Member ID :",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3),
                      ),
                      Divider(
                        color: AppColors.appColor.withOpacity(0.3),
                        indent: 0,
                        endIndent: 200,
                      ),
                      Text(
                        User.data['userid'],
                        style: const TextStyle(
                            fontSize: 14, letterSpacing: 2, wordSpacing: 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.appColor.withOpacity(0.5),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Join Date :",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3),
                      ),
                      Divider(
                        color: AppColors.appColor.withOpacity(0.3),
                        indent: 0,
                        endIndent: 200,
                      ),
                      Text(
                        User.data['joindate'],
                        style: const TextStyle(
                            fontSize: 14, letterSpacing: 2, wordSpacing: 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: h / 2.5,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(color: AppColors.appColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Name :",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3),
                      ),
                      Divider(
                        color: AppColors.appColor.withOpacity(0.3),
                        indent: 0,
                        endIndent: 200,
                      ),
                      Text(
                        User.data['fullname'],
                        style: const TextStyle(
                            fontSize: 14, letterSpacing: 2, wordSpacing: 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.appColor.withOpacity(0.5),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Email :",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3),
                      ),
                      Divider(
                        color: AppColors.appColor.withOpacity(0.3),
                        indent: 0,
                        endIndent: 200,
                      ),
                      Text(
                        User.data['email'],
                        style: const TextStyle(
                            fontSize: 14, letterSpacing: 2, wordSpacing: 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.appColor.withOpacity(0.5),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Mobile no :",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3),
                      ),
                      Divider(
                        color: AppColors.appColor.withOpacity(0.3),
                        indent: 0,
                        endIndent: 200,
                      ),
                      Text(
                        User.data['mobile_no'],
                        style: const TextStyle(
                            fontSize: 14, letterSpacing: 2, wordSpacing: 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
