import 'package:EES121/Screens/drawer_options/wallet_screen/provider/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Provider.of<WalletProvider>(context, listen: false)
                        .changeRequest();
                  },
                  child: Consumer<WalletProvider>(
                    builder: (context, walletProvider, child) {
                      return Container(
                        alignment: Alignment.center,
                        height: h / 13,
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: walletProvider.walletGlobal.isWallet == false
                              ? AppColors.appColor.withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: walletProvider.walletGlobal.isWallet == false
                                ? Colors.white
                                : AppColors.appColor.withOpacity(0.5),
                          ),
                        ),
                        child: const Text('Wallet balance'),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Provider.of<WalletProvider>(context, listen: false)
                        .changeRequest();
                  },
                  child: Consumer<WalletProvider>(
                    builder: (context, walletProvider, child) {
                      return Container(
                        alignment: Alignment.center,
                        height: h / 13,
                        margin:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: walletProvider.walletGlobal.isWallet == true
                              ? AppColors.appColor.withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: walletProvider.walletGlobal.isWallet == true
                                ? Colors.white
                                : AppColors.appColor.withOpacity(0.5),
                          ),
                        ),
                        child: const Text('Payment History'),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 7,
          ),
          Expanded(
            flex: 2,
            child: (Provider.of<WalletProvider>(context)
                        .walletGlobal
                        .isWallet !=
                    true)
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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
