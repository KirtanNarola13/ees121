import 'package:EES121/Screens/drawer_options/work_screen/model/work_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<WorkProvider>(
      builder: (context, provider, _) {
        if (provider.state == CategoryProviderState.Error) {
          return getErrorUI(provider.error);
        } else if (provider.state == CategoryProviderState.Loaded) {
          return getUi(provider.workApi, context);
        } else {
          return getLoadingUI();
        }
      },
    ));
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
  String webp = "https://api2.appsolution.online/files/";
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
                      margin: const EdgeInsets.all(10),
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
                    return Container(
                      alignment: Alignment.center,
                      height: h / 13,
                      margin: const EdgeInsets.all(10),
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
      Expanded(
        flex: 9,
        child: Consumer<WorkProvider>(
          builder: (context, workProvider, child) {
            return (workProvider.work?.isSent == true)
                ? SingleChildScrollView(
                    child: Column(
                      children: User.workSent.map((e) {
                        return Container(
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
                                    border:
                                        Border.all(color: AppColors.appColor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(webp + e['selfifile']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 10, left: 10),
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(e['fullname']),
                                      Divider(
                                        color:
                                            AppColors.appColor.withOpacity(0.5),
                                      ),
                                      Text(e['category']),
                                      Divider(
                                        color:
                                            AppColors.appColor.withOpacity(0.5),
                                      ),
                                      Text(e['organization_name']),
                                      Divider(
                                        color:
                                            AppColors.appColor.withOpacity(0.5),
                                      ),
                                      Text('User rating'),
                                      RatingBar.builder(
                                        initialRating:
                                            double.parse(e['user_rating']),
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 10,
                                        itemSize: 14,
                                        ignoreGestures: true,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1.5),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      Divider(
                                        color:
                                            AppColors.appColor.withOpacity(0.5),
                                      ),
                                      Text('Provider rating'),
                                      RatingBar.builder(
                                        initialRating:
                                            double.parse(e['provider_rating']),
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 10,
                                        itemSize: 14,
                                        ignoreGestures: true,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1.5),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      Divider(
                                        color:
                                            AppColors.appColor.withOpacity(0.5),
                                      ),
                                      GestureDetector(
                                        onTap: () async {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: w / 4.5,
                                          height: h / 25,
                                          decoration: BoxDecoration(
                                              color: AppColors.appColor
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
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
                      }).toList(),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: User.workReceived.map((e) {
                        return Container(
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
                                    border:
                                        Border.all(color: AppColors.appColor),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(webp + e['selfifile']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 10, left: 10),
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(e['fullname']),
                                      Divider(
                                        color:
                                            AppColors.appColor.withOpacity(0.5),
                                      ),
                                      Text(e['category']),
                                      Divider(
                                        color:
                                            AppColors.appColor.withOpacity(0.5),
                                      ),
                                      Text(e['organization_name']),
                                      Divider(
                                        color:
                                            AppColors.appColor.withOpacity(0.5),
                                      ),
                                      Text('User rating'),
                                      RatingBar.builder(
                                        initialRating:
                                            double.parse(e['user_rating']),
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 10,
                                        itemSize: 14,
                                        ignoreGestures: true,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1.5),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      Divider(
                                        color:
                                            AppColors.appColor.withOpacity(0.5),
                                      ),
                                      Text('Provider rating'),
                                      RatingBar.builder(
                                        initialRating:
                                            double.parse(e['provider_rating']),
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 10,
                                        itemSize: 14,
                                        ignoreGestures: true,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 1.5),
                                        itemBuilder: (context, _) => const Icon(
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
                      }).toList(),
                    ),
                  );
          },
        ),
      ),
    ],
  );
}
