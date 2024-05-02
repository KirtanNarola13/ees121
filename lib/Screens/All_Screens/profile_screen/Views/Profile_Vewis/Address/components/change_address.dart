import 'package:EES121/Screens/All_Screens/profile_screen/Views/Profile_Vewis/Address/components/change_address_global.dart';
import 'package:EES121/Screens/All_Screens/profile_screen/Views/Profile_Vewis/Address/helper/change_address_helper.dart';
import 'package:flutter/material.dart';

import '../../../../../../../Colors/colors.dart';

class ChangeAddress extends StatelessWidget {
  final _addressKey = GlobalKey<FormState>();
  ChangeAddress({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("CHange Address"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: AppColors.appColor,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          key: _addressKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (String? val) {
                      ChangeAddressGlobal.addressController.text = val!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: ChangeAddressGlobal.addressController,
                    decoration: InputDecoration(
                      labelText: 'Address',
                      labelStyle: TextStyle(
                        color:
                            AppColors.appColor, // Change to your desired color
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (String? val) {
                      ChangeAddressGlobal.areaController.text = val!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: ChangeAddressGlobal.areaController,
                    decoration: InputDecoration(
                      labelText: 'Area',
                      labelStyle: TextStyle(
                        color:
                            AppColors.appColor, // Change to your desired color
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (String? val) {
                      ChangeAddressGlobal.pinCodeController.text = val!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: ChangeAddressGlobal.pinCodeController,
                    decoration: InputDecoration(
                      labelText: 'Pin code',
                      labelStyle: TextStyle(
                        color:
                            AppColors.appColor, // Change to your desired color
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (String? val) {
                      ChangeAddressGlobal.cityController.text = val!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: ChangeAddressGlobal.cityController,
                    decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle: TextStyle(
                        color:
                            AppColors.appColor, // Change to your desired color
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (String? val) {
                      ChangeAddressGlobal.stateController.text = val!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: ChangeAddressGlobal.stateController,
                    decoration: InputDecoration(
                      labelText: 'State',
                      labelStyle: TextStyle(
                        color:
                            AppColors.appColor, // Change to your desired color
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
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    if (_addressKey.currentState!.validate()) {
                      ChangeAddressHelper.changeAddressHelper.changeAddress(
                        cur_address: ChangeAddressGlobal.addressController.text,
                        cur_area: ChangeAddressGlobal.areaController.text,
                        cur_pincode: ChangeAddressGlobal.pinCodeController.text,
                        cur_city: ChangeAddressGlobal.cityController.text,
                        cur_state: ChangeAddressGlobal.stateController.text,
                      );
                      Navigator.pop(context);
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
                      color: AppColors.appColor, // Change to your desired color
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Change Address',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
