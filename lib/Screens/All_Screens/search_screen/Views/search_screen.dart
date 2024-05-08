// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../Colors/colors.dart';
// import '../Model/search_model.dart';
// import '../provider/search_provider.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     //
//
//     //
//     Provider.of<CategoryProvider>(context).getCategoryFromApi();
//     //
//
// //
//
//     return Scaffold(body: Consumer<CategoryProvider>(
//       builder: (context, provider, _) {
//         if (provider.state == CategoryProviderState.Error) {
//           return getErrorUI(provider.error);
//         } else if (provider.state == CategoryProviderState.Loaded) {
//           return getBodyUI(provider.categoryApi);
//         } else {
//           return getLoadingUI();
//         }
//       },
//     ));
//   }
//
//   Widget getLoadingUI() {
//     return Center(
//       child: SpinKitCubeGrid(
//         color: AppColors.appColor,
//         size: 80.0,
//       ),
//     );
//   }
//
//   Widget getErrorUI(String error) {
//     return Center(
//       child: Text(
//         error,
//         style: const TextStyle(
//           color: Colors.red,
//           fontSize: 22,
//         ),
//       ),
//     );
//   }
//
//   Widget getBodyUI(CategoryApi catrgoryApi) {
//     return Container(
//       margin: const EdgeInsets.only(left: 10),
//       child: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height / 15,
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: Text(
//               'What service are you looking for?',
//               style: TextStyle(
//                 fontSize: 28,
//                 letterSpacing: 2,
//               ),
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(
//               height: 20,
//             ),
//           ),
//           SliverGrid(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3, // Adjust as needed
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//               childAspectRatio: 0.8, // Adjust as needed
//             ),
//             delegate: SliverChildBuilderDelegate(
//               (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Update the Name.name variable with the selected category name
//
//                     // Navigate to the detail screen
//                     Navigator.pushNamed(
//                       context,
//                       'category_two',
//                       arguments:
//                           Provider.of<CategoryProvider>(context, listen: false)
//                               .categoryApi
//                               .data[index]
//                               .name,
//                     );
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color:
//                             AppColors.appColor, // Change this color if needed
//                         width: 1,
//                       ),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(15),
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(15),
//                                 topRight: Radius.circular(15),
//                               ),
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                   CategoryProvider.imgPoint +
//                                       catrgoryApi.data[index].img,
//                                 ),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Center(
//                             child: Text(
//                               catrgoryApi.data[index].name,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(fontSize: 10),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               childCount: catrgoryApi.data.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:EES121/Screens/All_Screens/search_screen/Model/category_model.dart';
import 'package:EES121/Screens/All_Screens/search_screen/provider/search_from_db.dart';
import 'package:EES121/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Colors/colors.dart';
import '../provider/search_provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(searchCategory);
  }

  @override
  void dispose() {
    searchController.removeListener(searchCategory);
    searchController.dispose();
    super.dispose();
  }

  void searchCategory() {
    Provider.of<SearchDataBase>(context, listen: false)
        .searchMyCategory(title: searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SearchDataBase>(
        builder: (context, provider, child) {
          List<CategoryModel> filteredCategories = provider.myCategory;

          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "search category",
                      hintStyle: TextStyle(
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
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.search,
                          color: AppColors.appColor,
                        ),
                      ),
                    ),
                  ),
                ),
                (filteredCategories.isNotEmpty)
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              childAspectRatio: 0.8,
                            ),
                            itemCount: filteredCategories.length,
                            itemBuilder: (BuildContext context, int index) {
                              log("${filteredCategories[index].img}");
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    'category_two',
                                    arguments: filteredCategories[index].title,
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
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                filteredCategories[index].img,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            filteredCategories[index].title,
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    : Expanded(
                        child: FutureBuilder(
                          future: DBHelper.dbHelper.getCategory(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<CategoryModel>? categoryModel =
                                  snapshot.data;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8.0,
                                    mainAxisSpacing: 8.0,
                                    childAspectRatio: 0.8,
                                  ),
                                  itemCount: categoryModel?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    log("${categoryModel![index].img}");
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          'category_two',
                                          arguments: categoryModel[index].title,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15),
                                                  ),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      categoryModel![index].img,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  categoryModel![index].title,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
