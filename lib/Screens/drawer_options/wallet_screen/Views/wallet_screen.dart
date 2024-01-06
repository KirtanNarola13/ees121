import 'package:flutter/material.dart';

import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: h / 7,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.appColor, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Balance :',
                    style: WalletGlobal.walletTextStyle,
                  ),
                  SizedBox(
                    height: h / 35,
                  ),
                  Text(
                    User.data['walletbalance'],
                    style: WalletGlobal.balanceTextStyle,
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
        ],
      ),
    );
  }
}
