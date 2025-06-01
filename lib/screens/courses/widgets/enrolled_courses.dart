import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnrolledCourses extends StatelessWidget {
  const EnrolledCourses({super.key});

  final List<Map<String, dynamic>> enrolledCourses = const [
    {
      'title': 'Flutter Development Masterclass',
      'instructor': 'Dr. Angela Yu',
      'progress': 0.65,
      'totalLessons': 125,
      'completedLessons': 81,
      'image': 'assets/icons/Image.png',
      'category': 'Programming',
    },
    {
      'title': 'Advanced UI/UX Design',
      'instructor': 'Jonas Schmedtmann',
      'progress': 0.45,
      'totalLessons': 89,
      'completedLessons': 40,
      'image': 'assets/icons/Image(1).png',
      'category': 'Design',
    },
    {
      'title': 'Digital Marketing Strategy',
      'instructor': 'Neil Patel',
      'progress': 0.80,
      'totalLessons': 67,
      'completedLessons': 54,
      'image': 'assets/icons/Image(2).png',
      'category': 'Marketing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20.w),
      itemCount: enrolledCourses.length,
      itemBuilder: (context, index) {
        final course = enrolledCourses[index];
        return Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image: AssetImage(course['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course['title'],
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          course['instructor'],
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryElement.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            course['category'],
                            style: TextStyle(
                              color: AppColors.primaryElement,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${course['completedLessons']}/${course['totalLessons']} lessons',
                    style: TextStyle(
                      color: AppColors.primarySecondaryElementText,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    '${(course['progress'] * 100).round()}% Complete',
                    style: TextStyle(
                      color: AppColors.primaryElement,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              LinearProgressIndicator(
                value: course['progress'],
                backgroundColor: AppColors.primaryFourElementText.withOpacity(
                  0.3,
                ),
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primaryElement,
                ),
                minHeight: 6.h,
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryElement,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'Continue Learning',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.primarySecondaryBackground,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(
                      Icons.download_outlined,
                      color: AppColors.primaryElement,
                      size: 20.w,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
