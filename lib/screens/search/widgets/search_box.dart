import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBox extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBox({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.primarySecondaryBackground,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryFourElementText.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 15.w),
          Icon(
            Icons.search,
            color: AppColors.primarySecondaryElementText,
            size: 20.w,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: TextStyle(color: AppColors.primaryText, fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: 'Search courses, instructors...',
                hintStyle: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                  fontSize: 16.sp,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15.h),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(Icons.mic, color: Colors.white, size: 18.w),
          ),
        ],
      ),
    );
  }
}
