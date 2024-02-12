import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../drawer_options/work_screen/Provider/work_provider.dart';
import '../Global/category_global.dart';
import 'Helper/contact_helper.dart';
import 'categoryTwoProvider.dart';
import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';

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
            return ListView.builder(
              itemCount: provider.categoryTwoApi.data.length,
              itemBuilder: (context, index) {
                final user = provider.categoryTwoApi.data[index];
                int workSentIndex = index < User.workSent.length ? index : -1;
                bool alreadyContacted = workSentIndex != -1 &&
                    User.workSent[workSentIndex]['userid'] == user.userid;

                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      enableDrag: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: h / 3,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: w / 10,
                                  child: Image(
                                    image: NetworkImage(
                                      CategoryTwoProvider.imgPoint +
                                          user.selfifile,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w / 30,
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Full Name',
                                        style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: 2,
                                        )),
                                    Text(
                                      user.fullname,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Divider(
                                      color:
                                          AppColors.appColor.withOpacity(0.5),
                                    ),
                                    const Text(
                                      'Service',
                                      style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    Text(
                                      user.category,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Divider(
                                      color:
                                          AppColors.appColor.withOpacity(0.5),
                                    ),
                                    const Text(
                                      'Company',
                                      style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    Text(
                                      user.company,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Divider(
                                      color:
                                          AppColors.appColor.withOpacity(0.5),
                                    ),
                                    (workSentIndex != -1 &&
                                            User.workSent[workSentIndex]
                                                    ['userid'] ==
                                                user.userid)
                                        ? Text("You already contacted")
                                        : GestureDetector(
                                            onTap: () async {
                                              await ContactHelper.contactHelper
                                                  .contactProvider(
                                                      User.data['userid'],
                                                      user.userid);
                                              Navigator.pop(context);
                                              CherryToast.success(
                                                title: Text(
                                                  "Requested Successfully",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.appColor),
                                                ),
                                              ).show(context);

                                              // After the contact request, fetch the updated data
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: w / 4,
                                              height: h / 20,
                                              decoration: BoxDecoration(
                                                  color: AppColors.appColor
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
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
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: h / 3,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(color: AppColors.appColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              border: Border(
                                  right: BorderSide(color: AppColors.appColor)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  CategoryTwoProvider.imgPoint + user.selfifile,
                                ),
                                fit: BoxFit.cover,
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
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(
                                  color: AppColors.appColor.withOpacity(
                                    0.5,
                                  ),
                                ),
                                Text(
                                  user.category,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                Divider(
                                  color: AppColors.appColor.withOpacity(
                                    0.5,
                                  ),
                                ),
                                Text(
                                  user.company,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
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
                                      itemSize: 14,
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
                                Divider(
                                  color: AppColors.appColor.withOpacity(0.5),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'User Rating',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    RatingBar.builder(
                                      initialRating:
                                          double.parse(user.userAverageRating),
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
