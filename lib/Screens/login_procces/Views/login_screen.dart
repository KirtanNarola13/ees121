import 'dart:developer';

import 'package:ees121/Screens/login_procces/Global/global.dart';
import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: SizedBox(
                  height: h / 30,
                ),
              ),
              SafeArea(
                child: Container(
                  height: h / 5,
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login to you',
                        style: TextStyle(
                          fontSize: 47,
                        ),
                      ),
                      Text(
                        'Account',
                        style: TextStyle(
                          fontSize: 47,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                      GestureDetector(
                        onTap: () {
                          if (_eesKey.currentState!.validate()) {
                            setState(() {
                              Navigator.pushReplacementNamed(
                                  context, 'contact_info');
                              LoginSinUp.email =
                                  LoginSinUp.emailController.text;
                              log(LoginSinUp.email);
                              LoginSinUp.password =
                                  LoginSinUp.passwordController.text;
                              log(LoginSinUp.password);

                              LoginSinUp.emailController.clear();
                              LoginSinUp.passwordController.clear();
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
                          width: w / 0.7,
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
                                fontSize: 28,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: h / 3.5,
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
                        color: Colors.black,
                        fontSize: 20,
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
                height: h / 40,
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account? ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('signup');
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 18,
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
    );
  }
}
