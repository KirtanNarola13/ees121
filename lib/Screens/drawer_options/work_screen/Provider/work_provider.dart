import 'dart:developer';

import 'package:EES121/Screens/drawer_options/work_screen/model/work_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Global/work_global.dart';

enum CategoryProviderState { Loading, Loaded, Error }

class WorkProvider extends ChangeNotifier {
  WorkGlobal? work = WorkGlobal(isSent: false);

  void changeRequest() async {
    work?.isSent = !work!.isSent; // Toggle the value
    notifyListeners();
  }

  static const apiEndpoint = 'https://panel.ees121.com/api/category';
  static const imgPoint = 'https://ees121.com/panel/files/category/';

  CategoryProviderState _state = CategoryProviderState.Loading;
  String _error = '';
  late WorkApi _workApi = WorkApi(data: []);

  CategoryProviderState get state => _state;
  String get error => _error;
  WorkApi get workApi => _workApi;

  Future<void> getCategoryFromApi() async {
    try {
      // log('Fetching category data...');
      final http.Response response = await http.get(Uri.parse(apiEndpoint));

      if (response.statusCode == 200) {
        _workApi = WorkApiFromJson(response.body);
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
