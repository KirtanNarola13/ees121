import 'package:ees121/Screens/drawer_options/work_screen/Global/work_global.dart';
import 'package:flutter/material.dart';

class WorkProvider extends ChangeNotifier {
  WorkGlobal? work;
  void changeRequest() async {
    work?.isSent = work!.isSent;
    notifyListeners();
  }
}
