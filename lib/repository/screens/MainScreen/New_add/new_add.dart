import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class NewAddScreen extends StatefulWidget {
  const NewAddScreen({super.key});

  @override
  State<NewAddScreen> createState() => _NewAddScreenState();
}

class _NewAddScreenState extends State<NewAddScreen> {
  List profiles = [
    "assets/images/mydp.jpg",
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
    "Mr.Nagalpara(You)",
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

  List about = [
    "Message yourself",
    "Hey there! I am using WhatsApp",
    "Available",
    "Busy",
    "Beautiful face is note important beautiful heart is important",
    "At work",
    "Accountant",
    "smile even if your heart is bleeding",
    "I love family",
    "Believe The God",
    "CEO & founder",
  ];
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 55,
              child: Row(
                children: [
                  SizedBox(width: 8),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                      )),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Select contact",
                        style: TextStyle(fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          right: 30,
                        ),
                        child: Text(
                          "286 contact",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 140),
                  Icon(
                    Icons.search_outlined,
                    size: 25,
                  ),
                  SizedBox(width: 18),
                  Icon(
                    Icons.more_vert_outlined,
                    size: 25,
                  )
                ],
              ),
            ),
            Divider(
              height: 1,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, left: 15),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0XFF25D366),
                            child: Icon(
                              Icons.group_add_rounded,
                              size: 22,
                              color: themeChanger.themeMode == ThemeMode.dark
                                  ? Color(0XFF101D25) // Dark mode color
                                  : themeChanger.themeMode == ThemeMode.light
                                  ? Colors.white
                                  :(MediaQuery.of(context).platformBrightness == Brightness.dark
                                  ?Color(0XFF101D25)
                                  :Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "New group",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 27, left: 15),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0XFF25D366),
                            child: Icon(
                              Icons.person_add_alt_1_rounded,
                              size: 22,
                              color: themeChanger.themeMode == ThemeMode.dark
                                  ? Color(0XFF101D25) // Dark mode color
                                  : themeChanger.themeMode == ThemeMode.light
                                  ? Colors.white
                                  :(MediaQuery.of(context).platformBrightness == Brightness.dark
                                  ?Color(0XFF101D25)
                                  :Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "New contact",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 110,
                          ),
                          Icon(
                            Icons.qr_code_outlined,
                            size: 23,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 27, left: 15),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0XFF25D366),
                            child: Icon(
                              Icons.groups_rounded,
                              size: 25,
                              color: themeChanger.themeMode == ThemeMode.dark
                                  ? Color(0XFF101D25) // Dark mode color
                                  : themeChanger.themeMode == ThemeMode.light
                                  ? Colors.white
                                  :(MediaQuery.of(context).platformBrightness == Brightness.dark
                                  ?Color(0XFF101D25)
                                  :Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "New community",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 27, left: 15),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0XFF25D366),
                            child: UiHelper.CustomImage(
                                img:
                                themeChanger.themeMode == ThemeMode.dark
                                    ? "chatwith.png" // Dark mode color
                                    : themeChanger.themeMode == ThemeMode.light
                                    ? "withchat.png"
                                    :(MediaQuery.of(context).platformBrightness == Brightness.dark
                                    ?"chatwith.png"
                                    :"withchat.png"),
                                width: 19),
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "Chat with Als",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 27),
                    Padding(
                      padding: EdgeInsets.only(right: 150),
                      child: UiHelper.CustomText(
                          text: "Contacts on WhatsApp",
                          fontsize: 16,
                          color: Color(0XFF636F75)),
                    ),
                    ListView.builder(
                      itemCount: profiles.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {},
                          leading: CircleAvatar(
                            maxRadius: 20,
                            backgroundImage: AssetImage(
                              profiles[index],
                            ),
                          ),
                          title: Text(
                            names[index],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            about[index],
                            style: TextStyle(color: Color(0XFF636F75)),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
