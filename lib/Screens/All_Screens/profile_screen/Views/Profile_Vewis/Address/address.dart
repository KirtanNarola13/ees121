import 'package:EES121/Screens/All_Screens/profile_screen/Views/Profile_Vewis/Address/components/change_address_global.dart';
import 'package:flutter/material.dart';
import 'package:top_bottom_sheet_flutter/top_bottom_sheet_flutter.dart';

import '../../../../../../Colors/colors.dart';
import '../../../../../../Global/globalUser.dart';

class AddressScreen extends StatelessWidget {
  final _addressKey = GlobalKey<FormState>();
  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: h / 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(20),
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
                            fontSize: 18,
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
                            fontSize: 14, letterSpacing: 2, wordSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: AppColors.appColor.withOpacity(0.2),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(20),
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
                      Row(
                        children: [
                          const Text(
                            "Current Address :",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 3),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'change_address');
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.appColor.withOpacity(0.5),
                        indent: 0,
                        endIndent: 200,
                      ),
                      Text(
                        "${User.data['cur_address']}, ${User.data['cur_pincode']}, ${User.data['cur_city']}, ${User.data['cur_state']}",
                        style: const TextStyle(
                            fontSize: 16, letterSpacing: 2, wordSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
