import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';
import '../../search_screen/Category_two/Helper/contact_helper.dart';
import '../helpers/offer-helper.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    String providerId = ModalRoute.of(context)?.settings.arguments as String;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String webp = "https://ees121.com/panel/files/";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offer"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder(
        future: OfferHelper.offerHelper.getDetail(providerId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            // Data is available, display it
            final offerData = snapshot.data;
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(),
                    ),
                    Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Name :- "),
                                  Text(offerData!.fullName),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Organization Name :- "),
                                  Text(offerData.organizationName),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Category :- "),
                                  Text(offerData.category),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Available For Work :- "),
                                  Text(
                                    (offerData.isAvailable == 1)
                                        ? "Available"
                                        : "Not Available",
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Provider Rating :- "),
                                  RatingBar.builder(
                                    initialRating: double.parse(
                                        offerData.providerAverageRating),
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
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Offer Date :- "),
                                  Text(offerData!.offerDate),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Offer Validity :- "),
                                  Text("${offerData!.offerValidity} Days"),
                                ],
                              ),
                              const Divider(),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      alignment: Alignment.center,
                                      title: const Text("Are you sure ?"),
                                      content:
                                          const Text("I need your service !!"),
                                      actionsAlignment:
                                          MainAxisAlignment.center,
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
                                                    offerData.userId);
                                            Navigator.pushNamed(
                                                context, 'work');
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
                                      color:
                                          AppColors.appColor.withOpacity(0.5),
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
                        )),
                  ],
                ),
                Container(
                  height: h / 2.2,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(webp + offerData!.offerFile),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                        )
                      ]),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("No data available"),
            );
          }
        },
      ),
    );
  }
}
