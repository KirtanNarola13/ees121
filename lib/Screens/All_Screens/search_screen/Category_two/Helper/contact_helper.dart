import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ContactHelper {
  ContactHelper._();

  static final ContactHelper contactHelper = ContactHelper._();
  static int? statusCode;

  //
  Future<void> contactProvider(String user, String provider) async {
    String apiPoint =
        "https://panel.ees121.com/api/callreq?user=$user&provider=$provider";
    //
    http.Response response = await http.post(
      Uri.parse(apiPoint),
      body: {'user': user, 'provider': provider},
    );
    //
    if (response.statusCode == 200) {
      log("Contact Detail${response.body}");
      log("Contacted");
    } else {
      log('Contact error');
    }
  }
}
