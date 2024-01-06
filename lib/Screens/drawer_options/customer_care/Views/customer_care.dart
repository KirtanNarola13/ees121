import 'dart:convert';
import 'dart:developer';

import 'package:ees121/Global/globalUser.dart';
import 'package:ees121/Screens/drawer_options/customer_care/Global/customer_care_global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../Colors/colors.dart';

class CustomerCare extends StatelessWidget {
  CustomerCare({super.key});
  final GlobalKey<FormState> _customerCareKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    bool hasData = false;

    // post api
    void sendRequest(
      String contactName,
      String contactEmail,
      String contactNumber,
      String massage,
      String createdBy,
    ) async {
      try {
        http.Response response = await http.post(
          Uri.parse(
              'https://adminpanel.appsolution.online/ees121/api/contactpage'),
          body: {
            'contact_name': contactName,
            'contact_email': contactEmail,
            'contact_no': contactNumber,
            'message': massage,
            'createdby': createdBy,
          },
        );

        log('Response Status Code: ${response.statusCode}');
        log('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = json.decode(response.body);

          if (responseData['status'] == 'SUCCESS') {
            // Assuming 'data' is the field containing the user profile

            // Assuming 'User.data' is a Map<String, dynamic> variable
            hasData = true;

            log(responseData.toString());
          } else {
            log('Request Failed: ${responseData['status']}');
          }
        } else {
          log('Failed: ${response.statusCode}');
          hasData = false;
        }
      } catch (e) {
        log('Error: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Customer care",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
      body: (hasData == true)
          ? Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Form(
                key: _customerCareKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: h / 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 5),
                        child: TextFormField(
                          onSaved: (String? val) {
                            CustomerCareGlobal.customerName.text = val!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: CustomerCareGlobal.customerName,
                          decoration: const InputDecoration(
                            labelText: 'Name',
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
                      SizedBox(
                        height: h / 40,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: TextFormField(
                          onSaved: (String? val) {
                            CustomerCareGlobal.customerNumber.text = val!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: CustomerCareGlobal.customerNumber,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Mobile number',
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
                      SizedBox(
                        height: h / 40,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: TextFormField(
                          onSaved: (String? val) {
                            CustomerCareGlobal.customerEmail.text = val!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'invalid number';
                            }
                            return null;
                          },
                          controller: CustomerCareGlobal.customerEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
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
                      SizedBox(
                        height: h / 40,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 20,
                          maxLength: 250,
                          onSaved: (String? val) {
                            CustomerCareGlobal.customerMassage.text = val!;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'invalid number';
                            }
                            return null;
                          },
                          controller: CustomerCareGlobal.customerMassage,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: 'Massage',
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
                      SizedBox(
                        height: h / 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_customerCareKey.currentState!.validate()) {
                            sendRequest(
                                CustomerCareGlobal.customerName.text,
                                CustomerCareGlobal.customerEmail.text,
                                CustomerCareGlobal.customerNumber.text,
                                CustomerCareGlobal.customerMassage.text,
                                User.data['userid']);
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
                          child: const Text('Send request',
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
            )
          : Container(
              padding: const EdgeInsets.all(20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                        'lib/Screens/drawer_options/customer_care/Assets/customer_care.png'),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "We have received your ticket and are currently reviewing it. Our team will contact you soon.",
                      style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
