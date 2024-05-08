import 'package:EES121/Screens/All_Screens/search_screen/Category_two/category_two_model.dart';
import 'package:EES121/Screens/drawer_options/work_screen/components/work_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../Colors/colors.dart';
import '../../../../../Global/globalUser.dart';
import '../../../All_Screens/search_screen/Category_two/Helper/contact_helper.dart';

class WorkDetail extends StatefulWidget {
  const WorkDetail({super.key});

  @override
  State<WorkDetail> createState() => _WorkDetailState();
}

class _WorkDetailState extends State<WorkDetail> {
  @override
  Widget build(BuildContext context) {
    WorkDetailUser user =
        ModalRoute.of(context)!.settings.arguments as WorkDetailUser;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String webp = "https://ees121.com/panel/files/";
    DateTime dateTime = user.workRequestDate;
    String date =
        "${dateTime.day > 10 ? "" : "0"}${dateTime.day}/${dateTime.month > 10 ? "" : "0"}${dateTime.month}/${dateTime.year}";
    String time =
        "${(dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour).abs()}:${dateTime.minute < 10 ? "0" : ""}${dateTime.minute} ${dateTime.hour >= 12 ? "PM" : "AM"}";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.fullName,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),
      body: Visibility(
        visible: (user.userId == User.data['userid']) ? false : true,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    height: h / 2,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(webp + user.selfieFile),
                      ),
                      // boxShadow: [
                      //   const BoxShadow(
                      //     color: Colors.grey,
                      //     blurRadius: 10,
                      //   )
                      // ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(),
                ),
              ],
            ),
            Container(
              height: h / 2.3,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Date :- ",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        "${date}",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Time :- ",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        "${time}",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Designation :- ",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        user.designation,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Organization Name :- ",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        user.designation,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Category :- ",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Text(
                        user.category,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Services :- ",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),

                      Text(
                        user.serviceDetails,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      // Text(
                      //   (user.isAvailable == 1)
                      //       ? "Available"
                      //       : "Not Available",
                      // ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Provider Rating :- ",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: user.providerAvgRating,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 10,
                        itemSize: 10,
                        ignoreGestures: true,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.5),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                  const Divider(),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "${user.currentAddress} ${user.currentCity} ${user.currentState} ${user.currentPincode}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: (user.callRequestStatus == "open")
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          (user.callRequestStatus == "open")
                              ? launchUrl(
                                  Uri(
                                    scheme: "tel",
                                    path: user.mobileNo,
                                  ),
                                )
                              : showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    alignment: Alignment.center,
                                    title: const Text("Are you sure ?"),
                                    content:
                                        const Text("I need your service !!"),
                                    actionsAlignment: MainAxisAlignment.center,
                                    actionsPadding: const EdgeInsets.all(10),
                                    actions: [
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('cancel'),
                                      ),
                                      OutlinedButton(
                                        onPressed: () {
                                          ContactHelper.contactHelper
                                              .contactProvider(
                                                  User.data['userid'],
                                                  user.userId);
                                          Navigator.pushNamed(context, 'work');
                                        },
                                        child: const Text('conform'),
                                      ),
                                    ],
                                  ),
                                );
                        },
                        child: (user.callRequestStatus == "open")
                            ? const Text("call")
                            : Text("Request"),
                      ),
                      (user.callRequestStatus != "open")
                          ? Container()
                          : OutlinedButton(
                              onPressed: () {},
                              child: const Text("complete"),
                            ),
                      (user.callRequestStatus != "open")
                          ? Container()
                          : OutlinedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    alignment: Alignment.center,
                                    content: Container(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: [
                                          const Text(""),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: const Text("cancel"),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
