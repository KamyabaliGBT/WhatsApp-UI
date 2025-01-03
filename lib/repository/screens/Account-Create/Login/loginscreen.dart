import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/Account-Create/OTP/otpscreen.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeChanger =Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_outlined,
                    color:  themeChanger.themeMode == ThemeMode.dark
                        ? Colors.white  // Dark mode color
                        : themeChanger.themeMode == ThemeMode.light
                        ? Colors.black // Light mode color
                        : (MediaQuery.of(context).platformBrightness == Brightness.dark
                        ? Colors.white // System dark mode color
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
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  UiHelper.CustomText(
                      text: "Enter your phone number",
                      fontweight: FontWeight.w500,
                      fontsize: 22),
                  SizedBox(
                    height: 5,
                  ),
                  UiHelper.CustomText(
                      text: "WhatsApp will need to verify your phone",
                      fontsize: 16),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiHelper.CustomText(
                          text: "number. Carrier charges may apply.",
                          fontsize: 16),
                      UiHelper.CustomText(
                        text: " What's my",
                        fontsize: 16,
                        color: Colors.lightBlue,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  UiHelper.CustomText(
                    text: "number?",
                    fontsize: 16,
                    color: Colors.lightBlue,
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  // Choice the Country
                  CountyChoice(),

                  SizedBox(
                    height: 6,
                  ),

                  // Enter Mobile Number
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "+ 91 ",
                            hintStyle: TextStyle(fontSize: 20),
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFF00A884))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFF25D366))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFF00A884))),
                            contentPadding: EdgeInsets.only(top: 12),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 218,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          style: TextStyle(fontSize: 20),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Phone number',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFF00A884))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFF25D366))),
                            contentPadding: EdgeInsets.only(top: 12),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(
          callback: () {
            login(phoneController.text.toString());
          },
          buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  login(String phonenumber) {
    if (phonenumber == "") {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Enter Phone Number",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey.shade800,
      ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTPScreen(
                    phonenumber: phonenumber,
                  )));
    }
  }
}

// Choice the Country
class CountyChoice extends StatefulWidget {
  const CountyChoice({super.key});

  @override
  State<CountyChoice> createState() => _CountyChoiceState();
}

class _CountyChoiceState extends State<CountyChoice> {
  String selectedcountry = "India";
  List<String> countries = ["India", "America", "Africa", "Italy", "Germany"];

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: SizedBox(
        width: 282,
        child: DropdownButtonFormField(
          items: countries.map((String country) {
            return DropdownMenuItem(
              child: Text(
                country,
                style: TextStyle(fontSize: 20),
              ),
              value: country,
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              selectedcountry = newvalue!;
            });
          },
          value: selectedcountry,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF00A884))),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF25D366))),
            contentPadding: EdgeInsets.only(top: 12),
          ),
          dropdownColor: themeChanger.themeMode == ThemeMode.dark
              ? Color(0XFF101D25) // Dark mode color
              : Colors.white,
          iconDisabledColor: Colors.grey,
          iconEnabledColor: Color(0XFF00A884),
        ),
      ),
    );
  }
}
