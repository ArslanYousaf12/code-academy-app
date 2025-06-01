import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResults extends StatelessWidget {
  final String query;

  const SearchResults({super.key, required this.query});

  final List<Map<String, dynamic>> mockResults = const [
    {
      'title': 'Complete Flutter Development Bootcamp',
      'instructor': 'Dr. Angela Yu',
      'rating': 4.8,
      'students': '120k',
      'price': '\$89.99',
      'image': 'assets/icons/Image.png',
      'duration': '65 hours',
    },
    {
      'title': 'Advanced UI/UX Design Course',
      'instructor': 'Jonas Schmedtmann',
      'rating': 4.7,
      'students': '85k',
      'price': '\$79.99',
      'image': 'assets/icons/Image(1).png',
      'duration': '42 hours',
    },
    {
      'title': 'React Native - The Practical Guide',
      'instructor': 'Maximilian Schwarzmüller',
      'rating': 4.6,
      'students': '95k',
      'price': '\$94.99',
      'image': 'assets/icons/Image(2).png',
      'duration': '58 hours',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Results for "$query"',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          '${mockResults.length} courses found',
          style: TextStyle(
            color: AppColors.primarySecondaryElementText,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 20.h),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: mockResults.length,
          itemBuilder: (context, index) {
            final course = mockResults[index];
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
              child: Row(
                children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
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
                        SizedBox(height: 5.h),
                        Text(
                          course['instructor'],
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16.w),
                            SizedBox(width: 4.w),
                            Text(
                              course['rating'].toString(),
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '(${course['students']})',
                              style: TextStyle(
                                color: AppColors.primarySecondaryElementText,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              course['price'],
                              style: TextStyle(
                                color: AppColors.primaryElement,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              course['duration'],
                              style: TextStyle(
                                color: AppColors.primarySecondaryElementText,
                                fontSize: 12.sp,
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
    );
  }
}
