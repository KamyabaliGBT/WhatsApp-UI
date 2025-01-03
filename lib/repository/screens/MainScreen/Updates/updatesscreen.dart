import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/MainScreen/Setting/settingscreen.dart';
import 'package:whatsapp/repository/screens/MainScreen/TextPad/textpadscreen.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';


class UpdatesScreen extends StatefulWidget {
  const UpdatesScreen({super.key});

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        // Handle the captured image (e.g., display or upload it)
        print('Image path: ${image.path}');
      }
    } catch (e) {
      print('Error accessing the camera: $e');
    }
  }

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
                    padding: EdgeInsets.only(left: 18.7),
                    child: UiHelper.CustomText(
                        text: "Updates",
                        fontsize: 24,
                        fontweight: FontWeight.w500)),
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
                        if (selected == 3) {
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
                            "Status privacy",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                            value: 2,
                            child: Text(
                              "Create channel",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        PopupMenuItem(
                            value: 3,
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
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: UiHelper.CustomText(
                          text: "Status",
                          fontsize: 18,
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
                          Container(
                            padding: EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: Color(0XFF636F75), width: 2)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "assets/images/profile1.jpg",
                                width: 48,
                                height: 48,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UiHelper.CustomText(
                                    text: "My status",
                                    fontsize: 18,
                                    fontweight: FontWeight.w500),
                                SizedBox(
                                  height: 5,
                                ),
                                UiHelper.CustomText(
                                    text: "Today 9:24 am ",
                                    fontsize: 15,
                                    fontweight: FontWeight.w500,
                                    color: Color(0XFF636F75)),
                              ],
                            ),
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
                            text: "Recent updates",
                            fontsize: 14,
                            fontweight: FontWeight.w600,
                            color: Color(0XFF636F75)),
                      ),
                    ),

                    SizedBox(height: 12),
                    // Recent Updates(Status)
                    RecentUp(),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: UiHelper.CustomText(
                            text: "Viewed updates",
                            fontsize: 14,
                            fontweight: FontWeight.w600,
                            color: Color(0XFF636F75)),
                      ),
                    ),

                    SizedBox(height: 15),
                    // Viewed Updates(Status)
                    ViewedUp(),

                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 20),

                    // ChannelsSection
                    ChannelsSection(),

                    SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TextPadScreen(),
                ),
              );
            },
            mini: true,
            backgroundColor:
            themeChanger.themeMode == ThemeMode.dark
                ? Colors.grey.shade900 // Dark mode color
                : themeChanger.themeMode == ThemeMode.light
                ? Color(0XFF25D366) // Light mode color
                : (MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Colors.grey.shade900 // System dark mode color
                : Colors.grey.shade200),

            // themeChanger.themeMode == ThemeMode.dark
            //     ? Colors.grey.shade900 // Dark mode color
            //     : Colors.grey.shade200,
            child: Center(
              child: Icon(
                Icons.edit,
                color:
                themeChanger.themeMode == ThemeMode.dark
                    ? Colors.white // Dark mode color
                    : themeChanger.themeMode == ThemeMode.light
                    ? Colors.black // Light mode color
                    : (MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Colors.white// System dark mode color
                    : Colors.black),
                // themeChanger.themeMode == ThemeMode.dark
                //     ? Colors.white // Dark mode color
                //     : Colors.black,
                size: 30,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: _openCamera,
            backgroundColor: Color(0XFF25D366),
            child: Center(
              child: Icon(
                Icons.add_a_photo_rounded,
                size: 25,
                color:
                themeChanger.themeMode == ThemeMode.dark
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
        ],
      ),
    );
  }
}

