// work_screen.dart

import 'package:ees121/Screens/drawer_options/work_screen/Global/work_global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ees121/Screens/drawer_options/work_screen/Provider/work_provider.dart';
import '../../../../Colors/colors.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
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
                    child: Consumer<WorkProvider>(
                      builder: (context, workProvider, child) {
                        return Container(
                          alignment: Alignment.center,
                          height: h / 15,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: workProvider.work?.isSent == false
                                ? AppColors.appColor.withOpacity(0.5)
                                : Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            border: Border.all(
                              color: workProvider.work?.isSent == false
                                  ? Colors.white
                                  : AppColors.appColor.withOpacity(0.5),
                            ),
                          ),
                          child: const Text('Request received'),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<WorkProvider>(context, listen: false)
                          .changeRequest();
                    },
                    child: Consumer<WorkProvider>(
                      builder: (context, workProvider, child) {
                        return Container(
                          alignment: Alignment.center,
                          height: h / 15,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: workProvider.work?.isSent == true
                                ? AppColors.appColor.withOpacity(0.5)
                                : Colors.transparent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            border: Border.all(
                              color: workProvider.work?.isSent == true
                                  ? Colors.white
                                  : AppColors.appColor.withOpacity(0.5),
                            ),
                          ),
                          child: const Text('Request send'),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Consumer<WorkProvider>(
              builder: (context, workProvider, child) {
                return (workProvider.work?.isSent == true)
                    ? Column(
                        children: allReceived.map((e) {
                          return Container(
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 10),
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: AppColors.appColor),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.appColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      image: DecorationImage(
                                        image: NetworkImage(e['img']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, right: 10, left: 10),
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(e['name']),
                                        Divider(
                                          color: AppColors.appColor
                                              .withOpacity(0.5),
                                        ),
                                        Text(e['category']),
                                        Divider(
                                          color: AppColors.appColor
                                              .withOpacity(0.5),
                                        ),
                                        Text(e['company']),
                                        Divider(
                                          color: AppColors.appColor
                                              .withOpacity(0.5),
                                        ),
                                        Text(e['address']),
                                        Divider(
                                          color: AppColors.appColor
                                              .withOpacity(0.5),
                                        ),
                                        Text('⭐⭐⭐⭐⭐'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    : Column(
                        children: allSend.map((e) {
                          return Container(
                            margin:
                                EdgeInsets.only(left: 15, right: 15, top: 10),
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: AppColors.appColor),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.appColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      image: DecorationImage(
                                        image: NetworkImage(e['img']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 5, right: 10, left: 10),
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(e['name']),
                                        Divider(
                                          color: AppColors.appColor
                                              .withOpacity(0.5),
                                        ),
                                        Text(e['category']),
                                        Divider(
                                          color: AppColors.appColor
                                              .withOpacity(0.5),
                                        ),
                                        Text(e['company']),
                                        Divider(
                                          color: AppColors.appColor
                                              .withOpacity(0.5),
                                        ),
                                        Text(e['address']),
                                        Divider(
                                          color: AppColors.appColor
                                              .withOpacity(0.5),
                                        ),
                                        Text('⭐⭐⭐⭐⭐'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
