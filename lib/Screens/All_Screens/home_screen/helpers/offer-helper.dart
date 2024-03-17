import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/offer-model.dart';

class OfferHelper {
  OfferHelper._();
  static final OfferHelper offerHelper = OfferHelper._();
  String apiUrl = "https://panel.ees121.com/api/userofferdetail";

  Future<OfferData?> getDetail(String providerId) async {
    http.Response response = await http.post(Uri.parse(apiUrl), body: {
      'provider': providerId,
    });
    if (response.statusCode == 200) {
      Map decodedData = jsonDecode(response.body);
      log(decodedData.toString());
      Map data = decodedData['data'];
      if (data != null && data.containsKey('offer')) {
        Map offer = data['offer'];
        log(offer.toString());
        OfferData offerData = OfferData.fromJson(offer);
        return offerData;
      } else {
        log("Offer data not found in response");
      }
    } else {
      log("Failed to fetch data. Status code: ${response.statusCode}");
    }
    return null;
  }
}
