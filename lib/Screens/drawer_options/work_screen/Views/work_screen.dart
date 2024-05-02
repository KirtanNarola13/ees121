import 'dart:developer';

import 'package:EES121/Screens/drawer_options/work_screen/components/work_detail_model.dart';
import 'package:EES121/Screens/drawer_options/work_screen/model/work_model.dart';
import 'package:EES121/Screens/login_procces/Global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';
import '../../../All_Screens/search_screen/Category_two/categoryTwoProvider.dart';
import '../Provider/work_provider.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({Key? key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  @override
  void initState() {
    super.initState();
    //
    // Provider.of<WorkProvider>(context).workApi.workSent.clear();
    // Provider.of<WorkProvider>(context).workApi.workReceived.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // Provider.of<WorkProvider>(context, listen: false).workApi.workSent.clear();
    // Provider.of<WorkProvider>(context, listen: false)
    //     .workApi
    //     .workReceived
    //     .clear();
  }

  @override
  Widget build(BuildContext context) {
    int password = int.parse(LoginSinUp.passwordController.text);
    Provider.of<WorkProvider>(context, listen: false)
        .getWork(id: LoginSinUp.numberController.text, password: password);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Work's"),
      ),
      body: Consumer<WorkProvider>(
        builder: (context, provider, _) {
          if (provider.state == CategoryProviderState.Error) {
            return getErrorUI(provider.error);
          } else if (provider.state == CategoryProviderState.Loaded) {
            return getUi(provider.workApi, context);
          } else {
            return getLoadingUI();
          }
        },
      ),
    );
  }
}

Widget getLoadingUI() {
  return Center(
    child: SpinKitCubeGrid(
      color: AppColors.appColor,
      size: 80.0,
    ),
  );
}

Widget getErrorUI(String error) {
  return Center(
    child: Text(
      error,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 22,
      ),
    ),
  );
}

