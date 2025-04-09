import 'package:code_academy_app/screens/welcome/welcome_page_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide StatefulWidget;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 34.h),
        width: 375.w,
        child: Stack(
          children: [
            PageView(
              children: [
                WelcomePageComponent(
                  index: 1,
                  context: context,
                  buttonName: "Next",
                  title: "First See Learning",
                  subTitle:
                      "Forget about a for of paper all knowledge in one learning.",
                  imagePath: "Image Path",
                ),
                WelcomePageComponent(
                  index: 2,
                  context: context,
                  buttonName: "Next",
                  title: "Connect with Everyone",
                  subTitle:
                      "Always keep in touch with your tutor & friend. lets get connected.",
                  imagePath: "Image Path",
                ),
                WelcomePageComponent(
                  index: 3,
                  context: context,
                  buttonName: "Get Started",
                  title: "Always Fascinated Learning",
                  subTitle:
                      "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                  imagePath: "Image Path",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
