import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';

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
    String referralLink = "https://ees121.com/join/";
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
          Text(
            "Share And Earn",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              referralLink + User.data['userid'],
              style: TextStyle(
                fontSize: 18,
                color: AppColors.appColor,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.appColor,
              ),
            ),
          ),
          SizedBox(
            height: h / 50,
          ),
          GestureDetector(
            onTap: () {
              Share.share(referralLink + User.data['userid']);
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5),
              width: w / 3,
              height: h / 16,
              decoration: BoxDecoration(
                color: AppColors.appColor, // Change to your desired color
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                'Share',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
