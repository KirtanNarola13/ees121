import 'package:flutter/material.dart';

import '../../../../../../../Colors/colors.dart';
import '../../../../../../../Global/globalUser.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

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
          "Documents",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: h / 1.8,
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
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "KYC Status :",
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
                    User.data['kycstatus'],
                    style: const TextStyle(
                        fontSize: 14, letterSpacing: 2, wordSpacing: 1),
                  ),
                  SizedBox(
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
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Aadhar ID :",
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
                    User.data['adharno'],
                    style: const TextStyle(
                        fontSize: 14, letterSpacing: 2, wordSpacing: 1),
                  ),
                  SizedBox(
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
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Joining Date :",
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
                  SizedBox(
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
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Payment Status :",
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
                    User.data['paymentstatus'],
                    style: const TextStyle(
                        fontSize: 14, letterSpacing: 2, wordSpacing: 1),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
