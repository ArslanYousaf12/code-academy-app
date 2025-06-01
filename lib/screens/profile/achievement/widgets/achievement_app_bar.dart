import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchievementAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AchievementAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios,
          color: AppColors.primaryText,
          size: 20.w,
        ),
      ),
      title: Text(
        'Achievements',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.share,
            color: AppColors.primaryElement,
            size: 24.w,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
