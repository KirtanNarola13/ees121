import 'dart:convert';
import 'dart:developer';
import 'package:ees121/Screens/All_Screens/category_detail_screen/Model/category_detail_model.dart';
import 'package:ees121/Screens/All_Screens/search_screen/Category_two/categoryTwoProvider.dart';
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

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    //

    //
    Provider.of<CategoryProvider>(context).getCategoryFromApi();
    //

//
    log('Re Built Ui');
    return Scaffold(body: Consumer<CategoryProvider>(
      builder: (context, provider, _) {
        if (provider.state == CategoryProviderState.Error) {
          return getErrorUI(provider.error);
        } else if (provider.state == CategoryProviderState.Loaded) {
          return getBodyUI(provider.categoryApi);
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

  Widget getBodyUI(CategoryApi catrgoryApi) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              'What service are you looking for?',
              style: TextStyle(
                fontSize: 28,
                letterSpacing: 2,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Adjust as needed
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8, // Adjust as needed
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // launchUrl(Uri.parse('https://ees121.com/login'),
                    //     mode: LaunchMode.inAppWebView);
                    // CategoryProviderListModel(
                    //     categoryname: catrgoryApi.data[index].name);
                    // categoryName = catrgoryApi.data[index].name;
                    Navigator.pushNamed(context, 'category_two',
                        arguments: index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.only(
                      top: 5,
                      right: 5,
                      left: 5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:
                            AppColors.appColor, // Change this color if needed
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          CategoryProvider.imgPoint +
                              catrgoryApi.data[index].img,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          catrgoryApi.data[index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: catrgoryApi.data.length,
            ),
          ),
        ],
      ),
    );
  }
}
