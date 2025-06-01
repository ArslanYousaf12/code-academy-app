import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchievementStats extends StatelessWidget {
  const AchievementStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primaryElement,
            AppColors.primaryElement.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryElement.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.emoji_events,
                color: Colors.white,
                size: 30.w,
              ),
              SizedBox(width: 10.w),
              Text(
                'Your Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 25.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem('12', 'Badges\nEarned', Icons.military_tech),
              Container(
                width: 1,
                height: 40.h,
                color: Colors.white.withOpacity(0.3),
              ),
              _buildStatItem('850', 'Total\nPoints', Icons.stars),
              Container(
                width: 1,
                height: 40.h,
                color: Colors.white.withOpacity(0.3),
              ),
              _buildStatItem('5', 'Certificates\nEarned', Icons.workspace_premium),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24.w,
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
