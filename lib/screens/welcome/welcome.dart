import 'package:code_academy_app/main.dart';
import 'package:code_academy_app/screens/welcome/bloc/welcome_blocs.dart';
import 'package:code_academy_app/screens/welcome/bloc/welcome_events.dart';
import 'package:code_academy_app/screens/welcome/welcome_page_component.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide StatefulWidget;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController pageController = PageController(initialPage: 0);

  void nextButtonClick(index) {
    if (index < 3) {
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    } else {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => MyHomePage()),
      // );
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil("MyHomePage", (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 34.h),
        width: 375.w,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (value) {
                context.read<WelcomeBlocs>().add(WelcomeEvents(page: value));
              },
              children: [
                WelcomePageComponent(
                  index: 1,
                  context: context,
                  buttonName: "Next",
                  title: "First See Learning",
                  subTitle:
                      "Forget about a for of paper all knowledge in one learning.",
                  imagePath: "assets/images/reading.png",
                  onTab: (p0) {
                    nextButtonClick(1);
                  },
                ),
                WelcomePageComponent(
                  index: 2,
                  context: context,
                  buttonName: "Next",
                  title: "Connect with Everyone",
                  subTitle:
                      "Always keep in touch with your tutor & friend. lets get connected.",
                  imagePath: "assets/images/boy.png",
                  onTab: (p0) {
                    nextButtonClick(2);
                  },
                ),
                WelcomePageComponent(
                  index: 3,
                  context: context,
                  buttonName: "Get Started",
                  title: "Always Fascinated Learning",
                  subTitle:
                      "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                  imagePath: "assets/images/man.png",
                  onTab: (p0) {
                    nextButtonClick(3);
                  },
                ),
              ],
            ),
            Positioned(
              bottom: 60.h,
              child: DotsIndicator(
                position: context.watch<WelcomeBlocs>().state.page.toDouble(),
                dotsCount: 3,
                mainAxisAlignment: MainAxisAlignment.center,
                decorator: DotsDecorator(
                  color: Colors.grey,
                  activeColor: Colors.blue,
                  size: const Size.square(8.0),
                  activeSize: const Size(18.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
