import 'dart:developer';

import 'package:EES121/Screens/All_Screens/search_screen/Category_two/category_two_model.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';
import '../Global/category_global.dart';
import 'Helper/contact_helper.dart';
import 'categoryTwoProvider.dart';

class Categorytwo extends StatefulWidget {
  const Categorytwo({Key? key}) : super(key: key);

  @override
  State<Categorytwo> createState() => _CategorytwoState();
}

class _CategorytwoState extends State<Categorytwo> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    String selectedCategoryName =
        ModalRoute.of(context)!.settings.arguments as String;

    Name.name = selectedCategoryName;

    final categoryTwoProvider =
        Provider.of<CategoryTwoProvider>(context, listen: false);
    categoryTwoProvider.getCategoryTwoFromApi();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            Name.name = "";
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: AppColors.appColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          Name.name!,
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
      body: Consumer<CategoryTwoProvider>(
        builder: (context, provider, child) {
          print('Rebuilding UI with state: ${provider.state}');
          if (provider.state == CategoryTwoProviderState.Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.state == CategoryTwoProviderState.Error) {
            return const Center(
              child: Text(
                "There is no any service provider",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            );
          } else {
            List<CategoryUser> users = provider.categoryTwoApi.data;

            // Sort the users based on user average rating in descending order
            users.sort((a, b) => double.parse(b.providerAverageRating)
                .compareTo(double.parse(a.providerAverageRating)));

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('provider_detail', arguments: user);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    height: h / 5.5,
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
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    CategoryTwoProvider.imgPoint +
                                        user.selfifile,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  user.fullname,
                                  style: const TextStyle(fontSize: 12),
                                ),
                                Divider(
                                  color: AppColors.appColor.withOpacity(0.5),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Provider Rating',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    RatingBar.builder(
                                      initialRating: double.parse(
                                          user.providerAverageRating),
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 10,
                                      itemSize: 16,
                                      ignoreGestures: true,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.5),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (double value) {},
                                    ),
                                  ],
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
          }
        },
      ),
    );
  }
}
