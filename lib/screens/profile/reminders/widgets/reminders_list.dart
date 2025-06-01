import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemindersList extends StatelessWidget {
  const RemindersList({super.key});

  final List<Map<String, dynamic>> reminders = const [
    {
      'title': 'Continue Flutter Course',
      'course': 'Complete Flutter Development',
      'time': '7:00 PM',
      'days': ['Mon', 'Wed', 'Fri'],
      'isActive': true,
      'icon': Icons.code,
    },
    {
      'title': 'Complete UI/UX Assignment',
      'course': 'Advanced UI/UX Design',
      'time': '6:30 PM',
      'days': ['Tue', 'Thu'],
      'isActive': true,
      'icon': Icons.design_services,
    },
    {
      'title': 'Review React Concepts',
      'course': 'React Native Masterclass',
      'time': '8:00 PM',
      'days': ['Sat', 'Sun'],
      'isActive': false,
      'icon': Icons.library_books,
    },
    {
      'title': 'Practice Coding Challenges',
      'course': 'Algorithm & Data Structures',
      'time': '9:00 AM',
      'days': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
      'isActive': true,
      'icon': Icons.terminal,
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
            'Your Reminders',
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
            itemCount: reminders.length,
            itemBuilder: (context, index) {
              final reminder = reminders[index];
              return Container(
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color:
                        reminder['isActive']
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color:
                                reminder['isActive']
                                    ? AppColors.primaryElement.withOpacity(0.1)
                                    : AppColors.primaryThreeElementText
                                        .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            reminder['icon'],
                            color:
                                reminder['isActive']
                                    ? AppColors.primaryElement
                                    : AppColors.primaryThreeElementText,
                            size: 24.w,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reminder['title'],
                                style: TextStyle(
                                  color:
                                      reminder['isActive']
                                          ? AppColors.primaryText
                                          : AppColors
                                              .primarySecondaryElementText,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                reminder['course'],
                                style: TextStyle(
                                  color: AppColors.primarySecondaryElementText,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: reminder['isActive'],
                          onChanged: (value) {
                            // Handle switch toggle
                          },
                          activeColor: AppColors.primaryElement,
                          activeTrackColor: AppColors.primaryElement
                              .withOpacity(0.3),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: AppColors.primarySecondaryElementText,
                          size: 16.w,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          reminder['time'],
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Icon(
                          Icons.calendar_today,
                          color: AppColors.primarySecondaryElementText,
                          size: 16.w,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          (reminder['days'] as List<String>).join(', '),
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              size: 16.w,
                              color: AppColors.primaryElement,
                            ),
                            label: Text(
                              'Edit',
                              style: TextStyle(
                                color: AppColors.primaryElement,
                                fontSize: 14.sp,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.primaryElement),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete_outline,
                              size: 16.w,
                              color: Colors.red,
                            ),
                            label: Text(
                              'Delete',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.sp,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.red),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                        ),
                      ],
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
