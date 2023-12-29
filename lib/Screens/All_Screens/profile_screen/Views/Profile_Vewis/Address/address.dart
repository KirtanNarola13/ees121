import 'package:ees121/Colors/colors.dart';
import 'package:ees121/Global/globalUser.dart';
import 'package:flutter/material.dart';

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
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: h / 2.8,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(color: AppColors.appColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
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
                Divider(
                  color: AppColors.appColor.withOpacity(0.2),
                ),
                Expanded(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
