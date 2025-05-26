import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageSearchBox extends StatelessWidget {
  const HomePageSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 280.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: AppColors.primaryFourElementText),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 17.h),
                width: 16.w,
                height: 16.w,
                child: Image.asset("assets/icons/search.png"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
