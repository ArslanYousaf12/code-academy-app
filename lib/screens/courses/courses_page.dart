import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/courses/widgets/courses_app_bar.dart';
import 'package:code_academy_app/screens/courses/widgets/course_stats.dart';
import 'package:code_academy_app/screens/courses/widgets/enrolled_courses.dart';
import 'package:code_academy_app/screens/courses/widgets/continue_learning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CoursesAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            CourseStats(),
            SizedBox(height: 20.h),
            TabBar(
              controller: _tabController,
              labelColor: AppColors.primaryElement,
              unselectedLabelColor: AppColors.primarySecondaryElementText,
              indicatorColor: AppColors.primaryElement,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
              tabs: [
                Tab(text: 'Enrolled'),
                Tab(text: 'Continue'),
                Tab(text: 'Completed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  EnrolledCourses(),
                  ContinueLearning(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 80.w,
                          color: AppColors.primaryThreeElementText,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'No completed courses yet',
                          style: TextStyle(
                            color: AppColors.primarySecondaryElementText,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Start learning to see your progress here',
                          style: TextStyle(
                            color: AppColors.primaryThreeElementText,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
