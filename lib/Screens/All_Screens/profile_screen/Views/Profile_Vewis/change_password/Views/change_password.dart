import 'dart:convert';
import 'dart:developer';

import 'package:ees121/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../Global/globalUser.dart';
import '../Global/changePasswordGlobal.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  void changePassword(String id, String conformPassword) async {
    try {
      http.Response response = await http.post(
        Uri.parse(
            'https://adminpanel.appsolution.online/ees121/api/updatepassword'),
        body: {'loginid': id, 'loginpass': conformPassword},
      );

      log('Response Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData['status'] == 'SUCCESS') {
          log("Password Changed Successfully");
          log("Login");
        } else {
          log('Login Failed: ${responseData['status']}');
        }
      } else {
        log('Failed: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  final GlobalKey<FormState> changePasswordKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    // Function to handle taps outside the text fields

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: AppColors.appColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Change Password",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: const Image(
                image: AssetImage(
                    'lib/Screens/All_Screens/profile_screen/Views/Profile_Vewis/change_password/Assets/changePassword.png'),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Form(
              key: changePasswordKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      onChanged: (String? val) {
                        ChangePasswordGlobal.newPassWordController.text = val!;
                      },
                      controller: ChangePasswordGlobal.newPassWordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'New Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: TextFormField(
                      onSaved: (String? val) {
                        ChangePasswordGlobal.conformPassWordController.text =
                            val!;
                      },
                      controller:
                          ChangePasswordGlobal.conformPassWordController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Conform Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (changePasswordKey.currentState!.validate()) {
                        if (ChangePasswordGlobal.newPassWordController.text ==
                            ChangePasswordGlobal
                                .conformPassWordController.text) {
                          changePassword(
                              User.data['mobile_no'].toString(),
                              ChangePasswordGlobal
                                  .conformPassWordController.text);
                          log("password conformed from method");
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Company Detail Is Required'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5),
                      width: w / 1.5,
                      height: h / 13,
                      decoration: BoxDecoration(
                        color: AppColors.appColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Change Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
