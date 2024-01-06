import 'dart:convert';
import 'dart:developer';
import 'package:ees121/Screens/All_Screens/category_detail_screen/Model/category_detail_model.dart';
import 'package:ees121/Screens/All_Screens/search_screen/Category_two/categoryTwoProvider.dart';
import 'package:ees121/Screens/All_Screens/search_screen/Category_two/category_two_model.dart';
import 'package:ees121/Screens/All_Screens/search_screen/Global/category_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../../../../Colors/colors.dart';
import '../../../../Global/globalUser.dart';
import '../../category_detail_screen/Global/category_detail_screen_global.dart';
import '../Model/search_model.dart';
import '../provider/search_provider.dart';

class Categorytwo extends StatefulWidget {
  const Categorytwo({Key? key}) : super(key: key);

  @override
  State<Categorytwo> createState() => _CategorytwoState();
}

class _CategorytwoState extends State<Categorytwo> {
  @override
  Widget build(BuildContext context) {
    //
    //
    final provider =
        Provider.of<CategoryTwoProvider>(context).getCategoryTwoFromApi();
    //

//
    log('Re Built Ui');
    final index = ModalRoute.of(context)?.settings.arguments as int;
    Name.name =
        Provider.of<CategoryProvider>(context).categoryApi.data[index].name;
    return Scaffold(body: Consumer<CategoryTwoProvider>(
      builder: (context, provider, _) {
        if (provider.state == CategoryTwoProviderState.Error) {
          return getErrorUI(provider.error);
        } else if (provider.state == CategoryTwoProviderState.Loaded) {
          return getBodyUI(provider.categoryTwoApi);
        } else {
          return getLoadingUI();
        }
      },
    ));
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

  Widget getBodyUI(CategoryTwoApi categoryTwoApi) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          ListView.builder(
            itemCount: categoryTwoApi.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                          border: Border.all(color: AppColors.appColor),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          // image: DecorationImage(
                          //   image: NetworkImage(categoryTwoApi.data[index]),
                          //   fit: BoxFit.cover,
                          // ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(e['name']),
                            Divider(
                              color: AppColors.appColor.withOpacity(0.5),
                            ),
                            // Text(e['category']),
                            Divider(
                              color: AppColors.appColor.withOpacity(0.5),
                            ),
                            // Text(e['company']),
                            Divider(
                              color: AppColors.appColor.withOpacity(0.5),
                            ),
                            // Text(e['address']),
                            Divider(
                              color: AppColors.appColor.withOpacity(0.5),
                            ),
                            Text('⭐⭐⭐⭐⭐'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  // Widget getBodyUI(CategoryTwoApi categoryTwoApi) {
  //   return Container(
  //     margin: const EdgeInsets.only(left: 10),
  //     child: CustomScrollView(
  //       slivers: [
  //         SliverToBoxAdapter(
  //           child: SizedBox(
  //             height: MediaQuery.of(context).size.height / 15,
  //           ),
  //         ),
  //         const SliverToBoxAdapter(
  //           child: Text(
  //             'What service are you looking for?',
  //             style: TextStyle(
  //               fontSize: 28,
  //               letterSpacing: 2,
  //             ),
  //           ),
  //         ),
  //         const SliverToBoxAdapter(
  //           child: SizedBox(
  //             height: 20,
  //           ),
  //         ),
  //         SliverGrid(
  //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2, // Adjust as needed
  //             crossAxisSpacing: 8.0,
  //             mainAxisSpacing: 8.0,
  //             childAspectRatio: 0.8, // Adjust as needed
  //           ),
  //           delegate: SliverChildBuilderDelegate(
  //             (BuildContext context, int index) {
  //               return GestureDetector(
  //                 onTap: () {
  //                   // launchUrl(Uri.parse('https://ees121.com/login'),
  //                   //     mode: LaunchMode.inAppWebView);
  //                   // CategoryProviderListModel(
  //                   //     categoryname: catrgoryApi.data[index].name);
  //                   // categoryName = catrgoryApi.data[index].name;
  //                   Navigator.pushNamed(context, 'category_two',
  //                       arguments: index);
  //                 },
  //                 child: Container(
  //                   margin: const EdgeInsets.all(8.0),
  //                   decoration: BoxDecoration(
  //                     border: Border.all(
  //                       color:
  //                           AppColors.appColor, // Change this color if needed
  //                       width: 1,
  //                     ),
  //                     borderRadius: const BorderRadius.all(
  //                       Radius.circular(15),
  //                     ),
  //                   ),
  //                   child: SingleChildScrollView(
  //                     child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Image.network(
  //                           CategoryTwoProvider.imgPoint +
  //                               categoryTwoApi.data[index].selfifile,
  //                         ),
  //                         const SizedBox(height: 8),
  //                         Text(
  //                           categoryTwoApi.data[index].fullname,
  //                           textAlign: TextAlign.center,
  //                           style: const TextStyle(fontSize: 10),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             },
  //             childCount: categoryTwoApi.data.length,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
