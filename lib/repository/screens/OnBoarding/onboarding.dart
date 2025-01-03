import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/Account-Create/Login/loginscreen.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //   Back and more Option,
            ListTile(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color:  themeChanger.themeMode == ThemeMode.dark
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
                    ? Colors.white // System dark mode color
                    : Colors.black),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  UiHelper.CustomImage(img: "welcome.png", width: 500),
                  SizedBox(
                    height: 20,
                  ),
                  UiHelper.CustomText(
                      text: "Add an account",
                      fontweight: FontWeight.bold,
                      fontsize: 22),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.CustomText(
                        text: "Read out",
                        fontweight: FontWeight.normal,
                        fontsize: 15,
                        color: Color(0XFF5E5E5E),
                      ),
                      UiHelper.CustomText(
                        text: " Privacy Policy. ",
                        fontweight: FontWeight.normal,
                        fontsize: 15,
                        color: Colors.lightBlue,
                      ),
                      UiHelper.CustomText(
                        text: "Tap ''Agree and continue''",
                        fontsize: 15,
                        color: Color(0XFF5E5E5E),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.CustomText(
                        text: "to accept the",
                        fontweight: FontWeight.normal,
                        fontsize: 15,
                        color: Color(0XFF5E5E5E),
                      ),
                      UiHelper.CustomText(
                        text: "Teams of Service",
                        fontweight: FontWeight.normal,
                        fontsize: 15,
                        color: Colors.lightBlue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color:
                        themeChanger.themeMode == ThemeMode.dark
                            ? Colors.white12  // Dark mode color
                            : themeChanger.themeMode == ThemeMode.light
                            ? Colors.grey.shade100 // Light mode color
                            : (MediaQuery.of(context).platformBrightness == Brightness.dark
                            ? Colors.white12  // System dark mode color
                            : Colors.grey.shade100),
                        // themeChanger.themeMode == ThemeMode.dark
                        //     ? Colors.white12 // Dark mode color
                        //     : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(50)),
                    // Language option
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.language_outlined, color: Color(0XFF25D366)),
                        UiHelper.CustomText(
                            text: "English",
                            fontsize: 16,
                            color: Color(0XFF25D366)),
                        Icon(Icons.keyboard_arrow_down_outlined,
                            color: Color(0XFF25D366))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(
          callback: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          buttonname: "Agree and continue"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
