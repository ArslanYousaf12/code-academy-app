import 'package:code_academy_app/common/values/colors.dart';
import 'package:code_academy_app/screens/profile/reminders/widgets/reminders_app_bar.dart';
import 'package:code_academy_app/screens/profile/reminders/widgets/reminder_settings.dart';
import 'package:code_academy_app/screens/profile/reminders/widgets/reminders_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: RemindersAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ReminderSettings(),
              SizedBox(height: 20.h),
              RemindersList(),
            ],
          ),
        ),
      ),
    );
  }
}
