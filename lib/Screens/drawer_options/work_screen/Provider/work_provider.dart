import 'dart:convert';
import 'dart:developer';

import 'package:EES121/Screens/drawer_options/work_screen/model/workModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../Global/globalUser.dart';
import '../../../All_Screens/search_screen/Model/search_model.dart';
import '../Global/work_global.dart';

class WorkProvider extends ChangeNotifier {
  WorkGlobal? work = WorkGlobal(isSent: false);

  static const apiEndpoint =
      'https://adminpanel.appsolution.online/ees121/api/workreq';

  fetchData(String id, String password) async {
    http.Response response = await http.post(
      Uri.parse(apiEndpoint),
      body: {
        'loginid': id,
        'loginpass': password,
      },
    );
    if (response.statusCode == 200) {
      final Map responseData = json.decode(response.body);
      Map userData = responseData['data'];
      //
      if (userData['worksent'] == "") {
        log(userData['worksent']);
      } else {
        User.workSent = userData['worksent'];
        log("work sented${User.workSent}");
      }
      //
      if (userData['workreceived'] == "") {
        log(userData['workreceived']);
      } else {
        User.workReceived = userData['workreceived'];

        log("work received ${User.workReceived}");
      }
      //
    } else {
      return null;
    }
  }

  void changeRequest() async {
    work?.isSent = !work!.isSent; // Toggle the value
    notifyListeners();
  }
}

enum CategoryProviderState { Loading, Loaded, Error }
