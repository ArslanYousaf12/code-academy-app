import 'package:code_academy_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Messages',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Video call feature coming soon!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          icon: Icon(
            Icons.videocam_outlined,
            color: AppColors.primaryText,
            size: 24.w,
          ),
        ),
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Create new chat feature coming soon!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          icon: Icon(
            Icons.edit_outlined,
            color: AppColors.primaryText,
            size: 24.w,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
