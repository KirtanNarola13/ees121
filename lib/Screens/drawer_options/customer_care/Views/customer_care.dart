import 'dart:developer';
import 'dart:io';

import 'package:ees121/Screens/drawer_options/customer_care/Global/customer_care_global.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Colors/colors.dart';

class CustomerCare extends StatelessWidget {
  CustomerCare({super.key});
  final GlobalKey<FormState> _customerCareKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
          "Customer care",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Form(
          key: _customerCareKey,
          child: Column(
            children: [
              SizedBox(
                height: h / 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 5),
                      child: TextFormField(
                        onSaved: (String? val) {
                          CustomerCareGlobal.customerFirstNameController.text =
                              val!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller:
                            CustomerCareGlobal.customerFirstNameController,
                        decoration: InputDecoration(
                          labelText: 'First name',
                          border: const OutlineInputBorder(
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
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 10),
                      child: TextFormField(
                        onSaved: (String? val) {
                          CustomerCareGlobal.customerSecondNameController.text =
                              val!;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller:
                            CustomerCareGlobal.customerSecondNameController,
                        decoration: InputDecoration(
                          labelText: 'Second name',
                          border: const OutlineInputBorder(
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
                  ),
                ],
              ),
              SizedBox(
                height: h / 40,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: TextFormField(
                  onSaved: (String? val) {
                    CustomerCareGlobal.customerNumberController.text = val!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: CustomerCareGlobal.customerNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Mobile number',
                    border: const OutlineInputBorder(
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
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: TextFormField(
                  onSaved: (String? val) {
                    CustomerCareGlobal.customerEmailController.text = val!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'invalid number';
                    }
                    return null;
                  },
                  controller: CustomerCareGlobal.customerEmailController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: const OutlineInputBorder(
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
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 20,
                  maxLength: 250,
                  onSaved: (String? val) {
                    CustomerCareGlobal.customerMassageController.text = val!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'invalid number';
                    }
                    return null;
                  },
                  controller: CustomerCareGlobal.customerMassageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Massage',
                    border: const OutlineInputBorder(
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
                    CustomerCareGlobal.customerFirstName =
                        CustomerCareGlobal.customerFirstNameController.text;
                    log(CustomerCareGlobal.customerFirstName);
                    //
                    CustomerCareGlobal.customerSecondName =
                        CustomerCareGlobal.customerSecondNameController.text;
                    log(CustomerCareGlobal.customerSecondName);
                    //
                    CustomerCareGlobal.customerEmail =
                        CustomerCareGlobal.customerEmailController.text;
                    log(CustomerCareGlobal.customerEmail);
                    //
                    CustomerCareGlobal.customerNumber =
                        CustomerCareGlobal.customerNumberController.text;
                    log(CustomerCareGlobal.customerNumber);
                    //
                    CustomerCareGlobal.customerMassage =
                        CustomerCareGlobal.customerMassageController.text;
                    log(CustomerCareGlobal.customerMassage);
                    //
                    CustomerCareGlobal.customerFirstNameController.clear();
                    //

                    CustomerCareGlobal.customerSecondNameController.clear();
                    //
                    CustomerCareGlobal.customerEmailController.clear();
                    //

                    CustomerCareGlobal.customerNumberController.clear();
                    //

                    CustomerCareGlobal.customerMassageController.clear();
                    //
                    launchUrl(
                        Uri.parse(
                            'https://wa.me/+917778854551/?text=${CustomerCareGlobal.customerMassage}'),
                        mode: LaunchMode.externalApplication);
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
    );
  }
}
