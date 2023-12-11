import 'dart:developer';

import 'package:ees121/Screens/login_procces/Global/global.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Colors/colors.dart';

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
    // Google SignIn
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    //
    Future<void> _signInWithGoogle() async {
      try {
        await _googleSignIn.signIn();
        log("${_googleSignIn.currentUser?.displayName}");
        log("${_googleSignIn.currentUser?.email}");
        log("${_googleSignIn.currentUser?.photoUrl}");
        log("${_googleSignIn.currentUser?.id}");
      } catch (error) {
        log("Error signing in with Google: $error");
      }
    }

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
                          LoginSinUp.emailController.text = val!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: LoginSinUp.emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
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
                              Icons.email_outlined,
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
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
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
                            child: Icon(
                              Icons.lock_outline_sharp,
                              color: AppColors.appColor,
                            ), // icon is 48px widget.
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h / 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_eesKey.currentState!.validate()) {
                            if (LoginSinUp.emailController.text ==
                                    LoginSinUp.email &&
                                LoginSinUp.passwordController.text ==
                                    LoginSinUp.password) {
                              setState(() async {
                                Navigator.pushReplacementNamed(
                                    context, 'navbar');

                                LoginSinUp.emailController.clear();
                                LoginSinUp.passwordController.clear();
                                // Share Preferences

                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();

                                preferences.setBool('isLogin', true);
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Invalid Email or Password'),
                                ),
                              );
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
              height: h / 4,
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.only(
                top: 20,
              ),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.appColor, width: 1),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Text(
                    'Sign in with',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _signInWithGoogle();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          padding: const EdgeInsets.all(10),
                          height: h / 15,
                          width: w / 7,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.appColor,
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Image(
                            image: AssetImage(
                                'lib/Screens/login_procces/Assets/google-logo.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: w / 15,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                        padding: const EdgeInsets.all(10),
                        height: h / 15,
                        width: w / 7,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.appColor,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Image(
                          image: AssetImage(
                              'lib/Screens/login_procces/Assets/apple-logo.png'),
                        ),
                      ),
                    ],
                  ),
                ],
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
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('signup');
                    },
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
