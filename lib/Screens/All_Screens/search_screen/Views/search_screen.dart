import 'dart:developer';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:ees121/Screens/All_Screens/search_screen/Model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../Colors/colors.dart';
import '../provider/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    log('Re Built Ui');
    final provider = Provider.of<CategoryProvider>(context);
    provider.getDataFromApi();

    // final categoryProvider = Provider.of<CategoryProvider>(context);
    //
    return Scaffold(
      body: provider.isLoading
          ? getLoadingUI()
          : provider.error.isNotEmpty
              ? getErrorUI(provider.error)
              : getBodyUI(provider.catrgoryApi),
    );
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
    // return ListView.builder(
    //   itemCount: catrgoryApi.data.length,
    //   itemBuilder: (context, index) => ListTile(
    //     title: Text(catrgoryApi.data[index].name),
    //   ),
    // );
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Text(
            'What service are you looking for?',
            style: TextStyle(
              fontSize: 28,
              letterSpacing: 2,
            ),
          ),
          Expanded(
            child: AnimSearchBar(
              width: double.infinity,
              textController: TextEditingController(),
              onSuffixTap: null,
              onSubmitted: (String searchVal) {},
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: catrgoryApi.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 7,
                  margin: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.only(
                    top: 5,
                    right: 5,
                    left: 5,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue, // Change this color if needed
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          'lib/Screens/All_Screens/Assets/services/plumber.jpg'),
                      const SizedBox(height: 8),
                      Text(
                        catrgoryApi.data[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
