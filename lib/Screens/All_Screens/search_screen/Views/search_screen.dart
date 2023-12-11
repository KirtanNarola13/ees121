import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../Colors/colors.dart';
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
    log('Re Built Ui');
    final provider = Provider.of<CategoryProvider>(context);
    provider.getCategoryFromApi();

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
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'What service are you looking for?',
              style: TextStyle(
                fontSize: 28,
                letterSpacing: 2,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Adjust as needed
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8, // Adjust as needed
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.only(
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
                        'lib/Screens/All_Screens/Assets/services/plumber.jpg',
                      ),
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
              childCount: catrgoryApi.data.length,
            ),
          ),
        ],
      ),
    );
  }
}