//Recent update
class RecentUp extends StatelessWidget {
  const RecentUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0XFF25D366), width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/kia.jpg",
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.CustomText(
                        text: "Vasim kia",
                        fontsize: 18,
                        fontweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    UiHelper.CustomText(
                        text: "10 minutes ago",
                        fontsize: 15,
                        fontweight: FontWeight.w500,
                        color: Color(0XFF636F75)),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0XFF25D366), width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/status2.jpg",
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.CustomText(
                        text: "Kurban G Umatiya",
                        fontsize: 18,
                        fontweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    UiHelper.CustomText(
                        text: "10:45 am",
                        fontsize: 15,
                        fontweight: FontWeight.w500,
                        color: Color(0XFF636F75)),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0XFF25D366), width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/status3.jpg",
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.CustomText(
                        text: "Priti shah",
                        fontsize: 18,
                        fontweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    UiHelper.CustomText(
                        text: "11:25 am",
                        fontsize: 15,
                        fontweight: FontWeight.w500,
                        color: Color(0XFF636F75)),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0XFF25D366), width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/status4.jpg",
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.CustomText(
                        text: "Vagmar Jafarali",
                        fontsize: 18,
                        fontweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    UiHelper.CustomText(
                        text: "12:25 pm",
                        fontsize: 15,
                        fontweight: FontWeight.w500,
                        color: Color(0XFF636F75)),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0XFF25D366), width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/status5.jpg",
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.CustomText(
                        text: "Sakirali Mukhi",
                        fontsize: 18,
                        fontweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    UiHelper.CustomText(
                        text: "1:38 pm",
                        fontsize: 15,
                        fontweight: FontWeight.w500,
                        color: Color(0XFF636F75)),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

// Viewed Update
class ViewedUp extends StatelessWidget {
  const ViewedUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0XFF636F75), width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/status1.jpg",
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.CustomText(
                        text: "Pratik Joshi",
                        fontsize: 18,
                        fontweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    UiHelper.CustomText(
                        text: "4:45 pm",
                        fontsize: 15,
                        fontweight: FontWeight.w500,
                        color: Color(0XFF636F75)),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0XFF636F75), width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/tajjjjj.jpg",
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.CustomText(
                        text: "Salamanbhai",
                        fontsize: 18,
                        fontweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    UiHelper.CustomText(
                        text: "Yesterday",
                        fontsize: 15,
                        fontweight: FontWeight.w500,
                        color: Color(0XFF636F75)),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Color(0XFF636F75), width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/shayri.jpg",
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UiHelper.CustomText(
                        text: "Mustufa Hasan",
                        fontsize: 18,
                        fontweight: FontWeight.w500),
                    SizedBox(
                      height: 5,
                    ),
                    UiHelper.CustomText(
                        text: "Yesterday",
                        fontsize: 15,
                        fontweight: FontWeight.w500,
                        color: Color(0XFF636F75)),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

// Channels Section
class ChannelsSection extends StatelessWidget {
  const ChannelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Container(
            alignment: Alignment.centerLeft,
            child: UiHelper.CustomText(
              text: "Channels",
              fontsize: 18,
              fontweight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Container(
            alignment: Alignment.centerLeft,
            child: UiHelper.CustomText(
                text:
                    "Stay updates on topics that matter to you. Find channels to follow below.",
                fontsize: 14,
                fontweight: FontWeight.w500,
                color: Color(0XFF636F75)),
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Container(
            alignment: Alignment.centerLeft,
            child: UiHelper.CustomText(
                text: "Find channels to follow",
                fontsize: 14,
                fontweight: FontWeight.w600,
                color: Color(0XFF636F75)),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/whatttt.jpg",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "WhatsApp",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          UiHelper.CustomText(
                              text: "204M followers",
                              fontsize: 15,
                              fontweight: FontWeight.w500,
                              color: Color(0XFF636F75)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeChanger.themeMode == ThemeMode.dark
                          ? Color(0XFF082E20)// Dark mode color
                          : themeChanger.themeMode == ThemeMode.light
                          ? Colors.green.shade100 // Light mode color
                          : (MediaQuery.of(context).platformBrightness == Brightness.dark
                          ? Color(0XFF082E20) // System dark mode color
                          : Colors.green.shade100),
                      // themeChanger.themeMode == ThemeMode.dark
                      //     ? Color(0XFF082E20) // Dark mode color
                      //     : Colors.green.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  child: Text(
                    "Follow",
                    style: TextStyle(
                        color:
                        themeChanger.themeMode == ThemeMode.dark
                            ? Colors.green.shade100 // Dark mode color
                            : themeChanger.themeMode == ThemeMode.light
                            ? Colors.green.shade900 // Light mode color
                            : (MediaQuery.of(context).platformBrightness == Brightness.dark
                            ? Colors.green.shade100 // System dark mode color
                            : Colors.green.shade900),
                        // themeChanger.themeMode == ThemeMode.dark
                        //     ? Colors.green.shade100 // Dark mode color
                        //     : Colors.green.shade900,
                        fontWeight: FontWeight.bold
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/aaj tak.jpg",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Aaj Tak",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          UiHelper.CustomText(
                              text: "23.4M followers",
                              fontsize: 15,
                              fontweight: FontWeight.w500,
                              color: Color(0XFF636F75)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeChanger.themeMode == ThemeMode.dark
                          ? Color(0XFF082E20)// Dark mode color
                          : themeChanger.themeMode == ThemeMode.light
                          ? Colors.green.shade100 // Light mode color
                          : (MediaQuery.of(context).platformBrightness == Brightness.dark
                          ? Color(0XFF082E20) // System dark mode color
                          : Colors.green.shade100),
                      // themeChanger.themeMode == ThemeMode.dark
                      //     ? Color(0XFF082E20) // Dark mode color
                      //     : Colors.green.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  child: Text(
                    "Follow",
                    style: TextStyle(
                        color:
                        themeChanger.themeMode == ThemeMode.dark
                            ? Colors.green.shade100 // Dark mode color
                            : themeChanger.themeMode == ThemeMode.light
                            ? Colors.green.shade900 // Light mode color
                            : (MediaQuery.of(context).platformBrightness == Brightness.dark
                            ? Colors.green.shade100 // System dark mode color
                            : Colors.green.shade900),
                        // themeChanger.themeMode == ThemeMode.dark
                        //     ? Colors.green.shade100 // Dark mode color
                        //     : Colors.green.shade900,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        "assets/images/star india.jpg",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UiHelper.CustomText(
                              text: "Star Sports India",
                              fontsize: 18,
                              fontweight: FontWeight.w500),
                          UiHelper.CustomText(
                              text: "15.2M followers",
                              fontsize: 15,
                              fontweight: FontWeight.w500,
                              color: Color(0XFF636F75)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeChanger.themeMode == ThemeMode.dark
                          ? Color(0XFF082E20)// Dark mode color
                          : themeChanger.themeMode == ThemeMode.light
                          ? Colors.green.shade100 // Light mode color
                          : (MediaQuery.of(context).platformBrightness == Brightness.dark
                          ? Color(0XFF082E20) // System dark mode color
                          : Colors.green.shade100),
                      // themeChanger.themeMode == ThemeMode.dark
                      //     ? Color(0XFF082E20) // Dark mode color
                      //     : Colors.green.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                  child: Text(
                    "Follow",
                    style: TextStyle(
                        color:
                        themeChanger.themeMode == ThemeMode.dark
                            ? Colors.green.shade100 // Dark mode color
                            : themeChanger.themeMode == ThemeMode.light
                            ? Colors.green.shade900 // Light mode color
                            : (MediaQuery.of(context).platformBrightness == Brightness.dark
                            ? Colors.green.shade100 // System dark mode color
                            : Colors.green.shade900),
                        // themeChanger.themeMode == ThemeMode.dark
                        //     ? Colors.green.shade100 // Dark mode color
                        //     : Colors.green.shade900,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 3),
          child: Container(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: themeChanger.themeMode == ThemeMode.dark
                    ? Color(0XFF101D25)// Dark mode color
                    : themeChanger.themeMode == ThemeMode.light
                    ? Colors.white // Light mode color
                    : (MediaQuery.of(context).platformBrightness == Brightness.dark
                    ? Color(0XFF101D25) // System dark mode color
                    : Colors.white),
                // themeChanger.themeMode == ThemeMode.dark
                //     ? Colors.white12 // Dark mode color
                //     : Colors.white, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                  side: BorderSide(
                      color: Colors.grey, width: 0.5), // Border color and width
                ),
                fixedSize: Size(130, 40), // Fixed button size: width and height
              ),
              child: Text(
                "Explore more",
                style: TextStyle(
                  color: Color(0XFF25D366),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
