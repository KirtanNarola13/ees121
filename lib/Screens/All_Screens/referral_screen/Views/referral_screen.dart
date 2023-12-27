import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Colors/colors.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {
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
          "Referral",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'lib/Screens/All_Screens/referral_screen/Assets/earn_share.png',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Share And Earn",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
