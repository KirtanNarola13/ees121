import 'package:ees121/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    var contact = 7778854551;
    var email = 'kirtannarola1209@gmail.com';
    // Check if arguments are not null and of the expected type
    Map<String, dynamic> data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    // If arguments are null or not of the expected type, handle the situation accordingly
    if (data == null) {
      // Handle the null or unexpected data situation
      return Scaffold(
        body: Center(
          child: Text("Error: Invalid data"),
        ),
      );
    }

    // Continue with the normal build process using the valid data
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.keyboard_backspace,
            color: AppColors.appColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            color: AppColors.appColor,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    '${data['thumbnail']}',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: AppColors.appColor, width: 1),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                SizedBox(
                  height: h / 50,
                ),
                Text(
                  "John Deo",
                  style: TextStyle(
                    fontSize: 32,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: h / 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          launchUrl(
                            Uri(
                              scheme: 'tel',
                              path: '$contact',
                            ),
                          );
                        },
                        child: Container(
                          height: h / 12,
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.appColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                'lib/Screens/All_Screens/detail_screen/Assets/telephone.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          launchUrl(
                            Uri(
                              scheme: 'sms',
                              path: '$contact',
                            ),
                          );
                        },
                        child: Container(
                          height: h / 12,
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.appColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                'lib/Screens/All_Screens/detail_screen/Assets/sms.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          launchUrl(
                            Uri(
                              scheme: 'mailto',
                              path: '$email',
                            ),
                          );
                        },
                        child: Container(
                          height: h / 12,
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.appColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                'lib/Screens/All_Screens/detail_screen/Assets/mail.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse('https://wa.me/+917778854551'),
                              mode: LaunchMode.externalApplication);
                        },
                        child: Container(
                          height: h / 12,
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.appColor,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Image(
                              image: AssetImage(
                                'lib/Screens/All_Screens/detail_screen/Assets/whatsapp.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
