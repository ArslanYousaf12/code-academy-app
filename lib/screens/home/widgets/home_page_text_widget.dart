import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageTextWidget extends StatelessWidget {
  const HomePageTextWidget({
    super.key,
    required this.text,
    this.color = AppColors.primaryText,
    this.topMargin = 20,
  });
  final String text;
  final Color color;
  final double topMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin.h),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
