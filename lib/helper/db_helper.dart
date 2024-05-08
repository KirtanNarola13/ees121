import 'dart:convert';
import 'dart:developer';

import 'package:EES121/Screens/All_Screens/search_screen/Model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

class DBHelper {
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  Database? db;
  String tableName = "EES121";
  String tableId = "id";
  String tableTitle = "title";
  String tableImage = "image";

  static const apiEndpoint = 'https://panel.ees121.com/api/category';
  static const imgPoint = 'https://ees121.com/panel/files/category/';

  Future<void> initDB() async {
    String dbLocation = await getDatabasesPath();
    String path = join(dbLocation, "ees.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        String query =
            "CREATE TABLE $tableName($tableId INTEGER PRIMARY KEY AUTOINCREMENT, $tableTitle TEXT NOT NULL, $tableImage TEXT);";
        await db.execute(query).then((value) {
          log("$tableName table Created Successfully 😎");
        }).onError((error, _) {
          log("Database error: $error");
        });
      },
    );
  }

  Future<List<CategoryModel>> insertCategory() async {
    await initDB();
    List<CategoryModel> insertedCategories =
        []; // List to store inserted categories
    try {
      http.Response response = await http.get(Uri.parse(apiEndpoint));
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        List<dynamic> categoriesData = decodedData['data'];

        for (var categoryData in categoriesData) {
          String categoryName = categoryData['name'];
          String imageUrl = imgPoint + categoryData['logofile'];

          try {
            await db!.insert(tableName, {
              tableTitle: categoryName,
              tableImage: imageUrl,
            });
            log("Inserted $categoryName & $imageUrl into $tableName.");
            // Create a CategoryModel object and add it to the list
            insertedCategories
                .add(CategoryModel(title: categoryName, img: imageUrl));
          } catch (e) {
            log("Error inserting $categoryName: $e");
          }
        }
      }
    } catch (e) {
      log("Error inserting data: $e");
    }
    return insertedCategories; // Return the list of inserted categories
  }

  Future<List<CategoryModel>> getCategory() async {
    await initDB(); // Wait for the database to be initialized
    String query = "SELECT * FROM $tableName;";
    List<Map<String, dynamic>> data = await db!.rawQuery(query);
    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }

  Future<List<CategoryModel>> searchCategory({required String title}) async {
    await initDB();
    String query =
        "SELECT DISTINCT $tableTitle, $tableImage FROM $tableName WHERE $tableTitle LIKE '%$title%'";

    List<Map<String, dynamic>> data = await db!.rawQuery(query);
    log(data.toString());
    return data
        .map((e) => CategoryModel.fromJson(e))
        .where((element) => element.title != null && element.img != null)
        .toList(); // Add a filter to skip null values
  }
}
