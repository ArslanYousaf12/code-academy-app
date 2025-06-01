import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReminderSettings extends StatefulWidget {
  const ReminderSettings({super.key});

  @override
  State<ReminderSettings> createState() => _ReminderSettingsState();
}

class _ReminderSettingsState extends State<ReminderSettings> {
  bool dailyReminders = true;
  bool pushNotifications = true;
  bool emailReminders = false;
  TimeOfDay studyTime = TimeOfDay(hour: 19, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryFourElementText.withOpacity(0.3),
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
          Text(
            'Reminder Settings',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          _buildSwitchTile(
            'Daily Study Reminders',
            'Get reminded to study every day',
            dailyReminders,
            (value) => setState(() => dailyReminders = value),
          ),
          _buildSwitchTile(
            'Push Notifications',
            'Receive notifications on your device',
            pushNotifications,
            (value) => setState(() => pushNotifications = value),
          ),
          _buildSwitchTile(
            'Email Reminders',
            'Get reminders via email',
            emailReminders,
            (value) => setState(() => emailReminders = value),
          ),
          SizedBox(height: 15.h),
          GestureDetector(
            onTap: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: studyTime,
              );
              if (picked != null && picked != studyTime) {
                setState(() => studyTime = picked);
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Study Time',
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'Set your preferred study time',
                        style: TextStyle(
                          color: AppColors.primarySecondaryElementText,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      studyTime.format(context),
                      style: TextStyle(
                        color: AppColors.primaryElement,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primaryElement,
            activeTrackColor: AppColors.primaryElement.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
