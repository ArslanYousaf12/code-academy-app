import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesList extends StatelessWidget {
  final String type;

  const FavoritesList({super.key, required this.type});

  final List<Map<String, dynamic>> favoriteCourses = const [
    {
      'title': 'Complete Flutter Development',
      'instructor': 'Dr. Angela Yu',
      'rating': 4.8,
      'students': '120k',
      'image': 'assets/icons/Image.png',
      'price': '\$89.99',
    },
    {
      'title': 'Advanced UI/UX Design',
      'instructor': 'Jonas Schmedtmann',
      'rating': 4.7,
      'students': '85k',
      'image': 'assets/icons/Image(1).png',
      'price': '\$79.99',
    },
    {
      'title': 'React Native Masterclass',
      'instructor': 'Maximilian Schwarzmüller',
      'rating': 4.6,
      'students': '95k',
      'image': 'assets/icons/Image(2).png',
      'price': '\$94.99',
    },
  ];

  final List<Map<String, dynamic>> favoriteInstructors = const [
    {
      'name': 'Dr. Angela Yu',
      'specialty': 'Flutter & Mobile Development',
      'courses': '15 courses',
      'rating': 4.9,
      'students': '500k+',
      'image': 'assets/icons/person.png',
    },
    {
      'name': 'Jonas Schmedtmann',
      'specialty': 'UI/UX Design & Frontend',
      'courses': '12 courses',
      'rating': 4.8,
      'students': '300k+',
      'image': 'assets/icons/person.png',
    },
    {
      'name': 'Maximilian Schwarzmüller',
      'specialty': 'React & React Native',
      'courses': '20 courses',
      'rating': 4.7,
      'students': '400k+',
      'image': 'assets/icons/person.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final data = type == 'courses' ? favoriteCourses : favoriteInstructors;

    if (data.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80.w,
              color: AppColors.primaryThreeElementText,
            ),
            SizedBox(height: 20.h),
            Text(
              'No favorites yet',
              style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Start adding ${type} to your favorites',
              style: TextStyle(
                color: AppColors.primaryThreeElementText,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Container(
            margin: EdgeInsets.only(bottom: 15.h),
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
            child: Row(
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: AssetImage(item['image']),
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
                        type == 'courses' ? item['title'] : item['name'],
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        type == 'courses'
                            ? item['instructor']
                            : item['specialty'],
                        style: TextStyle(
                          color: AppColors.primarySecondaryElementText,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16.w),
                          SizedBox(width: 4.w),
                          Text(
                            item['rating'].toString(),
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            type == 'courses'
                                ? '(${item['students']})'
                                : item['students'],
                            style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      if (type == 'courses') ...[
                        SizedBox(height: 8.h),
                        Text(
                          item['price'],
                          style: TextStyle(
                            color: AppColors.primaryElement,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ] else ...[
                        SizedBox(height: 5.h),
                        Text(
                          item['courses'],
                          style: TextStyle(
                            color: AppColors.primaryElement,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.red, size: 24.w),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
