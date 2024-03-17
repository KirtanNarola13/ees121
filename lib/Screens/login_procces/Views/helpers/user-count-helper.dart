
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
class UserCountHelper {
  UserCountHelper._();
  static final UserCountHelper userCountHelper = UserCountHelper._();

  Future<Map<String, dynamic>?> getUserCount () async{
    String apiEndPoint = "https://panel.ees121.com/api/totalcount";
    http.Response response = await http.post(
      Uri.parse(apiEndPoint),
      body:  {
        'count' : 'users'
      }

    );
    if(response.statusCode == 200) {
      log(response.body.toString());
       Map<String,dynamic> decodedData = jsonDecode(response.body);
       Map<String,dynamic> count = decodedData['data'];
       return count;
    }else {
      return null;
    }
  }
}