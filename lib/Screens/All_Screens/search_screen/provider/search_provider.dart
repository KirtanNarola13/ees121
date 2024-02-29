import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/search_model.dart';

enum CategoryProviderState { Loading, Loaded, Error }

class CategoryProvider extends ChangeNotifier {
  static const apiEndpoint = 'https://panel.ees121.com/api/category';
  static const imgPoint = 'https://ees121.com/panel/files/category/';

  CategoryProviderState _state = CategoryProviderState.Loading;
  String _error = '';
  CategoryApi _categoryApi = CategoryApi(data: []);

  CategoryProviderState get state => _state;
  String get error => _error;
  CategoryApi get categoryApi => _categoryApi;

  Future<void> getCategoryFromApi() async {
    try {
      // log('Fetching category data...');
      final http.Response response = await http.get(Uri.parse(apiEndpoint));

      if (response.statusCode == 200) {
        _categoryApi = categoryApiFromJson(response.body);
        _state = CategoryProviderState.Loaded;
        // log('Category data loaded successfully.');
      } else {
        _error = response.statusCode.toString();
        _state = CategoryProviderState.Error;
        log('Error loading category data: $_error');
      }
    } catch (e) {
      _error = e.toString();
      _state = CategoryProviderState.Error;
      log('Exception while loading category data: $_error');
    }

    notifyListeners();
  }
}
