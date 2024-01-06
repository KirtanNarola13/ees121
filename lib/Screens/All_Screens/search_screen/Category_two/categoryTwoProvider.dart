import 'dart:developer';

import 'package:ees121/Screens/All_Screens/search_screen/Category_two/category_two_model.dart';
import 'package:ees121/Screens/All_Screens/search_screen/Global/category_global.dart';
import 'package:ees121/Screens/All_Screens/search_screen/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ees121/Screens/All_Screens/search_screen/Model/search_model.dart';
import 'package:provider/provider.dart';

import '../../../../Global/globalUser.dart';

enum CategoryTwoProviderState { Loading, Loaded, Error }

class CategoryTwoProvider extends ChangeNotifier {
  static final apiEndpoint =
      'https://adminpanel.appsolution.online/ees121/api/categoryuser?category=${Name.name}&city=${User.data['cur_city']}';
  static const imgPoint = 'https://api2.appsolution.online/files/';
  // static const apiEndpoint =
  //     'https://adminpanel.appsolution.online/ees121/api/categorylist';
  // static const imgPoint =
  //     'https://adminpanel.appsolution.online/ees121/files/categoryimages/';

  CategoryTwoProviderState _state = CategoryTwoProviderState.Loading;
  String _error = '';
  CategoryTwoApi _categoryTwoApi = CategoryTwoApi(data: []);

  CategoryTwoProviderState get state => _state;
  String get error => _error;
  CategoryTwoApi get categoryTwoApi => _categoryTwoApi;

  Future<void> getCategoryTwoFromApi() async {
    try {
      log('Fetching category data...');
      final http.Response response = await http.get(Uri.parse(apiEndpoint));
      //   log('API Response: ${response.body}');

      if (response.statusCode == 200) {
        log('Fetching statusCode 200...');
        log(categoryTwoApi.data.toString());
        // log(response.body);
        _categoryTwoApi = categoryTwoApiFromJson(response.body);
        log('Fetching statusCode 200 -001...');
        _state = CategoryTwoProviderState.Loaded;
        // log(categoryTwoApi.data.toString());
        log('Category data loaded successfully.');
      } else {
        log('Fetching statusCode else...');
        _error = response.statusCode.toString();
        _state = CategoryTwoProviderState.Error;
        log('else Error loading category data: $_error');
      }
    } catch (e) {
      _error = "catch";
      _state = CategoryTwoProviderState.Error;
      log('Exception while loading category data: $_error');
    }

    notifyListeners();
  }
}
