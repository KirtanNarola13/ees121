import 'package:flutter/material.dart';

import '../../../../Colors/colors.dart';

class WalletGlobal {
  bool? isWallet;

  WalletGlobal({required this.isWallet});
  static TextStyle walletTextStyle = TextStyle(
    fontSize: 30,
  );
  static TextStyle balanceTextStyle = TextStyle(
    fontSize: 28,
  );
}
