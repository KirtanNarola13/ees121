/*
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../Global/globalUser.dart';
import '../Global/category_detail_screen_global.dart';



class GetData {
  static Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        "https://adminpanel.appsolution.online/ees121/api/categoryuser?category=$categoryName&city=${User.data['cur_city']}"));

    if (response.statusCode == 200) {
      CategoryProviderSelected.data = json.decode(response.body);
      return CategoryProviderSelected.data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
*/
