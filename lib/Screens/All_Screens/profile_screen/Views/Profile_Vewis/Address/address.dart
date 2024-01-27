import 'package:flutter/material.dart';

import '../../../../../../Colors/colors.dart';
import '../../../../../../Global/globalUser.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
          "Address",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              height: h / 4,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: AppColors.appColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 40,
                  ),
                  const Text(
                    "Permanent Address :",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 3),
                  ),
                  Divider(
                    color: AppColors.appColor.withOpacity(0.5),
                    indent: 0,
                    endIndent: 200,
                  ),
                  Text(
                    User.data['address'],
                    style: const TextStyle(
                        fontSize: 16, letterSpacing: 2, wordSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: AppColors.appColor.withOpacity(0.2),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              height: h / 4,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: AppColors.appColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h / 40,
                  ),
                  const Text(
                    "Current Address :",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 3),
                  ),
                  Divider(
                    color: AppColors.appColor.withOpacity(0.5),
                    indent: 0,
                    endIndent: 200,
                  ),
                  Text(
                    "${User.data['cur_address']}, ${User.data['cur_pincode']}, ${User.data['cur_state']}",
                    style: const TextStyle(
                        fontSize: 16, letterSpacing: 2, wordSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
