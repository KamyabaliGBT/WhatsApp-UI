import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/MainScreen/Setting/settingscreen.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

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
              // color: Color(0XFF101D25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: UiHelper.CustomText(
                        text: "Calls",
                        fontsize: 24,
                        fontweight: FontWeight.w500),
                  ),
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
                        width: 20,
                      ),
                      Icon(
                        Icons.search_outlined,
                        size: 26,
                      ),
                      PopupMenuButton(
                        onSelected: (selected) {
                          if (selected == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingScreen()));
                          }
                        },
                        elevation: 5,
                        iconSize: 28,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: Text(
                                "Clear call log",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          PopupMenuItem(
                              value: 2,
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ],
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16), // Add rounded corners
                        ),
                        offset: Offset(0, 48),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: UiHelper.CustomText(
                          text: "Favourites",
                          fontsize: 16,
                          fontweight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // My Status
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0XFF25D366),
                            child: Icon(
                              Icons.favorite_outlined,
                              size: 20,
                              color:
                              themeChanger.themeMode == ThemeMode.dark
                                  ? Color(0XFF101D25) // Dark mode color
                                  : themeChanger.themeMode == ThemeMode.light
                                  ? Colors.white // Light mode color
                                  : (MediaQuery.of(context).platformBrightness == Brightness.dark
                                  ? Color(0XFF101D25) // System dark mode color
                                  : Colors.white),
                              // themeChanger.themeMode == ThemeMode.dark
                              //     ? Colors.black // Dark mode color
                              //     : Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: UiHelper.CustomText(
                                text: "Add favourite",
                                fontsize: 16,
                                fontweight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: UiHelper.CustomText(
                            text: "Recent",
                            fontsize: 18,
                            fontweight: FontWeight.w600),
                      ),
                    ),

                    SizedBox(height: 15),
                    CallHistory(),

                    SizedBox(height: 100),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0XFF25D366),
        child: Center(
          child: Icon(
            Icons.add_ic_call_rounded,
            size: 30,
            color:
            themeChanger.themeMode == ThemeMode.dark
                ? Color(0XFF101D25) // Dark mode color
                : themeChanger.themeMode == ThemeMode.light
                ? Colors.white
                :(MediaQuery.of(context).platformBrightness == Brightness.dark
                ?Color(0XFF101D25)
                :Colors.white),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

// CallHistory...
class CallHistory extends StatelessWidget {
  const CallHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo01.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "AbidAli PHP",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_made,
                                  size: 16, color: Color(0XFF25D366)),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "15 December, 9:43pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // SizedBox(width: 63),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo16.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Vipul Bhai",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_received,
                                  size: 16, color: Color(0XFF25D366)),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "11 December, 9:23pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo03.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "AheshanAli BDE",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_made,
                                  size: 16, color: Color(0XFF25D366)),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "5 December, 6:43pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo04.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Priti shing",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_received,
                                  size: 16, color: Color(0XFF25D366)),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "25 December, 3:37pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        // red
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo05.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Param Mitra",
                              fontsize: 18,
                              color: Colors.redAccent,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_received,
                                  size: 16, color: Colors.redAccent),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "29 November, 8:43pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo08.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Hardik",
                              fontsize: 18,
                              color: Colors.redAccent,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_received,
                                  size: 16, color: Colors.redAccent),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "25November, 2:43pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo09.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Jethalal",
                              fontsize: 18,
                              color: Colors.redAccent,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_received,
                                  size: 16, color: Colors.redAccent),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "18 November, 5:43pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.call,
                size: 28,
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo11.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Majurali",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_made,
                                  size: 16, color: Color(0XFF25D366)),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "10November, 2:23pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo12.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Aunali M",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_received,
                                  size: 16, color: Color(0XFF25D366)),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "09 November, 9:43pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo15.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Imdadali B",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_made,
                                  size: 16, color: Color(0XFF25D366)),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "6 November, 9:10am",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo14.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Abbasali",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_made,
                                  size: 16, color: Color(0XFF25D366)),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "8 November, 10:23am",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo13.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "M Rehan",
                              fontsize: 18,
                              color: Colors.redAccent,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_received,
                                  size: 16, color: Colors.redAccent),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "5 November, 11:13am",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.call,
                size: 28,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo2.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Zulfikarali",
                              fontsize: 18,
                              color: Colors.redAccent,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_received,
                                  size: 16, color: Colors.redAccent),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "28 october, 7:43am",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/photo17.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "ShabbirHusain",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_made,
                                  size: 16, color: Color(0XFF25D366)),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "28 october ,9:43pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 24,
                      backgroundImage: AssetImage("assets/images/profile1.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Taukirali",
                              fontsize: 18,
                              color: Colors.redAccent,
                              fontweight: FontWeight.w500),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(Icons.call_received,
                                  size: 16, color: Colors.redAccent),
                              SizedBox(
                                width: 5,
                              ),
                              UiHelper.CustomText(
                                  text: "25 october, 5:23pm",
                                  fontsize: 15,
                                  fontweight: FontWeight.w500,
                                  color: Color(0XFF636F75)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.videocam_outlined,
                size: 33,
              )
            ],
          ),
        ),
      ],
    );
  }
}
