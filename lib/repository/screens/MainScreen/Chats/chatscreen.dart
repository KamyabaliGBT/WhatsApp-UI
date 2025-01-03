import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/MainScreen/Chats/Chat/Chatscreen.dart';
import 'package:whatsapp/repository/screens/MainScreen/New_add/new_add.dart';
import 'package:whatsapp/repository/screens/MainScreen/Setting/settingscreen.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  TextEditingController SearchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              WpAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 48,
                        margin:
                            EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                          color:
                          themeChanger.themeMode == ThemeMode.dark
                              ? Colors.white10  // Dark mode color
                              : themeChanger.themeMode == ThemeMode.light
                              ? Colors.grey.shade200 // Light mode color
                              : (MediaQuery.of(context).platformBrightness == Brightness.dark
                              ? Colors.white10  // System dark mode color
                              : Colors.grey.shade200),
                          // themeChanger.themeMode == ThemeMode.dark
                          //     ? Colors.white10 // Dark mode color
                          //     : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 20),
                          child: TextField(
                            controller: SearchController,
                            decoration: InputDecoration(
                                hintText: "Ask Meta AI or Search",
                                hintStyle: TextStyle(fontSize: 17),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      ChatProfile(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewAddScreen()));
        },
        backgroundColor: Color(0XFF25D366),
        child: Center(
          child: Icon(
            Icons.add_comment_rounded,
            size: 30,
            color:themeChanger.themeMode == ThemeMode.dark
                ? Color(0XFF101D25) // Dark mode color
                : themeChanger.themeMode == ThemeMode.light
                ? Colors.white // Light mode color
                : (MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Color(0XFF101D25) // System dark mode color
                : Colors.white),
            // themeChanger.themeMode == ThemeMode.dark
            //     ? Color(0XFF101D25) // Dark mode color
            //     : Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

// WhatsApp Appbar
class WpAppBar extends StatelessWidget {
  const WpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Container(
      height: 66,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: UiHelper.CustomText(
                text: "WhatsApp",
                color: themeChanger.themeMode == ThemeMode.dark
                    ? Colors.white // Dark mode color
                    : themeChanger.themeMode == ThemeMode.light
                    ? Color(0XFF25D366) // Light mode color
                    : (MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Colors.white // System dark mode color
                    : Color(0XFF25D366)), //

                // themeChanger.themeMode == ThemeMode.dark
                //     ? Colors.white // Dark mode color
                //     : Color(0XFF25D366),
                fontsize: 24,
                fontweight: FontWeight.w600),
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
                width: 5,
              ),
              PopupMenuButton(
                onSelected: (selected) {
                  if (selected == 6) {
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
                      "New group",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                      value: 2,
                      child: Text(
                        "New broadcast",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  PopupMenuItem(
                      value: 3,
                      child: Text(
                        "Link devices",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  PopupMenuItem(
                      value: 4,
                      child: Text(
                        "Starred messages",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  PopupMenuItem(
                      value: 5,
                      child: Text(
                        "Payments",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  PopupMenuItem(
                      value: 6,
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
    );
  }
}

// Chats Profile
class ChatProfile extends StatefulWidget {
  const ChatProfile({super.key});

  @override
  State<ChatProfile> createState() => _ChatProfileState();
}

class _ChatProfileState extends State<ChatProfile> {
  List profiles = [
    "assets/images/profile1.jpg",
    "assets/images/profile2.jpg",
    "assets/images/profile3.jpg",
    "assets/images/profile4.jpg",
    "assets/images/profile5.jpg",
    "assets/images/profile6.jpg",
    "assets/images/profile7.jpg",
    "assets/images/profile8.jpg",
    "assets/images/profile9.jpg",
    "assets/images/profile10.jpg",
    "assets/images/profile11.jpg"
  ];

  List names = [
    "Abidali",
    "Mrs.Patel",
    "Vipulbhai",
    "Priti",
    "Sakirali ",
    "priya",
    "Mrs.chaudhary",
    "Ikramali",
    "Darji Archy",
    "Hardikbhai",
    "Shabbirali",
  ];

  List msgs = [
    "Hi,How are you?",
    "Where are you?",
    "Good morning.",
    "Hello dear,All right?",
    "It is nice to meet you",
    "I want to meet you.",
    "Good Afternoon.",
    "Hello sir,All right?",
    "wSalam",
    "Khuda Hafiz",
    "Good Bye",
  ];

  List msgTiming = [
    "10:15 am",
    "Today",
    "9:16 am",
    "Today",
    "11:26 pm",
    "3:45 am",
    "2:25 am",
    "Yesterday",
    "Yesterday",
    "21/12/2024",
    "19/12/2024",
  ];

  List msgRead = [
    true,
    false,
    false,
    true,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
  ];
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return ListView.builder(
      itemCount: profiles.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
            },
            leading: CircleAvatar(
              maxRadius: 24,
              backgroundImage: AssetImage(
                profiles[index],
              ),
            ),
            title: UiHelper.CustomText(
                text: names[index], fontsize: 17, fontweight: FontWeight.w500),
            subtitle: Text(
              msgs[index],
              style: TextStyle(color: Color(0XFF636F75)),
            ),
            trailing: msgRead[index]
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: UiHelper.CustomText(
                          text: msgTiming[index],
                          fontsize: 12,
                          fontweight: FontWeight.w700,
                          color: Color(0XFF25D366),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Color(0XFF25D366),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: UiHelper.CustomText(
                          text: "5",
                          fontsize: 11,
                          fontweight: FontWeight.w800,
                          color: themeChanger.themeMode == ThemeMode.dark
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
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: UiHelper.CustomText(
                      text: msgTiming[index],
                      fontsize: 12,
                      color: themeChanger.themeMode == ThemeMode.dark
                          ? Colors.white70 // Dark mode color
                          : themeChanger.themeMode == ThemeMode.light
                          ? Colors.black38 // Light mode color
                          : (MediaQuery.of(context).platformBrightness == Brightness.dark
                          ? Colors.white70 // System dark mode color
                          : Colors.black38),
                      // themeChanger.themeMode == ThemeMode.dark
                      //     ? Colors.white70 // Dark mode color
                      //     : Colors.black38,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
