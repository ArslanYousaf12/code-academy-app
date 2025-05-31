import 'package:code_academy_app/common/routes/routes.dart';
import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key});

  final imageInfo = const <String, String>{
    "settings": "settings.png",
    "Payment Details": "credit-card.png",
    "Achievement": "award.png",
    "Love": "heart(1).png",
    "Reminders": "cube.png",
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(imageInfo.length, (index) {
          String itemKey = imageInfo.keys.elementAt(index);
          return GestureDetector(
            onTap: () {
              // Navigate based on the specific item
              if (itemKey.toLowerCase() == "settings") {
                Navigator.of(context).pushNamed(AppRoutes.PROFILE_SETTINGS);
              } else {
                // For other items, you can add their routes here
                // or show a message that the feature is coming soon
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$itemKey feature coming soon!')),
                );
              }
            },
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
                    itemKey,
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
