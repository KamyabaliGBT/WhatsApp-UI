import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/Account-Create/Loadingpage/loadingScreeen.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();

  File? pickedimage;

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ListTile(
                leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_outlined,
                      color: themeChanger.themeMode == ThemeMode.dark
                          ? Colors.white  // Dark mode color
                          : themeChanger.themeMode == ThemeMode.light
                          ? Colors.black // Light mode color
                          : (MediaQuery.of(context).platformBrightness == Brightness.dark
                          ? Colors.white  // System dark mode color
                          : Colors.black),
                    )),
                trailing: Icon(
                  Icons.more_vert_outlined,
                  color:  themeChanger.themeMode == ThemeMode.dark
                      ? Colors.white  // Dark mode color
                      : themeChanger.themeMode == ThemeMode.light
                      ? Colors.black // Light mode color
                      : (MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white  // System dark mode color
                      : Colors.black),
                ),
              ),
              Expanded(child: SingleChildScrollView(child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  UiHelper.CustomText(
                      text: "Profile info",
                      fontsize: 22,
                      fontweight: FontWeight.bold),
                  const SizedBox(
                    height: 30,
                  ),
                  UiHelper.CustomText(
                      text: "Please provide your name and an optional",
                      fontsize: 16),
                  UiHelper.CustomText(text: "profile photo", fontsize: 16),
                  const SizedBox(
                    height: 20,
                  ),
                  //Profile Image
                  Stack(children: [
                    GestureDetector(
                      onTap: () {
                        _openBottom(context);
                      },
                      child: pickedimage == null
                          ? CircleAvatar(
                        radius: 60,
                        backgroundColor:
                        themeChanger.themeMode == ThemeMode.dark
                            ? Colors.grey.shade700 // Dark mode color
                            : themeChanger.themeMode == ThemeMode.light
                            ? Colors.grey.shade400 // Light mode color
                            : (MediaQuery.of(context).platformBrightness == Brightness.dark
                            ? Colors.grey.shade700 // Dark mode color
                            : Colors.grey.shade400),
                        child: Icon(
                          Icons.person,
                          size: 100,
                          color: themeChanger.themeMode == ThemeMode.dark
                              ? Colors.white54  // Dark mode color
                              : themeChanger.themeMode == ThemeMode.light
                              ? Colors.white // Light mode color
                              : (MediaQuery.of(context).platformBrightness == Brightness.dark
                              ? Colors.white54  // System dark mode color
                              : Colors.white),
                        ),
                      )
                          : CircleAvatar(
                        radius: 80,
                        backgroundImage: FileImage(pickedimage!),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeChanger.themeMode == ThemeMode.dark
                              ? Color(0XFF101D25) // Dark mode color
                              : themeChanger.themeMode == ThemeMode.light
                              ? Colors.white // Light mode color
                              : (MediaQuery.of(context).platformBrightness == Brightness.dark
                              ? Color(0XFF101D25) // System dark mode color
                              : Colors.white), // Background for edit icon
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add_circle, // Edit icon
                          size: 44,
                          color: Color(0XFF25D366),
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 280,
                        child: TextField(
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          style: TextStyle(fontSize: 19),
                          decoration: const InputDecoration(
                            hintText: "Type your name here",
                            hintStyle:
                            TextStyle(color: Color(0XFF5E5E5E), fontSize: 19),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFF05AA82))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFF05AA82))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFF25D366))),
                            contentPadding: EdgeInsets.only(top: 12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Icon(
                          Icons.emoji_emotions_outlined,
                          color: Color(0XFF5E5E5E),
                          size: 28,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),))

            ],
          ),
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(
          callback: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoadingScrren()));
          },
          buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _openBottom(BuildContext context) {

    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return Container(
            height: 202,
            width: 200,
            color: themeChanger.themeMode == ThemeMode.dark
                ? Color(0XFF101D25) // Dark mode color
                : themeChanger.themeMode == ThemeMode.light
                ? Colors.white
                : (MediaQuery.of(context).platformBrightness == Brightness.dark
                ? Color(0XFF101D25) // System dark mode color
                : Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close_outlined,
                        color: themeChanger.themeMode == ThemeMode.dark
                            ? Colors.white  // Dark mode color
                            : themeChanger.themeMode == ThemeMode.light
                            ? Colors.black // Light mode color
                            : (MediaQuery.of(context).platformBrightness == Brightness.dark
                            ? Colors.white  // System dark mode color
                            : Colors.black),
                      )),
                ),
                UiHelper.CustomText(text: "Profile Photo", fontsize: 22),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: themeChanger.themeMode == ThemeMode.dark
                                  ? Colors.white12 // Dark mode color
                                  : Colors.black26, // Border color
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                themeChanger.themeMode == ThemeMode.dark
                                    ? Color(0XFF101D25)
                                    : Colors.white,
                            child: IconButton(
                              onPressed: () {
                                _pickImage(ImageSource.camera);
                              },
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                size: 25,
                                color: Color(0XFF25D366),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        UiHelper.CustomText(text: "Camera", fontsize: 14),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: themeChanger.themeMode == ThemeMode.dark
                                  ? Colors.white12 // Dark mode color
                                  : Colors.black26, // Border color
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                themeChanger.themeMode == ThemeMode.dark
                                    ? Color(0XFF101D25) // Dark mode color
                                    : Colors.white,
                            child: IconButton(
                                onPressed: () {
                                  _pickImage(ImageSource.gallery);
                                },
                                icon: Icon(
                                  Icons.image_outlined,
                                  size: 25,
                                  color: Color(0XFF25D366),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        UiHelper.CustomText(text: "Gallery", fontsize: 14)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: themeChanger.themeMode == ThemeMode.dark
                                  ? Colors.white12 // Dark mode color
                                  : Colors.black26, // Border color
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                themeChanger.themeMode == ThemeMode.dark
                                    ? Color(0XFF101D25) // Dark mode color
                                    : Colors.white,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.face,
                                size: 25,
                                color: Color(0XFF25D366),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        UiHelper.CustomText(text: "Avatar", fontsize: 14),
                        SizedBox(height: 10),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  _pickImage(ImageSource imagesource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imagesource);
      if (photo == null) return;
      final tempimage = File(photo.path);
      setState(() {
        pickedimage = tempimage;
      });
    } catch (ex) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(ex.toString()),
        backgroundColor: Color(0XFF00A884),
      ));
    }
  }
}
