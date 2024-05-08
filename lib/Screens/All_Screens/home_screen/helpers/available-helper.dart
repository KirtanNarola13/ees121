import 'dart:convert';
import 'dart:developer';
import 'package:EES121/Screens/login_procces/Global/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../../Global/globalUser.dart';
import '../../../login_procces/provider/passwordProvider.dart';

class AvailableHelper {
  AvailableHelper._();
  static final AvailableHelper availableHelper = AvailableHelper._();
  Future<void> updateSwitch(bool value, BuildContext context) async {
    // API endpoint
    String apiUrl = 'https://panel.ees121.com/api/updateavailable';

    try {
      // Make POST request to API
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'mobile': LoginSinUp.numberController.text,
          'status': (value == true) ? '0' : '1',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        log("$responseData");
        if (responseData['status'] == 'SUCCESS') {
          try {
            Provider.of<PasswordProvider>(context, listen: false).showLoading();

            http.Response response = await http.post(
              Uri.parse('https://panel.ees121.com/api/user'),
              body: {
                'loginid': LoginSinUp.numberController.text,
                'loginpass': LoginSinUp.passwordController.text
              },
            );

            log('Response Status Code: ${response.statusCode}');
            log('Response Body: ${response.body}');

            if (response.statusCode == 200) {
              User.data.clear();
              User.offer.clear();
              User.myOffers.clear();
              User.team.clear();
              User.UserData.clear();
              User.notifications.clear();
              User.contactSupport.clear();

              final Map responseData = json.decode(response.body);

              if (responseData['status'] == 'SUCCESS') {
                User.UserData = responseData['data'];
                if (User.UserData['loginuser'] == "") {
                  log(User.UserData['loginuser']);
                } else {
                  User.data = User.UserData['loginuser'];
                }

                // User.offer = userData['offers'];
                if (User.UserData['offers'] == "") {
                  log(User.UserData['offers']);
                } else {
                  User.offer = User.UserData['offers'];
                }

                // User.myOffers = userData['myoffers'];
                if (User.UserData['myoffers'] == "") {
                  log(User.UserData['myoffers']);
                } else {
                  User.myOffers = User.UserData['myoffers'];
                }

                if (User.UserData['team'] == null) {
                  log('Team data is null');
                  // Handle the absence of team data here, you can set it to an empty list or handle it as you need
                  User.team = []; // For example, setting it to an empty list
                } else {
                  User.team = User.UserData['team'];
                }

                log("team");
                if (User.UserData['contactsupport'] == "") {
                  log(User.UserData['contactsupport']);
                } else {
                  User.contactSupport = User.UserData['contactsupport'];
                }
                if (User.UserData['notifications'] == "") {
                  log(User.UserData['notifications']);
                } else {
                  User.notifications = User.UserData['notifications'];
                }

                // log(User.offer.toString());
                // log(User.myOffers.toString());
                // log(User.team.toString());
                // log(User.contactSupport.toString());
                // log(User.workSent.toString());
                // log(User.workReceived.toString());
                // log(User.notifications.toString());
              } else {
                log('Data Failed: ${responseData['status']}');
              }
            } else {
              log('Failed: ${response.statusCode}');
            }
          } finally {
            Provider.of<PasswordProvider>(context, listen: false).hideLoading();
          }
        }
      } else {
        log('Failed to update switch. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error updating switch: $e');
    }
  }
}
