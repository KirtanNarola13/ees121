import 'package:ees121/Screens/All_Screens/saved_screen/Global/global.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  addToSaved(Map<String, dynamic> service) {
    SavedService.savedService.add(service);
    notifyListeners();
  }
}
