import 'dart:convert';
import 'dart:developer';
import 'package:EES121/Screens/login_procces/Global/global.dart';
import 'package:http/http.dart' as http;

class AvailableHelper {
  AvailableHelper._();
  static final AvailableHelper availableHelper = AvailableHelper._();
  Future<void> updateSwitch(bool value) async {
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
      } else {
        log('Failed to update switch. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error updating switch: $e');
    }
  }
}
