import 'dart:convert';
import 'dart:developer';

import 'package:ees121/Global/globalUser.dart';
import 'package:ees121/Screens/login_procces/Global/global.dart';
import 'package:ees121/Screens/login_procces/Model/userModel.dart';
import 'package:ees121/Screens/login_procces/provider/passwordProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Colors/colors.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _eesKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    // Replace with your actual API endpoint
    void login(String id, String password) async {
      try {
        http.Response response = await http.post(
          Uri.parse('https://adminpanel.appsolution.online/ees121/api/user'),
          body: {'loginid': id, 'loginpass': password},
        );

        log('Response Status Code: ${response.statusCode}');
        log('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = json.decode(response.body);

          if (responseData['status'] == 'SUCCESS') {
            // Assuming 'data' is the field containing the user profile
            Map<String, dynamic> userData = responseData['data'];

            // Assuming 'User.data' is a Map<String, dynamic> variable
            User.data = userData['0'];
            log(User.data.toString());
            log("Login");
            Navigator.pushReplacementNamed(context, 'navbar');
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
    // // Google SignIn
    // final GoogleSignIn _googleSignIn = GoogleSignIn();
    // //
    // Future<void> _signInWithGoogle() async {
    //   try {
    //     await _googleSignIn.signIn();
    //     log("${_googleSignIn.currentUser?.displayName}");
    //     log("${_googleSignIn.currentUser?.email}");
    //     log("${_googleSignIn.currentUser?.photoUrl}");
    //     log("${_googleSignIn.currentUser?.id}");
    //   } catch (error) {
    //     log("Error signing in with Google: $error");
    //   }
    // }

    //
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h / 30,
            ),
            SafeArea(
              child: Container(
                height: h / 4.5,
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login to you',
                      style: TextStyle(
                        fontSize: 37,
                      ),
                    ),
                    Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 37,
                        color: AppColors.appColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: h / 2.8,
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Form(
                key: _eesKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: h / 35,
                      ),
                      TextFormField(
                        onSaved: (String? val) {
                          LoginSinUp.numberController.text = val!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: LoginSinUp.numberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          labelStyle: TextStyle(
                            color: AppColors.appColor,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                              width: 5,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.phone,
                              color: AppColors.appColor,
                            ), // icon is 48px widget.
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h / 35,
                      ),
                      TextFormField(
                        onSaved: (String? val) {
                          LoginSinUp.passwordController.text = val!;
                        },
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Password is too short';
                          }
                          return null;
                        },
                        controller: LoginSinUp.passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: AppColors.appColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.appColor,
                              width: 5,
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: IconButton(
                              onPressed: () {
                                Provider.of<PasswordProvider>(context,
                                        listen: false)
                                    .toggle();
                              },
                              icon: Provider.of<PasswordProvider>(context)
                                      .password
                                      .obscureText
                                  ? Icon(
                                      Icons.visibility,
                                    )
                                  : Icon(Icons.visibility_off),
                              color: AppColors.appColor,
                            ), // icon is 48px widget.
                          ),
                        ),
                        obscureText:
                            Provider.of<PasswordProvider>(context, listen: true)
                                .password
                                .obscureText,
                      ),
                      SizedBox(
                        height: h / 35,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_eesKey.currentState!.validate()) {
                            // Share Preferences

                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();

                            preferences.setBool('isLogin', true);
                            login(LoginSinUp.numberController.text,
                                LoginSinUp.passwordController.text);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Invalid Email or Password'),
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
                          child: const Text('Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dont have an account? ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.appColor,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.appColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
