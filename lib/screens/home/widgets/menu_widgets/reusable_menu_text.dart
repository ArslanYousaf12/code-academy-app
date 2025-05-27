import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/home/widgets/menu_widgets/reusable_sub_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableMenuText extends StatelessWidget {
  const ReusableMenuText({
    super.key,
    required this.text,
    this.textColor = AppColors.primaryElementText,
    this.backgroundColor = AppColors.primaryElement,
  });
  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.w, left: 20.w),
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.w, bottom: 5.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(color: backgroundColor, width: 1.w),
      ),
      child: ReusableSubTitleText(
        text: text,
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
