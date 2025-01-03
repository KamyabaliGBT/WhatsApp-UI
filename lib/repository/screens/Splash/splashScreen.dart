import 'dart:async';
import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/OnBoarding/onboarding.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnBoarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 650,
                // WhatsApp logo Splash
                child: UiHelper.CustomImage(
                    img: themeChanger.themeMode == ThemeMode.dark
                        ? "Spalshlogo.png" // Dark mode color
                        : themeChanger.themeMode == ThemeMode.light
                        ? "whatsapplight.png" // Light mode color
                        : (MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? "Spalshlogo.png" // System dark mode color
                        : "whatsapplight.png"),
                    width: 85,
                    height: 85),
              ),
              SizedBox(
                height: 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // From Text
                    UiHelper.CustomText(
                        text: "from",
                        color: Colors.grey.shade700,
                        fontweight: FontWeight.normal,
                        fontsize: 15,
                        fontfamily: "poppins"),
                    SizedBox(
                      height: 5,
                    ),

                    // Meta logo and Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UiHelper.CustomImage(
                            img: themeChanger.themeMode == ThemeMode.dark
                                ? "meta.png" // Dark mode color
                                : themeChanger.themeMode == ThemeMode.light
                                    ? "metaLight.png" // Light mode color
                                    : (MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? "meta.png" // System dark mode color
                                        : "metaLight.png"),
                            height: 30,
                            width: 40),
                        UiHelper.CustomText(
                            text: "Meta",
                            color: themeChanger.themeMode == ThemeMode.dark
                                ? Colors.white70 // Dark mode color
                                : themeChanger.themeMode == ThemeMode.light
                                    ? Colors.black87 // Light mode color
                                    : (MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.dark
                                        ? Colors
                                            .white70 // System dark mode color
                                        : Colors.black87),
                            fontweight: FontWeight.bold,
                            fontsize: 20,
                            fontfamily: "poppins"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
