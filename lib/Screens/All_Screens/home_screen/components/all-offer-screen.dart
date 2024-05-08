import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../Global/globalUser.dart';
import '../../search_screen/Category_two/Helper/contact_helper.dart';
import '../helpers/offer-helper.dart';

class AllOffer extends StatelessWidget {
  const AllOffer({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: User.offer.length,
        itemBuilder: (context, index) {
          // return Container();
          return FutureBuilder(
            future: OfferHelper.offerHelper
                .getDetail(User.offer[index]['provider']),
            builder: (context, snapshot) {
              final offerData = snapshot.data;
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          child: ExpansionTile(
                            dense: true,
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(webp + offerData!.selfieFile),
                            ),
                            title: Text(
                              offerData.fullName,
                              style: const TextStyle(fontSize: 14),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      offerData.serviceDetails,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Visibility(
                                      visible: (offerData.userId ==
                                              User.data['userid'])
                                          ? false
                                          : true,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          ContactHelper.contactHelper
                                              .contactProvider(
                                                  User.data['userid'],
                                                  offerData.userId);
                                          Navigator.pushNamed(context, 'work');
                                        },
                                        child: const Text("contact"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image(
                        image: NetworkImage(
                          webp + User.offer[index]['offer_file'],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}
