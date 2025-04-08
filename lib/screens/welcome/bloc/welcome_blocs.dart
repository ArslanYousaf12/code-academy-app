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
                Column(
                  children: [
                    SizedBox(
                      width: 345.w,
                      height: 345.h,
                      child: Text("Image one"),
                    ),
                    Container(
                      child: Text(
                        "First See Learning",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      width: 375.w,
                      padding: EdgeInsets.only(left: 30.w, right: 30.w),
                      child: Text(
                        "Forget about a for of paper all knowledge in one learning",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 100.h,
                        left: 25.w,
                        right: 25.w,
                      ),
                      width: 325.w,
                      height: 50.h,

                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(15.w)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
