import 'package:flutter/material.dart';

import '../Global/wallet_global.dart';

class WalletProvider extends ChangeNotifier {
  WalletGlobal walletGlobal = WalletGlobal(isWallet: true);

  void changeRequest() async {
    walletGlobal.isWallet = walletGlobal.isWallet; // Toggle the value
    notifyListeners();
  }
}
