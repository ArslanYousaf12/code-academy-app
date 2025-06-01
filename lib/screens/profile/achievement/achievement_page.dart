import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/profile/achievement/widgets/achievement_app_bar.dart';
import 'package:code_academy_app/screens/profile/achievement/widgets/achievement_stats.dart';
import 'package:code_academy_app/screens/profile/achievement/widgets/achievement_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AchievementAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AchievementStats(),
              SizedBox(height: 20.h),
              AchievementList(),
            ],
          ),
        ),
      ),
    );
  }
}
