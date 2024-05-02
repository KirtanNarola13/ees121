import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../../Global/globalUser.dart';

class CancelHelper {
  CancelHelper._();
  CancelHelper cancelHelper = CancelHelper._();

  cancelRequest(
      String providerID, String cancelReason, int providerRating) async {
    String api = "https://panel.ees121.com/api/updatework";
    http.Response response = await http.post(Uri.parse(api), body: {
      'updatedby': 'user',
      'user': User.data['userid'],
      'provider': providerID,
      'user_comment': cancelReason,
      'provider_rating': providerRating.toString()
    });
    if (response.statusCode == 200) {
      final Map responseData = json.decode(response.body);

      if (responseData['status'] == 'SUCCESS') {
        Map userData = responseData['data'];
        if (userData['loginuser'] == "") {
          log(userData['loginuser']);
        } else {
          User.data = userData['loginuser'];
        }

        // User.offer = userData['offers'];
        if (userData['offers'] == "") {
          log(userData['offers']);
        } else {
          User.offer = userData['offers'];
        }

        // User.myOffers = userData['myoffers'];
        if (userData['myoffers'] == "") {
          log(userData['myoffers']);
        } else {
          User.myOffers = userData['myoffers'];
        }

        if (userData['team'] == "") {
          log(userData['team']);
        } else {
          User.team = userData['team'];
        }

        if (userData['contactsupport'] == "") {
          log(userData['contactsupport']);
        } else {
          User.contactSupport = userData['contactsupport'];
        }
        if (userData['notifications'] == "") {
          log(userData['notifications']);
        } else {
          User.notifications = userData['notifications'];
          log("${User.notifications}");
        }

        // log(User.offer.toString());
        // log(User.myOffers.toString());
        // log(User.team.toString());
        // log(User.contactSupport.toString());
        // log(User.workSent.toString());
        // log(User.workReceived.toString());
        // log(User.notifications.toString());
      } else {}
    }
  }
}
