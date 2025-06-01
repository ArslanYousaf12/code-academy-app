import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key});

  final List<Map<String, String>> suggestions = const [
    {'title': 'Flutter Development', 'category': 'Programming'},
    {'title': 'UI/UX Design', 'category': 'Design'},
    {'title': 'React Native', 'category': 'Programming'},
    {'title': 'Digital Marketing', 'category': 'Marketing'},
    {'title': 'Photography Basics', 'category': 'Photography'},
    {'title': 'Business Strategy', 'category': 'Business'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Searches',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15.h),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            final suggestion = suggestions[index];
            return Container(
              margin: EdgeInsets.only(bottom: 12.h),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(
                      Icons.trending_up,
                      color: AppColors.primaryElement,
                      size: 20.w,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          suggestion['title']!,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          suggestion['category']!,
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.primaryThreeElementText,
                    size: 16.w,
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
