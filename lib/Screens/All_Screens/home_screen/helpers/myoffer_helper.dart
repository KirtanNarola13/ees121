import 'dart:convert';
import 'dart:developer';

import 'package:EES121/Screens/All_Screens/home_screen/model/myOffer_model.dart';
import 'package:http/http.dart' as http;

class MyOfferHelper {
  MyOfferHelper._();

  static final MyOfferHelper myOfferHelper = MyOfferHelper._();
  static String myOffer = "";
  Future<MyOfferModel?> getOffer(String provider) async {
    String url = "https://panel.ees121.com/api/userofferdetail";
    http.Response response = await http.post(
      Uri.parse(url),
      body: {
        'provider': provider,
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      Map<String, dynamic> decodedData = jsonResponse['data'];
      log(decodedData.toString());
      MyOfferModel myOfferModel = MyOfferModel.fromJson(decodedData['offer']);
      return myOfferModel;
    } else {
      return null;
    }
  }
}
