import 'dart:convert';
import 'dart:developer';

import 'package:EES121/Screens/drawer_options/work_screen/model/work_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Global/work_global.dart';

enum CategoryProviderState { Loading, Loaded, Error }

class WorkProvider extends ChangeNotifier {
  WorkGlobal? work = WorkGlobal(isSent: true);

  void changeRequest() async {
    work?.isSent = !work!.isSent; // Toggle the value
    notifyListeners();
  }

  static const apiEndpoint = 'https://panel.ees121.com/api/workreq';
  static const imgPoint = 'https://ees121.com/panel/files/category/';

  CategoryProviderState _state = CategoryProviderState.Loading;
  String _error = '';
  late WorkApi _workApi = WorkApi(workReceived: [], workSent: []);

  CategoryProviderState get state => _state;
  String get error => _error;
  WorkApi get workApi => _workApi;

  Future<void> getWork({required String id, required int password}) async {
    try {
      // log('Fetching category data...');
      http.Response response = await http.post(
        Uri.parse('https://panel.ees121.com/api/workreq'),
        body: {'loginid': id, 'loginpass': password},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse["status"] == "FAIL") {
          _error = jsonResponse["message"] ?? "Unknown error";
          _state = CategoryProviderState.Error;
          log('Error loading category data: $_error');
          // log('Response Body: ${response.body}');
          log('Status Code: ${response.statusCode}');
        } else {
          // Clear existing data before updating
          _workApi.workReceived.clear();
          _workApi.workSent.clear();
          // _state = CategoryProviderState.Loading;
          _workApi = WorkApi.fromJson(jsonResponse);
          _state = CategoryProviderState.Loaded;
        }
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
