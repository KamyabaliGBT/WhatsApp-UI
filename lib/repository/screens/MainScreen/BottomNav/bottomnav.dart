import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/MainScreen/Calls/callsscreen.dart';
import 'package:whatsapp/repository/screens/MainScreen/Chats/chatscreen.dart';
import 'package:whatsapp/repository/screens/MainScreen/Communities/communitiesscreen.dart';
import 'package:whatsapp/repository/screens/MainScreen/Updates/updatesscreen.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  int _selectedIndex = 0;
  List<Widget> _pages = [
    ChatsScreen(),
    UpdatesScreen(),
    CommunitiesScreen(),
    CallsScreen()
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildNavBarItem(IconData filledIcon, IconData outlinedIcon, String text, int index){
    final themeChanger = Provider.of<ThemeChanger>(context);

    return GestureDetector(
     onTap: () => _onItemTapped(index),
     child: Padding(
         padding: EdgeInsets.only(top: 12),
       child: Column(
         children: [
           Container(
             padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
             decoration: BoxDecoration(
               color : themeChanger.themeMode == ThemeMode.dark
                   ? _selectedIndex == index ? Color(0XFF082E20) : Color(0XFF101D25) // Dark mode color
                   : themeChanger.themeMode == ThemeMode.light
                   ? _selectedIndex == index ? Colors.green.shade100 : Colors.white // Light mode color
                   : (MediaQuery.of(context).platformBrightness == Brightness.dark
                   ? _selectedIndex == index ? Color(0XFF082E20) : Color(0XFF101D25) // System dark mode color
                   : _selectedIndex == index ? Colors.green.shade100 : Colors.white),
               // color: themeChanger.themeMode == ThemeMode.dark
               //     ? _selectedIndex == index ? Color(0XFF082E20) : Color(0XFF101D25) // Dark mode color
               //     : _selectedIndex == index ? Colors.green.shade100 : Colors.white,
                // _selectedIndex == index ? Color(0XFF082E20) : Color(0XFF101D25),
               borderRadius:  BorderRadius.circular(20),
             ),
             child: Icon(
                 _selectedIndex == index ? filledIcon : outlinedIcon,
               size: 26,
               color: themeChanger.themeMode == ThemeMode.dark
                   ? _selectedIndex == index ? Colors.green.shade100 : Colors.white // Dark mode color
                   : themeChanger.themeMode == ThemeMode.light
                   ? _selectedIndex == index ? Colors.green.shade900 : Colors.black // Light mode color
                   : (MediaQuery.of(context).platformBrightness == Brightness.dark
                   ? _selectedIndex == index ? Colors.green.shade100 : Colors.white // System dark mode color
                   : _selectedIndex == index ? Colors.green.shade900 : Colors.black),
             ),
           ),
           SizedBox(height: 8,),
           UiHelper.CustomText(
               text: text,
               fontsize: 14,
           fontweight:
           _selectedIndex == index ? FontWeight. w800 : FontWeight.w400,
           ),
         ],
       ),
     ),
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 85,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.white12, width: 0.5),
          )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNavBarItem(Icons.message, Icons.message_outlined, "Chats", 0),
            buildNavBarItem(Icons.update, Icons.update_outlined, "Updates", 1),
            buildNavBarItem(Icons.people, Icons.people_outlined, "Community", 2),
            buildNavBarItem(Icons.call, Icons.call_outlined, "Call", 3),
          ],
        ),
      ),
    );
  }
}
