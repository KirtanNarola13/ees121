import 'package:EES121/Screens/All_Screens/search_screen/Model/category_model.dart';
import 'package:EES121/helper/db_helper.dart';
import 'package:flutter/foundation.dart';

class SearchDataBase with ChangeNotifier {
  List<CategoryModel> myCategory = [];

  Future<void> searchMyCategory({required String title}) async {
    myCategory = await DBHelper.dbHelper.searchCategory(title: title);
    notifyListeners();
  }
}
