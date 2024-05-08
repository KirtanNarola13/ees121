import 'dart:convert';
import 'dart:developer';

import 'package:EES121/Screens/login_procces/Views/helpers/user-count-helper.dart';
import 'package:EES121/helper/db_helper.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Colors/colors.dart';
import '../../../Global/globalUser.dart';
import '../../All_Screens/home_screen/helpers/myoffer_helper.dart';
import '../../All_Screens/search_screen/provider/search_provider.dart';
import '../Global/global.dart';
import '../provider/passwordProvider.dart';

// Import other dependencies and files as needed

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _eesKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    void login(String id, String password) async {
      try {
        Provider.of<PasswordProvider>(context, listen: false).showLoading();

        http.Response response = await http.post(
          Uri.parse('https://panel.ees121.com/api/user'),
          body: {'loginid': id, 'loginpass': password},
        );

        log('Response Status Code: ${response.statusCode}');
        log('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          final Map responseData = json.decode(response.body);

          if (responseData['status'] == 'SUCCESS') {
            User.UserData = responseData['data'];
            if (User.UserData['loginuser'] == "") {
              log(User.UserData['loginuser']);
              log('userdata data is null');
              // Handle the absence of team data here, you can set it to an empty list or handle it as you need
              User.UserData = {};
            } else {
              User.data = User.UserData['loginuser'];
            }

            // User.offer = userData['offers'];
            if (User.UserData['offers'] == "") {
              log('offer data is null');
              // Handle the absence of team data here, you can set it to an empty list or handle it as you need
              User.offer = [];
            } else {
              User.offer = User.UserData['offers'];
            }

            // User.myOffers = userData['myoffers'];
            if (User.UserData['myoffers'] == "") {
              log('myoffer data is null');
              // Handle the absence of team data here, you can set it to an empty list or handle it as you need
              User.myOffers = [];
            } else {
              User.myOffers = User.UserData['myoffers'];
            }

            if (User.UserData['team'] == null) {
              log('Team data is null');
              // Handle the absence of team data here, you can set it to an empty list or handle it as you need
              User.team = []; // For example, setting it to an empty list
            } else {
              User.team = User.UserData['team'];
            }
            if (User.UserData['contactsupport'] == "") {
              log('ContactSupport data is null');
              // Handle the absence of team data here, you can set it to an empty list or handle it as you need
              User.contactSupport = [];
            } else {
              User.contactSupport = User.UserData['contactsupport'];
            }
            if (User.UserData['notifications'] == "") {
              log('notification data is null');
              // Handle the absence of team data here, you can set it to an empty list or handle it as you need
              User.notifications = [];
            } else {
              User.notifications = User.UserData['notifications'];
            }

            CherryToast.success(
              title: Text(
                "Login Successfully",
                style: TextStyle(color: AppColors.appColor),
              ),
            ).show(context);
            Navigator.pushReplacementNamed(context, 'navbar');
          } else {
            log('Login Failed: ${responseData['status']}');

            CherryToast.error(
              title: Text(
                "invalid phone or password",
                style: TextStyle(color: AppColors.appColor),
              ),
            ).show(context);
          }
        } else {
          log('Failed: ${response.statusCode}');
          CherryToast.error(
            title: const Text(
              "invalid phone or password",
              style: TextStyle(color: Colors.red),
            ),
          ).show(context);
        }
      } catch (e) {
        log('Error: $e');
        CherryToast.error(
          title: Text(
            "Erro $e",
            style: const TextStyle(color: Colors.red),
          ),
        ).show(context);
      } finally {
        Provider.of<PasswordProvider>(context, listen: false).hideLoading();
      }
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login to you're",
                        style: TextStyle(
                          fontSize: 34,
                        ),
                      ),
                      Text(
                        'Account',
                        style: TextStyle(
                          fontSize: 34,
                          color: AppColors
                              .appColor, // Change to your desired color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FutureBuilder(
                        future: UserCountHelper.userCountHelper.getUserCount(),
                        builder: (context, snapshot) {
                          return Row(
                            children: [
                              Text(
                                "Users : ${snapshot.data?['users']}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 2,
                                ),
                              ),
                              const Text(
                                "+",
                                style: TextStyle(
                                  fontSize: 26,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 8,
              child: Container(
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
                          maxLength: 10,
                          controller: LoginSinUp.numberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone',
                            labelStyle: TextStyle(
                              color: AppColors
                                  .appColor, // Change to your desired color
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
                                color: AppColors
                                    .appColor, // Change to your desired color
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h / 30,
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
                              color: AppColors
                                  .appColor, // Change to your desired color
                            ),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: AppColors
                                    .appColor, // Change to your desired color
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
                                    ? const Icon(
                                        Icons.visibility,
                                      )
                                    : const Icon(Icons.visibility_off),
                                color: AppColors
                                    .appColor, // Change to your desired color
                              ),
                            ),
                          ),
                          obscureText: Provider.of<PasswordProvider>(context,
                                  listen: true)
                              .password
                              .obscureText,
                        ),
                        SizedBox(
                          height: h / 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            if (_eesKey.currentState!.validate()) {
                              // SharedPreferences preferences = await SharedPreferences.getInstance();
                              // preferences.setBool('isLogin', true);
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
                          child: Consumer<PasswordProvider>(
                            builder: (context, passwordProvider, child) {
                              return Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(5),
                                width: w / 1.5,
                                height: h / 13,
                                decoration: BoxDecoration(
                                  color: AppColors
                                      .appColor, // Change to your desired color
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: passwordProvider.isLoading
                                    ? const CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      )
                                    : const Text('Sign In',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        )),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Assuming 'launchUrl' is a function to handle URL launching
                    // Make sure to implement or replace this function with the correct one
                    launchUrl(
                        Uri.parse('https://ees121.com/join/EES1655090049348'),
                        mode: LaunchMode.inAppWebView);
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.appColor, // Change to your desired color
                      decoration: TextDecoration.underline,
                      decorationColor:
                          AppColors.appColor, // Change to your desired color
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
