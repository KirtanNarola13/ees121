import 'package:ees121/Screens/drawer_options/work_screen/Provider/work_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Colors/colors.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({Key? key});

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
          "Work request",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<WorkProvider>(context, listen: false)
                          .changeRequest();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: h / 15,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:
                            Provider.of<WorkProvider>(context).work?.isSent ==
                                    false
                                ? AppColors.appColor.withOpacity(0.5)
                                : Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: AppColors.appColor),
                      ),
                      child: const Text('Request received'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<WorkProvider>(context, listen: false)
                          .changeRequest();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: h / 15,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color:
                            Provider.of<WorkProvider>(context).work?.isSent ==
                                    true
                                ? AppColors.appColor.withOpacity(0.5)
                                : Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: AppColors.appColor),
                      ),
                      child: const Text('Request send'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
