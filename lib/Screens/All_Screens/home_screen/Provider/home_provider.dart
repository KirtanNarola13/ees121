import 'package:flutter/material.dart';

import '../../saved_screen/Global/global.dart';

class HomeProvider extends ChangeNotifier {
  addToSaved(Map<String, dynamic> service) {
    SavedService.savedService.add(service);
    notifyListeners();
  }
}
