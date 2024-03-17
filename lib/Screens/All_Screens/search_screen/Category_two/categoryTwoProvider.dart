import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../Global/globalUser.dart';
import '../Global/category_global.dart';
import 'category_two_model.dart';

enum CategoryTwoProviderState { Loading, Loaded, Error }

class CategoryTwoProvider extends ChangeNotifier {
  static const imgPoint = 'https://ees121.com/panel/files/';

  CategoryTwoProviderState _state = CategoryTwoProviderState.Loading;
  String _error = '';

  CategoryTwoApi _categoryTwoApi = CategoryTwoApi(data: []);

  CategoryTwoProviderState get state => _state;

  String get error => _error;

  CategoryTwoApi get categoryTwoApi => _categoryTwoApi;

  Future<void> getCategoryTwoFromApi() async {
    try {
      if (Name.name != null) {
        log('Fetching category data for ${Name.name}...');
        final http.Response response = await http.get(Uri.parse(
            'https://panel.ees121.com/api/categoryuser?category=${Name.name?.replaceAll(' ', '%20')}&city=${User.data['cur_city']}'));
        log('API Response Status Code: ${response.statusCode}');

        if (response.statusCode == 200) {
          log('Fetching statusCode 200...');

          // Clear old data before adding new data
          _categoryTwoApi.data.clear();
          // Parse the response body into CategoryTwoApi model
          _categoryTwoApi = categoryTwoApiFromJson(response.body);
          log(response.body.toString());
          log(response.body);

          // Check if the parsed data is not null and not empty
          if (_categoryTwoApi != null && _categoryTwoApi.data.isNotEmpty) {
            _state = CategoryTwoProviderState.Loaded;
          } else {
            log('Error: Parsed data is null or empty.');
            _state = CategoryTwoProviderState.Error;
            _error = 'Error: Parsed data is null or empty.';
          }
        } else {
          _error = response.statusCode.toString();
          _state = CategoryTwoProviderState.Error;
          log('Error loading category data: $_error');
        }
      } else {
        log('Skipping fetch as category name has not changed.');
      }
    } catch (e) {
      _error = "catch";
      _state = CategoryTwoProviderState.Error;
      log('Exception while loading category data: $_error');
    }

    notifyListeners();
  }
}
