import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp/repository/screens/MainScreen/BottomNav/bottomnav.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';

class LoadingScrren extends StatefulWidget {
  const LoadingScrren({super.key});

  @override
  State<LoadingScrren> createState() => _LoadingScrrenState();
}

class _LoadingScrrenState extends State<LoadingScrren> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              UiHelper.CustomText(
                  text: " Adding account...",
                  fontsize: 25,
                  fontweight: FontWeight.w500),
              SizedBox(height: 10),
              UiHelper.CustomText(
                  text: "Please wait a moment",
                  fontsize: 16,
              color: Color(0XFF5E5E5E)),
              SizedBox(height: 190,),
              UiHelper.CustomImage(img: "welcome.png",),
            ],
          ),
        ),
      ),
    );
  }
}
