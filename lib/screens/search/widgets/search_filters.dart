import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFilters extends StatefulWidget {
  const SearchFilters({super.key});

  @override
  State<SearchFilters> createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters> {
  int selectedFilter = 0;

  final List<String> filters = [
    'All',
    'Programming',
    'Design',
    'Business',
    'Marketing',
    'Photography',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedFilter == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFilter = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryElement : Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color:
                          isSelected
                              ? AppColors.primaryElement
                              : AppColors.primaryFourElementText,
                    ),
                  ),
                  child: Text(
                    filters[index],
                    style: TextStyle(
                      color:
                          isSelected
                              ? Colors.white
                              : AppColors.primarySecondaryElementText,
                      fontSize: 14.sp,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
