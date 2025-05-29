import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key});

  final imageInfo = const <String, String>{
    "settings": "settings.png",
    "Payment Details": "credit-card.png",
    "Love": "award.png",
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(imageInfo.length, (index) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    padding: EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement,
                    ),
                    child: Image.asset(
                      "assets/icons/${imageInfo.values.elementAt(index)}",
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    imageInfo.keys.elementAt(index),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
