import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/MainScreen/Setting/settingscreen.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 66,
            width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(left: 16),
                  child:  UiHelper.CustomText(
                      text: "Communities",
                      fontsize: 23,
                      fontweight: FontWeight.w400),),

                  Row(
                    children: [
                      Icon(
                        Icons.qr_code_scanner_outlined,
                        size: 26,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 26,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      PopupMenuButton(
                        onSelected: (selected){
                          if (selected == 1){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
                          }
                        },
                        elevation: 5,
                        iconSize: 28,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: Text(
                                "Settings",style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),)
                          ),
                        ],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16), // Add rounded corners
                        ),
                        offset: Offset(0, 48),
                      ),
                    ],
                  ),

                ],
              ),
            ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    SizedBox(width: 15),

                    Container(
                      width: 60,
                      height: 60,
                      child: Stack(
                        children: [
                          // Group icon at the center
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: themeChanger.themeMode == ThemeMode.dark
                                  ? Colors.grey.shade700 // Dark mode color
                                  : themeChanger.themeMode == ThemeMode.light
                                  ? Colors.grey.shade400 // Light mode color
                                  : (MediaQuery.of(context).platformBrightness == Brightness.dark
                                  ? Colors.grey.shade700 // Dark mode color
                                  : Colors.grey.shade400),
                              // themeChanger.themeMode == ThemeMode.dark
                              //     ?  // Dark mode color
                              //     : Colors.grey.shade400, // Background color
                              borderRadius: BorderRadius.circular(12), // Optional rounded corners
                            ),
                            child: Center(
                              child: Icon(
                                Icons.groups_sharp, // Group icon
                                size: 40,
                                color: themeChanger.themeMode == ThemeMode.dark
                                    ? Colors.white54  // Dark mode color
                                    : themeChanger.themeMode == ThemeMode.light
                                    ? Colors.white // Light mode color
                                    : (MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? Colors.white54  // System dark mode color
                                    : Colors.white),
                                // themeChanger.themeMode == ThemeMode.dark
                                //     ? Colors.white54 // Dark mode color
                                //     : Colors.white,
                              ),
                            ),
                          ),
                          // Edit icon at the bottom right
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: themeChanger.themeMode == ThemeMode.dark
                                    ? Color(0XFF101D25) // Dark mode color
                                    : themeChanger.themeMode == ThemeMode.light
                                    ? Colors.white // Light mode color
                                    : (MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ? Color(0XFF101D25) // System dark mode color
                                    : Colors.white),
                                // themeChanger.themeMode == ThemeMode.dark
                                //     ? Color(0XFF101D25) // Dark mode color
                                //     : Colors.white,
                                // Background for edit icon
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add_circle, // Edit icon
                                size: 28,
                                color: Color(0XFF25D366),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    UiHelper.CustomText(
                        text: "New Community",
                        fontsize: 18,
                    fontweight: FontWeight.w600),
                  ],
                ),
              ),
            Divider(height: 1),
            Container(
              height: 7,
              color:themeChanger.themeMode == ThemeMode.dark
                  ? Colors.black38 // Dark mode color
                  : themeChanger.themeMode == ThemeMode.light
                  ? Colors.grey.shade100 // Light mode color
                  : (MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Colors.black38 // System dark mode color
                  : Colors.grey.shade100),
              // themeChanger.themeMode == ThemeMode.dark
              //     ? Colors.black45 // Dark mode color
              //     : Colors.grey.shade100,
            )
        ],),
      ),
    );
  }
}