getUi(WorkApi workApi, BuildContext context) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  String webp = "https://ees121.com/panel/files/";
  return Column(
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
                      height: h / 13,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: workProvider.work?.isSent == false
                            ? AppColors.appColor.withOpacity(0.5)
                            : Colors.transparent,
                        borderRadius: const BorderRadius.all(
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
                    log("Work Received Length: ${workApi.workReceived.length}");
                    log("Work Sent Length: ${workApi.workSent.length}");

                    return Container(
                      alignment: Alignment.center,
                      height: h / 13,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: workProvider.work?.isSent == true
                            ? AppColors.appColor.withOpacity(0.5)
                            : Colors.transparent,
                        borderRadius: const BorderRadius.all(
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
      SizedBox(
        height: h / 50,
      ),
      Expanded(
        flex: 10,
        child: Consumer<WorkProvider>(
          builder: (context, workProvider, child) {
            return (workProvider.work?.isSent == true)
                ? ListView.builder(
                    itemCount: workApi.workSent.length,
                    itemBuilder: (context, i) {
                      return (User.data['userid'] == workApi.workSent[i].userid)
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                WorkDetailUser user = WorkDetailUser(
                                  userId: workApi.workSent[i].userid,
                                  fullName: workApi.workSent[i].fullname,
                                  email: workApi.workSent[i].email,
                                  mobileNo: workApi.workSent[i].mobileNo,
                                  category: workApi.workSent[i].category,
                                  organizationName:
                                      workApi.workSent[i].organizationName,
                                  designation: workApi.workSent[i].designation,
                                  serviceDetails:
                                      workApi.workSent[i].serviceDetails,
                                  address: workApi.workSent[i].address,
                                  currentAddress:
                                      workApi.workSent[i].curAddress,
                                  currentPincode:
                                      workApi.workSent[i].curPincode,
                                  currentCity: workApi.workSent[i].curCity,
                                  currentState: workApi.workSent[i].curState,
                                  // isAvailable: bool.parse(workApi.workSent[i].isAvailable),
                                  userAvgRating: double.parse(
                                      workApi.workSent[i].userAvgRating),
                                  providerAvgRating: double.parse(
                                      workApi.workSent[i].providerAvgRating),
                                  selfieFile: workApi.workSent[i].selfiFile,
                                  kycStatus: workApi.workSent[i].kycStatus,
                                  aadharNo: workApi.workSent[i].adharNo,
                                  paymentStatus:
                                      workApi.workSent[i].paymentStatus,
                                  joinDate: DateTime.parse(
                                      workApi.workSent[i].joinDate),
                                  walletBalance: double.parse(
                                      workApi.workSent[i].walletBalance),
                                  workRequestDate: DateTime.parse(
                                      workApi.workSent[i].workRequestDate),
                                  callRequestStatus:
                                      workApi.workSent[i].callRequestStatus,
                                  userRating: double.parse(
                                      workApi.workSent[i].userRating),
                                  providerRating: double.parse(
                                      workApi.workSent[i].providerRating),
                                  rewardRefNo: workApi.workSent[i].rewardRefNo,
                                  // rewardPaymentVerified: workApi.workSent[i].rewardPaymentVerified.to,
                                );
                                Navigator.of(context)
                                    .pushNamed('work_detail', arguments: user);
                              },
                              child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  height: h / 5,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border:
                                        Border.all(color: AppColors.appColor),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  webp +
                                                      workApi.workSent[i]
                                                          .selfiFile,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                workApi.workSent[i].fullname,
                                                style: const TextStyle(
                                                    fontSize: 12),
                                                textAlign: TextAlign.center,
                                              ),
                                              Divider(
                                                color: AppColors.appColor
                                                    .withOpacity(0.5),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Provider Rating',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: double.parse(
                                                        workApi.workSent[i]
                                                            .providerRating),
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 10,
                                                    itemSize: 16,
                                                    ignoreGestures: true,
                                                    itemPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 1.5),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate:
                                                        (double value) {},
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                color: AppColors.appColor
                                                    .withOpacity(0.5),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'User Rating',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: double.parse(
                                                        workApi.workSent[i]
                                                            .userRating),
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 10,
                                                    itemSize: 14,
                                                    ignoreGestures: true,
                                                    itemPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 1.5),
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate:
                                                        (double value) {},
                                                  ),
                                                  Divider(
                                                    color: AppColors.appColor
                                                        .withOpacity(0.5),
                                                  ),
                                                  Text(
                                                    workApi.workSent[i]
                                                        .callRequestStatus,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: (workApi
                                                                  .workSent[i]
                                                                  .callRequestStatus ==
                                                              "open")
                                                          ? Colors.black
                                                          : (workApi.workSent[i]
                                                                      .callRequestStatus ==
                                                                  "complete")
                                                              ? Colors.green
                                                              : Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                    },
                  )
                : ListView.builder(
                    itemCount: workApi.workReceived.length,
                    itemBuilder: (context, i) {
                      return (User.data['userid'] == workApi.workSent[i].userid)
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                WorkDetailUser user = WorkDetailUser(
                                  userId: workApi.workReceived[i].userid,
                                  fullName: workApi.workReceived[i].fullname,
                                  email: workApi.workReceived[i].email,
                                  mobileNo: workApi.workReceived[i].mobileNo,
                                  category: workApi.workReceived[i].category,
                                  organizationName:
                                      workApi.workReceived[i].organizationName,
                                  designation:
                                      workApi.workReceived[i].designation,
                                  serviceDetails:
                                      workApi.workReceived[i].serviceDetails,
                                  address: workApi.workReceived[i].address,
                                  currentAddress:
                                      workApi.workReceived[i].curAddress,
                                  currentPincode:
                                      workApi.workReceived[i].curPincode,
                                  currentCity: workApi.workReceived[i].curCity,
                                  currentState:
                                      workApi.workReceived[i].curState,
                                  // isAvailable: bool.parse(workApi.workSent[i].isAvailable),
                                  userAvgRating: double.parse(
                                      workApi.workReceived[i].userAvgRating),
                                  providerAvgRating: double.parse(workApi
                                      .workReceived[i].providerAvgRating),
                                  selfieFile: workApi.workReceived[i].selfiFile,
                                  kycStatus: workApi.workReceived[i].kycStatus,
                                  aadharNo: workApi.workReceived[i].adharNo,
                                  paymentStatus:
                                      workApi.workReceived[i].paymentStatus,
                                  joinDate: DateTime.parse(
                                      workApi.workReceived[i].joinDate),
                                  walletBalance: double.parse(
                                      workApi.workReceived[i].walletBalance),
                                  workRequestDate: DateTime.parse(
                                      workApi.workReceived[i].workRequestDate),
                                  callRequestStatus:
                                      workApi.workReceived[i].callRequestStatus,
                                  userRating: double.parse(
                                      workApi.workReceived[i].userRating),
                                  providerRating: double.parse(
                                      workApi.workReceived[i].providerRating),
                                  rewardRefNo:
                                      workApi.workReceived[i].rewardRefNo,
                                  // rewardPaymentVerified: workApi.workSent[i].rewardPaymentVerified.to,
                                );
                                Navigator.of(context)
                                    .pushNamed('work_detail', arguments: user);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 10,
                                  bottom: 10,
                                ),
                                height: h / 5,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  border: Border.all(color: AppColors.appColor),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                webp +
                                                    workApi.workReceived[i]
                                                        .selfiFile,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              workApi.workReceived[i].fullname,
                                              style:
                                                  const TextStyle(fontSize: 12),
                                            ),
                                            Divider(
                                              color: AppColors.appColor
                                                  .withOpacity(0.5),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'Provider Rating',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                RatingBar.builder(
                                                  initialRating: double.parse(
                                                      workApi.workReceived[i]
                                                          .providerRating),
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 10,
                                                  itemSize: 14,
                                                  ignoreGestures: true,
                                                  itemPadding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 1.5),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate:
                                                      (double value) {},
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: AppColors.appColor
                                                  .withOpacity(0.5),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'User Rating',
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                RatingBar.builder(
                                                  initialRating: double.parse(
                                                      workApi.workReceived[i]
                                                          .userRating),
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 10,
                                                  itemSize: 14,
                                                  ignoreGestures: true,
                                                  itemPadding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 1.5),
                                                  itemBuilder: (context, _) =>
                                                      const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate:
                                                      (double value) {},
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: AppColors.appColor
                                                  .withOpacity(0.5),
                                            ),
                                            Text(
                                              workApi.workReceived[i]
                                                  .callRequestStatus,
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: (workApi.workReceived[i]
                                                            .callRequestStatus ==
                                                        "open")
                                                    ? Colors.black
                                                    : (workApi.workReceived[i]
                                                                .callRequestStatus ==
                                                            "complete")
                                                        ? Colors.green
                                                        : Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  );
          },
        ),
      ),
    ],
  );
}
