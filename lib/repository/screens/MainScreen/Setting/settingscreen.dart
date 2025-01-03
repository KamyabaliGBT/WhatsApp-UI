import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/MainScreen/Setting/theme/apptheme.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 25,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Settings",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.search_outlined,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 33,
                                backgroundColor: Colors.blueGrey.shade600,
                                child: Icon(
                                  Icons.person,
                                  size: 55,
                                  color: Colors.white60,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Mr.Nagalapara",
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 55),
                                      child: Text("Available",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0XFF636F75))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Scan and add code
                      Row(
                        children: [
                          Icon(
                            Icons.qr_code_outlined,
                            size: 26,
                            color: Color(0XFF25D366),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Icon(
                              Icons.add_circle_outline,
                              color: Color(0XFF25D366),
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.key_outlined,
                      color: Color(0XFF636F75),
                    ),
                  ),
                  title: Text(
                    "Account",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Security notifications, change number",
                    style: TextStyle(fontSize: 15, color: Color(0XFF636F75)),
                  ),
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.lock_outlined,
                      color: Color(0XFF636F75),
                    ),
                  ),
                  title: Text(
                    "Privacy",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Block contacts, disappearing messages",
                    style: TextStyle(fontSize: 15, color: Color(0XFF636F75)),
                  ),
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.face,
                      color: Color(0XFF636F75),
                    ),
                  ),
                  title: Text(
                    "Avatar",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Create, edit, profile photo",
                    style: TextStyle(fontSize: 15, color: Color(0XFF636F75)),
                  ),
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.contacts_outlined,
                      color: Color(0XFF636F75),
                    ),
                  ),
                  title: Text(
                    "Lists",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Manage people and groups",
                    style: TextStyle(fontSize: 15, color: Color(0XFF636F75)),
                  ),
                ),
                // ThemeScreen
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LightAndDark()));
                  },
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(
                        Icons.chat_outlined,
                        color: Color(0XFF636F75),
                      ),
                    ),
                    title: Text(
                      "Chats",
                      style: TextStyle(fontSize: 17),
                    ),
                    subtitle: Text(
                      "Theme, wallpapers, chat history",
                      style: TextStyle(fontSize: 15, color: Color(0XFF636F75)),
                    ),
                  ),
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.notifications_outlined,
                      color: Color(0XFF636F75),
                    ),
                  ),
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Message, group,& call tones",
                    style: TextStyle(fontSize: 15, color: Color(0XFF636F75)),
                  ),
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.data_saver_off_outlined,
                      color: Color(0XFF636F75),
                    ),
                  ),
                  title: Text(
                    "Storage and data",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Network usage, auto-download",
                    style: TextStyle(fontSize: 15, color: Color(0XFF636F75)),
                  ),
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.language_outlined,
                      color: Color(0XFF636F75),
                    ),
                  ),
                  title: Text(
                    "App language",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "English(device's language)",
                    style: TextStyle(fontSize: 15, color: Color(0XFF636F75)),
                  ),
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.help_outline,
                      color: Color(0XFF636F75),
                    ),
                  ),
                  title: Text(
                    "Help",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Help centre, contact us, privacy policy",
                    style: TextStyle(fontSize: 15, color: Color(0XFF636F75)),
                  ),
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.people_alt_outlined,
                      color: Color(0XFF636F75),
                    ),
                  ),
                  title: Text(
                    "Invite a friend",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.security_update_good_outlined,
                      color: Color(0XFF636F75),
                    ),
                  ),
                  title: Text(
                    "App updates",
                    style: TextStyle(fontSize: 17),
                  ),
                ),

                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220),
                  child: Text("Alos from Meta",
                      style: TextStyle(fontSize: 15, color: Color(0XFF636F75))),
                ),
                ListTile(
                  leading: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: FaIcon(FontAwesomeIcons.instagram,
                          color: Color(0XFF636F75))),
                  title: Text(
                    "Open Instagram",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                ListTile(
                  leading: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: FaIcon(FontAwesomeIcons.facebook,
                          color: Color(0XFF636F75))),
                  title: Text(
                    "Open Facebook",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                ListTile(
                  leading: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: FaIcon(FontAwesomeIcons.threads,
                          color: Color(0XFF636F75))),
                  title: Text(
                    "Open Threads",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ))
        ],
      )),
    );
  }
}
