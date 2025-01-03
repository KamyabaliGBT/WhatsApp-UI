import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class TextPadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      backgroundColor:themeChanger.themeMode == ThemeMode.dark
          ? Colors.blueGrey // Dark mode color
          : Colors.blueAccent,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.close_outlined,color: Colors.white,),
                    ),
                  ),
                ),
                Container(
                  child: Row(children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.emoji_emotions_outlined,color: Colors.white,),
                    ),
                    SizedBox(width: 10,),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.black12,
                      child: UiHelper.CustomText(
                          text: "T",
                          fontsize: 28,
                      color: Colors.white,
                      fontweight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black12,
                        child: Icon(Icons.color_lens_outlined,color: Colors.white,),
                      ),
                    ),
                  ],),
                )
              ],
            ),
            SizedBox(height: 250),
            TextField(
              textAlign: TextAlign.center, // Centers the cursor and text
              maxLines: null, // Allows multiple lines of input
              keyboardType: TextInputType.multiline,
              style: TextStyle(fontSize: 30),
              decoration: InputDecoration(
                hintText: "Type a Status",
                hintStyle: TextStyle(
                  color: Colors.grey.shade300, // Customize hint text color
                  fontSize: 33, // Customize hint text size// Customize hint text font style
                ),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
