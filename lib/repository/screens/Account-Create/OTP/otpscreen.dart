import 'package:flutter/material.dart';
import 'package:whatsapp/domain/constants/themechanger.dart';
import 'package:whatsapp/repository/screens/Account-Create/Profile/proflieScreen.dart';
import 'package:whatsapp/repository/widgets/uihelper.dart';
import 'package:provider/provider.dart';


class OTPScreen extends StatefulWidget {
  String phonenumber;
  OTPScreen({required this.phonenumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ListTile(
                leading: InkWell(onTap: () {
                  Navigator.pop(context);
                },
                    child: Icon(Icons.close_outlined,
                      color:  themeChanger.themeMode == ThemeMode.dark
                          ? Colors.white  // Dark mode color
                          : themeChanger.themeMode == ThemeMode.light
                          ? Colors.black // Light mode color
                          : (MediaQuery.of(context).platformBrightness == Brightness.dark
                          ? Colors.white // System dark mode color
                          : Colors.black),
                    )),
                trailing: Icon(Icons.more_vert_outlined,
                  color:  themeChanger.themeMode == ThemeMode.dark
                      ? Colors.white  // Dark mode color
                      : themeChanger.themeMode == ThemeMode.light
                      ? Colors.black // Light mode color
                      : (MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.white  // System dark mode color
                      : Colors.black),
                ),
              ),
              Expanded(child: SingleChildScrollView(child: Column(children: [
                SizedBox(
                  height: 25,
                ),
                UiHelper.CustomText(
                    text: "Verifying your number",
                    fontsize: 22 ,
                    fontweight: FontWeight.bold),
                const SizedBox(
                  height: 30,
                ),
                UiHelper.CustomText(
                    text: "You've tried to register +91${widget.phonenumber}", fontsize: 16),
                UiHelper.CustomText(
                    text: "recently. Wait before requesting an sms or a call",
                    fontsize: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UiHelper.CustomText(text: "with your code. ", fontsize: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: UiHelper.CustomText(
                          text: "Wrong number?",
                          fontsize: 16,
                          color: Colors.lightBlue),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UiHelper.CustomContainer(otp1Controller),
                    const SizedBox(
                      width: 10,
                    ),
                    UiHelper.CustomContainer(otp2Controller),
                    const SizedBox(
                      width: 10,
                    ),
                    UiHelper.CustomContainer(otp3Controller),
                    const SizedBox(
                      width: 10,
                    ),
                    UiHelper.CustomContainer(otp4Controller),
                    const SizedBox(
                      width: 10,
                    ),
                    UiHelper.CustomContainer(otp5Controller),
                    const SizedBox(
                      width: 10,
                    ),
                    UiHelper.CustomContainer(otp6Controller)
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                UiHelper.CustomText(
                    text: "Didn't receive code?",
                    fontsize: 14,
                    color: Color(0XFF25D366)),
                SizedBox(height: 100)
              ],),))

            ],
          ),
        ),
      ),
      floatingActionButton:
      UiHelper.CustomButton(callback: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
      }, buttonname: "Next"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}