import 'package:ees121/Colors/colors.dart';
import 'package:ees121/Screens/All_Screens/search_screen/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int data = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<CategoryProvider>(context, listen: false)
            .categoryApi
            .data[data]
            .name),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 15, right: 15),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.appColor),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      border:
                          Border(right: BorderSide(color: AppColors.appColor)),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://img.freepik.com/premium-photo/portrait-handsome-confident-arabian-indian-successful-businessman-entrepreneur-lawyer-formal-suit-sit-work-desk-with-laptop-modern-creative-office-looks-camera-smile-friendly_754108-887.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Yogesh Narola',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                        Divider(
                          color: AppColors.appColor.withOpacity(0.5),
                        ),
                        Text(
                          'Caategory',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Katargam',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                        Divider(
                          color: AppColors.appColor.withOpacity(0.5),
                        ),
                        Text(
                          'Rating',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          '⭐⭐⭐⭐⭐',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                        Divider(
                          color: AppColors.appColor.withOpacity(0.5),
                        ),
                        Text(
                          'Available',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.only(top: 20, left: 15, right: 15),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.appColor),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      border:
                          Border(right: BorderSide(color: AppColors.appColor)),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://st2.depositphotos.com/6672578/9743/i/450/depositphotos_97431594-stock-photo-businessman-smiling-confidently-at-camera.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Yogesh Narola',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                        Divider(
                          color: AppColors.appColor.withOpacity(0.5),
                        ),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Amroli',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                        Divider(
                          color: AppColors.appColor.withOpacity(0.5),
                        ),
                        Text(
                          'Rating',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          '⭐⭐⭐⭐⭐',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                          ),
                        ),
                        Divider(
                          color: AppColors.appColor.withOpacity(0.5),
                        ),
                        Text(
                          'Not Available',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
