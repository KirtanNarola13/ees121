// import 'dart:developer';
//
// import 'package:ees121/Screens/All_Screens/category_detail_screen/Global/category_detail_screen_global.dart';
// import 'package:ees121/Screens/All_Screens/category_detail_screen/Model/category_detail_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:ees121/Screens/All_Screens/search_screen/Model/search_model.dart';
//
// import '../../../../Global/globalUser.dart';
//
// CategoryProviderListModel categoryName = CategoryProviderListModel(categoryname: categoryName.categoryname);
// enum CategoryProviderState { Loading, Loaded, Error }
//
// class CategoryProvider extends ChangeNotifier {
//   static final apiEndpoint =
//       "https://adminpanel.appsolution.online/ees121/api/categoryuser?category=computer&city=${User.data['cur_city']}";
//   static const imgPoint =
//       'https://api2.appsolution.online/files/';
//
//   CategoryProviderState _state = CategoryProviderState.Loading;
//   String _error = '';
//   CategoryProviderListModel _categoryProviderList = CategoryProviderListModel(categoryname: _categoryProviderList.categoryname, rawData: categoryProviderList);
//
//   CategoryProviderState get state => _state;
//   String get error => _error;
//   CategoryProviderSelected get categoryProviderList => _categoryProviderList;
//
//   Future<void> getCategoryFromApi() async {
//     try {
//       log('Fetching category data...');
//       final http.Response response = await http.get(Uri.parse(apiEndpoint));
//       log('API Response: ${response.body}');
//
//       if (response.statusCode == 200) {
//         _categoryProviderList = categoryProviderListFromJson(response.body);
//         _state = CategoryProviderState.Loaded;
//         log('Category data loaded successfully.');
//       } else {
//         _error = response.statusCode.toString();
//         _state = CategoryProviderState.Error;
//         log('Error loading category data: $_error');
//       }
//     } catch (e) {
//       _error = e.toString();
//       _state = CategoryProviderState.Error;
//       log('Exception while loading category data: $_error');
//     }
//
//     notifyListeners();
//   }
// }
