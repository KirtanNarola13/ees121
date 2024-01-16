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
  final _searchKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //
    TextEditingController searchController = TextEditingController();
    //
    Provider.of<CategoryProvider>(context).getCategoryFromApi();
    //

//

    return Scaffold(body: Consumer<CategoryProvider>(
      builder: (context, provider, _) {
        if (provider.state == CategoryProviderState.Error) {
          return getErrorUI(provider.error);
        } else if (provider.state == CategoryProviderState.Loaded) {
          return getBodyUI(provider.categoryApi, searchController);
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

  Widget getBodyUI(
      CategoryApi catrgoryApi, TextEditingController searchController) {
    List filteredItems = catrgoryApi.data
        .where((item) =>
            item.name.toLowerCase() == searchController.text.toLowerCase())
        .toList();

    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
          ),
          SliverToBoxAdapter(
            child: TextFormField(
              onChanged: (String? val) {
                searchController.text = val!;
              },
              controller: searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Search category",
                labelStyle: TextStyle(
                  color: AppColors.appColor,
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                    width: 5,
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(
                    Icons.search,
                    color: AppColors.appColor,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 30,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (filteredItems.isNotEmpty) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'category_two',
                        arguments: Provider.of<CategoryProvider>(context,
                                listen: false)
                            .categoryApi
                            .data[index]
                            .name,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.appColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    CategoryProvider.imgPoint +
                                        filteredItems[index].img,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                filteredItems[index].name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container(); // Empty container when no match is found
                }
              },
              childCount: filteredItems.length,
            ),
          ),
        ],
      ),
    );
  }
}
