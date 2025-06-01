import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchievementList extends StatelessWidget {
  const AchievementList({super.key});

  final List<Map<String, dynamic>> achievements = const [
    {
      'title': 'First Course Completed',
      'description': 'Completed your first online course',
      'icon': Icons.school,
      'points': 50,
      'isUnlocked': true,
      'date': '2024-04-15',
    },
    {
      'title': 'Speed Learner',
      'description': 'Completed a course in under 7 days',
      'icon': Icons.flash_on,
      'points': 100,
      'isUnlocked': true,
      'date': '2024-04-22',
    },
    {
      'title': 'Dedicated Student',
      'description': 'Logged in for 7 consecutive days',
      'icon': Icons.event_available,
      'points': 75,
      'isUnlocked': true,
      'date': '2024-05-01',
    },
    {
      'title': 'Quiz Master',
      'description': 'Scored 100% on 5 quizzes',
      'icon': Icons.quiz,
      'points': 150,
      'isUnlocked': false,
      'progress': 3,
      'total': 5,
    },
    {
      'title': 'Course Collection',
      'description': 'Enroll in 10 different courses',
      'icon': Icons.library_books,
      'points': 200,
      'isUnlocked': false,
      'progress': 5,
      'total': 10,
    },
    {
      'title': 'Certificate Hunter',
      'description': 'Earn 10 course certificates',
      'icon': Icons.workspace_premium,
      'points': 300,
      'isUnlocked': false,
      'progress': 5,
      'total': 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Achievements',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: achievements.length,
            itemBuilder: (context, index) {
              final achievement = achievements[index];
              return Container(
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color:
                        achievement['isUnlocked']
                            ? AppColors.primaryElement.withOpacity(0.3)
                            : AppColors.primaryFourElementText.withOpacity(0.3),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color:
                            achievement['isUnlocked']
                                ? AppColors.primaryElement.withOpacity(0.1)
                                : AppColors.primaryThreeElementText.withOpacity(
                                  0.1,
                                ),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Icon(
                        achievement['icon'],
                        color:
                            achievement['isUnlocked']
                                ? AppColors.primaryElement
                                : AppColors.primaryThreeElementText,
                        size: 30.w,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  achievement['title'],
                                  style: TextStyle(
                                    color:
                                        achievement['isUnlocked']
                                            ? AppColors.primaryText
                                            : AppColors
                                                .primarySecondaryElementText,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      achievement['isUnlocked']
                                          ? Colors.orange.withOpacity(0.1)
                                          : AppColors.primaryThreeElementText
                                              .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Text(
                                  '${achievement['points']}pts',
                                  style: TextStyle(
                                    color:
                                        achievement['isUnlocked']
                                            ? Colors.orange
                                            : AppColors.primaryThreeElementText,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            achievement['description'],
                            style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          if (achievement['isUnlocked'])
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 16.w,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  'Unlocked on ${achievement['date']}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          else
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Progress',
                                      style: TextStyle(
                                        color:
                                            AppColors
                                                .primarySecondaryElementText,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(
                                      '${achievement['progress']}/${achievement['total']}',
                                      style: TextStyle(
                                        color: AppColors.primaryElement,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                LinearProgressIndicator(
                                  value:
                                      achievement['progress'] /
                                      achievement['total'],
                                  backgroundColor: AppColors
                                      .primaryFourElementText
                                      .withOpacity(0.3),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primaryElement,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
