import 'dart:developer';

import 'package:EES121/Screens/drawer_options/work_screen/model/work_model.dart';
import 'package:EES121/Screens/login_procces/Global/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';
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
    Provider.of<WorkProvider>(context, listen: false).getWork(
        id: LoginSinUp.numberController.text,
        password: LoginSinUp.passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
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
                          : Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 15, bottom: 20),
                              height: h / 2,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
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
                                        border: Border.all(
                                            color: AppColors.appColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        image: DecorationImage(
                                          image: NetworkImage(webp +
                                              workApi.workSent[i].selfiFile),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          right: 10,
                                          left: 10),
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            workApi.workSent[i].fullname,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          Text(
                                            workApi.workSent[i].category,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          Text(
                                            workApi
                                                .workSent[i].organizationName,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          Text(
                                            workApi.workSent[i].address,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          const Text(
                                            'User rating',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating: double.parse(workApi
                                                .workSent[i].userAvgRating),
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 10,
                                            itemSize: 12,
                                            ignoreGestures: true,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.5),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          const Text(
                                            'Provider rating',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating: double.parse(workApi
                                                .workSent[i].providerAvgRating),
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 10,
                                            itemSize: 12,
                                            ignoreGestures: true,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.5),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              launchUrl(Uri(
                                                  scheme: "tel",
                                                  path: workApi
                                                      .workSent[i].mobileNo));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: w / 4.5,
                                              height: h / 25,
                                              decoration: BoxDecoration(
                                                  color: AppColors.appColor
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: const Text(
                                                "Call",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 2,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                    },
                  )
                : ListView.builder(
                    itemCount: workApi.workReceived.length,
                    itemBuilder: (context, i) {
                      return (User.data['userid'] == workApi.workSent[i].userid)
                          ? Container()
                          : Container(
                              margin: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20),
                              height: h / 2.5,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
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
                                        border: Border.all(
                                            color: AppColors.appColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        image: DecorationImage(
                                          image: NetworkImage(webp +
                                              workApi
                                                  .workReceived[i].selfiFile),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          right: 10,
                                          left: 10),
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            workApi.workReceived[i].fullname,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          Text(
                                            workApi.workReceived[i].category,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          Text(
                                            workApi.workReceived[i]
                                                .organizationName,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          Text(
                                            workApi.workReceived[i].address,
                                            style: const TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          const Text(
                                            'User rating',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating: double.parse(workApi
                                                .workReceived[i].userAvgRating),
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 10,
                                            itemSize: 12,
                                            ignoreGestures: true,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.5),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                          Divider(
                                            color: AppColors.appColor
                                                .withOpacity(0.5),
                                          ),
                                          const Text(
                                            'Provider rating',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          RatingBar.builder(
                                            initialRating: double.parse(workApi
                                                .workReceived[i]
                                                .providerAvgRating),
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 10,
                                            itemSize: 12,
                                            ignoreGestures: true,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.5),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
