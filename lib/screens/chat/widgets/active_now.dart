import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveNow extends StatelessWidget {
  const ActiveNow({super.key});

  final List<Map<String, String>> activeUsers = const [
    {'name': 'John', 'image': 'assets/icons/headpic.png'},
    {'name': 'Sarah', 'image': 'assets/icons/headpic.png'},
    {'name': 'Mike', 'image': 'assets/icons/headpic.png'},
    {'name': 'Emma', 'image': 'assets/icons/headpic.png'},
    {'name': 'David', 'image': 'assets/icons/headpic.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Active Now',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemCount: activeUsers.length,
            itemBuilder: (context, index) {
              final user = activeUsers[index];
              return Container(
                margin: EdgeInsets.only(right: 15.w),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primaryElement,
                              width: 2.w,
                            ),
                            image: DecorationImage(
                              image: AssetImage(user['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 2.h,
                          right: 2.w,
                          child: Container(
                            width: 12.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2.w,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      user['name']!,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
