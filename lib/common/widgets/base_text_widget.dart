import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseTextWidget extends StatelessWidget {
  const BaseTextWidget({
    super.key,
    required this.text,
    this.color = AppColors.primaryText,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
  });
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
