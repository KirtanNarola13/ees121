import 'dart:developer';

import 'package:ees121/Colors/colors.dart';
import 'package:flutter/material.dart';

import '../Global/global.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _eesKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SafeArea(
          child: Form(
            key: _eesKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: h / 30,
                      ),
                      SizedBox(
                        height: h / 30,
                      ),
                      TextFormField(
                        onSaved: (String? val) {
                          LoginSinUp.usernameController.text = val!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: LoginSinUp.usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
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
                              Icons.person,
                              color: AppColors.appColor,
                            ), // icon is 48px widget.
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h / 30,
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
                              Icons.email_outlined,
                              color: AppColors.appColor,
                            ), // icon is 48px widget.
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
                              Icons.lock,
                              color: AppColors.appColor,
                            ), // icon is 48px widget.
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h / 30,
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
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
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
                              Icons.phone,
                              color: AppColors.appColor,
                            ), // icon is 48px widget.
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_eesKey.currentState!.validate()) {
                            setState(() {
                              LoginSinUp.username =
                                  LoginSinUp.usernameController.text;
                              log(LoginSinUp.username);
                              LoginSinUp.email =
                                  LoginSinUp.emailController.text;
                              log(LoginSinUp.email);
                              LoginSinUp.password =
                                  LoginSinUp.passwordController.text;
                              log(LoginSinUp.password);
                              LoginSinUp.number =
                                  LoginSinUp.numberController.text;
                              log(LoginSinUp.number);

                              LoginSinUp.usernameController.clear();
                              LoginSinUp.emailController.clear();
                              LoginSinUp.passwordController.clear();
                              LoginSinUp.numberController.clear();
                              Navigator.of(context)
                                  .pushReplacementNamed('navbar');
                            });
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
                          child: const Text('Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: h / 50,
                      ),
                    ],
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
                          'Sign up with',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                    'lib/Screens/login_procces/Assets/google-logo.png'),
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
                    margin: EdgeInsets.only(
                      bottom: h / 35,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('login');
                          },
                          child: Text(
                            'Sign in',
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
          ),
        ),
      ),
    );
  }
}
