import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:provider/provider.dart';


class LightAndDark extends StatefulWidget {
  const LightAndDark({super.key});

  @override
  State<LightAndDark> createState() => _LightAndDarkState();
}

class _LightAndDarkState extends State<LightAndDark> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RadioListTile<ThemeMode>(
              title: Text('Light Mode'),
              groupValue: themeChanger.themeMode,
              value: ThemeMode.light,
              onChanged: themeChanger.setTheme,
              activeColor: Color(0XFF25D366),
            ),
            RadioListTile<ThemeMode>(
              title: Text('Dark Mode'),
              groupValue: themeChanger.themeMode,
              value: ThemeMode.dark,
              onChanged: themeChanger.setTheme,
              activeColor: Color(0XFF25D366),
            ),
            RadioListTile<ThemeMode>(
              title: Text('System Mode'),
              groupValue: themeChanger.themeMode,
              value: ThemeMode.system,
              onChanged: themeChanger.setTheme,
              activeColor: Color(0XFF25D366),
            ),

          ],
        ),
      ),
    );
  }
}
