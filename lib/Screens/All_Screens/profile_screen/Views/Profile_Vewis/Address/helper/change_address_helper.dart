import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../../../../../../Global/globalUser.dart';

class ChangeAddressHelper {
  ChangeAddressHelper._();
  static final ChangeAddressHelper changeAddressHelper =
      ChangeAddressHelper._();

  Future<void> changeAddress({
    required String cur_address,
    required String cur_area,
    required String cur_pincode,
    required String cur_city,
    required String cur_state,
  }) async {
    String api = "https://panel.ees121.com/api/updatecurraddress";
    http.Response response = await http.post(Uri.parse(api), body: {
      "mobile": User.data['mobile_no'],
      "cur_address": cur_address,
      "cur_area": cur_area,
      "cur_pincode": cur_pincode,
      "cur_city": cur_city,
      "cur_state": cur_state,
    });

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      log(decodedData.toString());
    } else {
      log("Error");
    }
  }
}
