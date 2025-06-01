import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueLearning extends StatelessWidget {
  const ContinueLearning({super.key});

  final List<Map<String, dynamic>> continueCourses = const [
    {
      'title': 'Flutter Development Masterclass',
      'instructor': 'Dr. Angela Yu',
      'currentLesson': 'State Management with BLoC',
      'lessonNumber': 82,
      'totalLessons': 125,
      'progress': 0.65,
      'timeLeft': '45 min',
      'image': 'assets/icons/Image.png',
    },
    {
      'title': 'Advanced UI/UX Design',
      'instructor': 'Jonas Schmedtmann',
      'currentLesson': 'Prototyping in Figma',
      'lessonNumber': 41,
      'totalLessons': 89,
      'progress': 0.45,
      'timeLeft': '32 min',
      'image': 'assets/icons/Image(1).png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20.w),
      itemCount: continueCourses.length,
      itemBuilder: (context, index) {
        final course = continueCourses[index];
        return Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 15,
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
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
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
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          course['instructor'],
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(
                              Icons.play_circle_fill,
                              color: AppColors.primaryElement,
                              size: 16.w,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              '${course['timeLeft']} left',
                              style: TextStyle(
                                color: AppColors.primaryElement,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: AppColors.primarySecondaryBackground,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lesson ${course['lessonNumber']}',
                          style: TextStyle(
                            color: AppColors.primaryElement,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${course['lessonNumber']}/${course['totalLessons']}',
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      course['currentLesson'],
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    LinearProgressIndicator(
                      value: course['progress'],
                      backgroundColor: AppColors.primaryFourElementText
                          .withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primaryElement,
                      ),
                      minHeight: 6.h,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 20.w,
                      ),
                      label: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryElement,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.bookmark_outline,
                      color: AppColors.primaryElement,
                      size: 20.w,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
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
