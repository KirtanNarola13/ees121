import 'package:EES121/Screens/All_Screens/search_screen/Category_two/category_two_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../Colors/colors.dart';
import '../../../../../Global/globalUser.dart';
import '../Helper/contact_helper.dart';

class ProviderDetail extends StatefulWidget {
  const ProviderDetail({super.key});

  @override
  State<ProviderDetail> createState() => _ProviderDetailState();
}

class _ProviderDetailState extends State<ProviderDetail> {
  @override
  Widget build(BuildContext context) {
    CategoryUser user =
        ModalRoute.of(context)!.settings.arguments as CategoryUser;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String webp = "https://ees121.com/panel/files/";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.fullname,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
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
                      image: NetworkImage(webp + user.selfifile),
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
                    const Text("Designation :- "),
                    Text(user.designation),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Organization Name :- "),
                    Text(user.company),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Category :- "),
                    Text(user.category),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Services :- "),

                    Text(user.services),
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
                    const Text("Provider Rating :- "),
                    RatingBar.builder(
                      initialRating: double.parse(user.providerAverageRating),
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 10,
                      itemSize: 14,
                      ignoreGestures: true,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.5),
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
                  child: Text(
                    user.cur_address,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        alignment: Alignment.center,
                        title: const Text("Are you sure ?"),
                        content: const Text("I need your service !!"),
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
                              ContactHelper.contactHelper.contactProvider(
                                  User.data['userid'], user.userid);
                              Navigator.pushNamed(context, 'work');
                            },
                            child: const Text('conform'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: w / 4,
                    height: h / 20,
                    decoration: BoxDecoration(
                        color: AppColors.appColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      "contact",
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
        ],
      ),
    );
  }
}
