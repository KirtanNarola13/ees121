import 'package:flutter/material.dart';

import '../../../../Colors/colors.dart';
import '../Global/wallet_global.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

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
          "Wallet",
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
            height: h / 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: h / 12,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.appColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Team reference income :',
                  style: WalletGlobal.walletTextStyle,
                ),
                Text(
                  '00.0',
                  style: WalletGlobal.walletTextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: h / 12,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.appColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Work reward income :',
                  style: WalletGlobal.walletTextStyle,
                ),
                Text(
                  '00.0',
                  style: WalletGlobal.walletTextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: h / 12,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.appColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Yearly work reward income :',
                  style: WalletGlobal.walletTextStyle,
                ),
                Text(
                  '00.0',
                  style: WalletGlobal.walletTextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: h / 12,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.appColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'KYC fees :',
                  style: WalletGlobal.walletTextStyle,
                ),
                Text(
                  '00.0',
                  style: WalletGlobal.walletTextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: h / 12,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.appColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Accumulated total :',
                  style: WalletGlobal.walletTextStyle,
                ),
                Text(
                  '00.0',
                  style: WalletGlobal.walletTextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: h / 12,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.appColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Withdrawal total :',
                  style: WalletGlobal.walletTextStyle,
                ),
                Text(
                  '00.0',
                  style: WalletGlobal.walletTextStyle,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: h / 12,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.appColor, width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available balance :',
                  style: WalletGlobal.walletTextStyle,
                ),
                Text(
                  '00.0',
                  style: WalletGlobal.walletTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            height: h / 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            padding: EdgeInsets.all(10),
            height: h / 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border.all(
                color: AppColors.appColor,
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Bank details & Pan card details not updated',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
