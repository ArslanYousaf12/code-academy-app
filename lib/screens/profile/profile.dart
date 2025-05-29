import 'package:code_academy_app/screens/profile/widgets/profile_app_bar.dart';
import 'package:code_academy_app/screens/profile/widgets/profile_edit_image.dart';
import 'package:code_academy_app/screens/profile/widgets/profile_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProfileAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileEditImage(),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: ProfileListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
