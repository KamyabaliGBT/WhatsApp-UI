import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
              Container(
              height: 66,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12,right: 5),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: Icon(Icons.arrow_back)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.blueGrey.shade600,
                                  child: Icon(
                                    Icons.person,
                                    size: 35,
                                    color: Colors.white60,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        UiHelper.CustomText(
                                            text: "AbidAli PHP",
                                            fontsize: 16,
                                            fontweight: FontWeight.w500),
                                        UiHelper.CustomText(
                                            text: "Online",
                                            fontsize: 13,
                                            fontweight: FontWeight.w500),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],),

                  Row(
                    children: [
                      Icon(
                        Icons.videocam_outlined,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.call_outlined,
                        size: 26,
                      ),


                      PopupMenuButton(
                        onSelected: (selected) {
                          if (selected == 8) {
                          }
                        },
                        elevation: 0,
                        iconSize: 28,
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            child: Text(
                              "View contact",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          PopupMenuItem(
                              value: 2,
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          PopupMenuItem(
                              value: 3,
                              child: Text(
                                "Add to list",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          PopupMenuItem(
                              value: 4,
                              child: Text(
                                "Media, links and docs",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          PopupMenuItem(
                              value: 5,
                              child: Text(
                                "Mute notification",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          PopupMenuItem(
                              value: 6,
                              child: Text(
                                "Disappearing messages",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          PopupMenuItem(
                              value: 7,
                              child: Text(
                                "Wallpaper",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          PopupMenuItem(
                              value: 8,
                              child: Text(
                                "More",
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
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          themeChanger.themeMode == ThemeMode.dark
                              ? "assets/images/darkb.jpg" // Dark mode color
                              : themeChanger.themeMode == ThemeMode.light
                              ?  "assets/images/background.png" // Light mode color
                              : (MediaQuery.of(context).platformBrightness == Brightness.dark
                              ? "assets/images/darkb.jpg" // System dark mode color
                              :  "assets/images/background.png"),

                          // themeChanger.themeMode == ThemeMode.dark
                          //     ?"assets/images/darkb.jpg"  // Dark mode color
                          //     : "assets/images/background.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 100),
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: themeChanger.themeMode == ThemeMode.dark
                                  ? Color(0XFF101D25) // Dark mode color
                                  : themeChanger.themeMode == ThemeMode.light
                                  ? Color(0XFFFFF3C2) // Light mode color
                                  : (MediaQuery.of(context).platformBrightness == Brightness.dark
                                  ? Color(0XFF101D25) // System dark mode color
                                  : Color(0XFFFFF3C2)),

                              // themeChanger.themeMode == ThemeMode.dark
                              //     ? Color(0XFF101D25) // Dark mode color
                              //     : Color(0XFFFFF3C2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text("Messages and calls are end-to-end encrypted, No one outside of this chat can read or listen. Tap to learn more",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15,
                              color:
                              themeChanger.themeMode == ThemeMode.dark
                                  ? Colors.amber.shade400 // Dark mode color
                                  : themeChanger.themeMode == ThemeMode.light
                                  ? Colors.black45 // Light mode color
                                  : (MediaQuery.of(context).platformBrightness == Brightness.dark
                                  ? Colors.amber.shade400 // System dark mode color
                                  : Colors.black45),
                              // themeChanger.themeMode == ThemeMode.dark
                              //     ? Colors.amber.shade400 // Dark mode color
                              //     : Colors.black45,
                              ),
                            ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      bottomSheet: Container(
        height: 58,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                themeChanger.themeMode == ThemeMode.dark
                    ? "assets/images/darkb.jpg" // Dark mode color
                    : themeChanger.themeMode == ThemeMode.light
                    ?  "assets/images/background.png" // Light mode color
                    : (MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? "assets/images/darkb.jpg" // System dark mode color
                    :  "assets/images/background.png"),
                // themeChanger.themeMode == ThemeMode.dark
                //     ?"assets/images/darkb.jpg"  // Dark mode color
                //     : "assets/images/background.png",
              ),
          fit: BoxFit.cover)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color:
                themeChanger.themeMode == ThemeMode.dark
                    ? Color(0XFF101D25) // Dark mode color
                    : themeChanger.themeMode == ThemeMode.light
                    ? Colors.white // Light mode color
                    : (MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Color(0XFF101D25) // System dark mode color
                    : Colors.white),
                // themeChanger.themeMode == ThemeMode.dark
                //     ?  Color(0XFF101D25) // Dark mode color
                //     : Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.emoji_emotions_outlined,size: 28,
                    color:
                    themeChanger.themeMode == ThemeMode.dark
                        ? Colors.grey // Dark mode color
                        : themeChanger.themeMode == ThemeMode.light
                        ? Colors.black45 // Light mode color
                        : (MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Colors.grey // System dark mode color
                        : Colors.black45),
                    // themeChanger.themeMode == ThemeMode.dark
                    //   ? Colors.grey // Dark mode color
                    //   : Colors.black45,
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 180,
                    height: 43,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 19),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: "Message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.attachment_outlined,
                  color:
                  themeChanger.themeMode == ThemeMode.dark
                      ? Colors.grey // Dark mode color
                      : themeChanger.themeMode == ThemeMode.light
                      ? Colors.black45 // Light mode color
                      : (MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.grey // System dark mode color
                      : Colors.black45),
                  // themeChanger.themeMode == ThemeMode.dark
                  //     ? Colors.grey // Dark mode color
                  //     : Colors.black45,
                  ),
                  SizedBox(width: 15,),
                  Icon(Icons.camera_alt_outlined,
                    color:
                    themeChanger.themeMode == ThemeMode.dark
                        ? Colors.grey // Dark mode color
                        : themeChanger.themeMode == ThemeMode.light
                        ? Colors.black45 // Light mode color
                        : (MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Colors.grey // System dark mode color
                        : Colors.black45),
                    // themeChanger.themeMode == ThemeMode.dark
                    //     ? Colors.grey // Dark mode color
                    //     : Colors.black45,
                  size: 25,)
                ],
              ),
            ),

            CircleAvatar(
              radius: 21,
                backgroundColor: Color(0XFF25D366),
                child: Icon(Icons.mic,size: 25,
                  color:
                  themeChanger.themeMode == ThemeMode.dark
                      ? Colors.black// Dark mode color
                      : themeChanger.themeMode == ThemeMode.light
                      ? Colors.white // Light mode color
                      : (MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.black // System dark mode color
                      : Colors.white),
                  // themeChanger.themeMode == ThemeMode.dark
                  //     ? Colors.black // Dark mode color
                  //     : Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
