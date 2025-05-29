import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileEditImage extends StatelessWidget {
  const ProfileEditImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      padding: EdgeInsets.only(right: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: DecorationImage(
          image: AssetImage("assets/icons/headpic.png"),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomRight,

      child: Image(
        image: AssetImage("assets/icons/edit_3.png"),
        width: 25.w,
        height: 25.h,
      ),
    );
  }
}
