import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/splash/splashScreen.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);


          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: themeChanger.themeMode == ThemeMode.dark
                  ? Color(0XFF101D25) // Dark mode color
                  : themeChanger.themeMode == ThemeMode.light
                  ? Color(0XFF25D366) // Light mode color
                  : (MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Color(0XFF101D25) // System dark mode color
                  : Color(0XFF25D366)), // System light mode color
              statusBarBrightness: themeChanger.themeMode == ThemeMode.dark
                  ? Brightness.dark
                  : themeChanger.themeMode == ThemeMode.light
                  ? Brightness.light
                  : MediaQuery.of(context).platformBrightness,
              statusBarIconBrightness: themeChanger.themeMode == ThemeMode.dark
                  ? Brightness.light
                  : themeChanger.themeMode == ThemeMode.light
                  ? Brightness.dark
                  : (MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark),
            ),
          );


          /*SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(
              statusBarColor: themeChanger.themeMode == ThemeMode.dark
                  ? Color(0XFF101D25) // Dark mode color
                  : Color(0XFF25D366), // Light mode color
              statusBarBrightness: themeChanger.themeMode == ThemeMode.dark
                  ? Brightness.dark // Icons/text become light
                  : Brightness.light, // Icons/text become dark
              statusBarIconBrightness: themeChanger.themeMode == ThemeMode.dark
                  ? Brightness.light
                  : Brightness.dark,
            ),
          );*/


          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.themeMode,
            //Light mode
            theme: ThemeData.light().copyWith(
              useMaterial3: false,
              primaryColor: Color(0XFF25D366),
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF25D366)),
              cardColor: Colors.white,
              iconTheme: IconThemeData(
                color: Colors.black, // Customize icon color
              ),
            ),

            //Dark mode
            darkTheme: ThemeData.dark().copyWith(
              useMaterial3: false,
              primaryColor: Color(0XFF25D366),
              scaffoldBackgroundColor: Color(0XFF101D25),
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF25D366)),
              cardColor: Color(0XFF101D25),
              iconTheme: IconThemeData(
                color: Colors.white, // Customize icon color
              ),
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}