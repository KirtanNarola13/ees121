import 'package:flutter/material.dart';

import '../Global/work_global.dart';

class WorkProvider extends ChangeNotifier {
  WorkGlobal? work = WorkGlobal(isSent: false);

  void changeRequest() async {
    work?.isSent = !work!.isSent; // Toggle the value
    notifyListeners();
  }
}
