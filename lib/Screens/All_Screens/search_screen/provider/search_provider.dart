import 'package:ees121/Screens/All_Screens/search_screen/Model/search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CategoryProvider extends ChangeNotifier {
  static const apiEndpoint =
      'https://adminpanel.appsolution.online/ees121/api/category';
  bool isLoading = true;
  String error = '';
  CategoryApi catrgoryApi = CategoryApi(data: []);
  //
  getCategoryFromApi() async {
    try {
      Response response = await http.get(Uri.parse(apiEndpoint));
      if (response.statusCode == 200) {
        catrgoryApi = categoryApiFromJson(response.body);
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
//
}
