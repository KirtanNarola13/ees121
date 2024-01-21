import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ContactHelper {
  ContactHelper._();

  static final ContactHelper contactHelper = ContactHelper._();
  static int? statusCode;

  //
  contactProvider(String user, String provider) async {
    String apiPoint =
        "https://adminpanel.appsolution.online/ees121/api/callreq?user=$user&provider=$provider";
    //
    http.Response response = await http.post(
      Uri.parse(apiPoint),
      body: {'user': user, 'provider': provider},
    );
    //
    log("${response.statusCode}");
    if (response.statusCode == 200) {
      log("${jsonDecode(response.body)}");
      statusCode = response.statusCode;
    } else {
      return null;
    }
  }
}
